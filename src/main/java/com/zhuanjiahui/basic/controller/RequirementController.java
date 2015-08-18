package com.zhuanjiahui.basic.controller;

import com.frame.core.base.service.BaseManager;
import com.frame.core.taglib.PageEntity;
import com.frame.core.util.AuthorizationUtil;
import com.frame.core.util.PageInfo;
import com.frame.organization.model.User;
import com.frame.organization.service.CityManager;

import com.zhuanjiahui.basic.model.ActivityDiscuss;
import com.zhuanjiahui.basic.model.Requirement;
import com.zhuanjiahui.basic.model.RequirementDiscuss;
import com.zhuanjiahui.basic.service.MajorManager;
import com.zhuanjiahui.basic.service.RequirementManager;
import com.zhuanjiahui.character.service.ExpertManager;
import com.zhuanjiahui.main.service.ExpertServeManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by Administrator on 2015/7/7.
 */
@Controller
@RequestMapping(value = "/pc/requirement")
public class RequirementController extends BaseController{
    @Autowired
    private BaseManager baseManager;
    @Autowired
    private RequirementManager requirementManager;
    @Autowired
    private ExpertManager expertManager;
    @Autowired
    private CityManager cityManager;
    @Autowired
    private MajorManager majorManager;
    @RequestMapping(value="/pageList")
    public String listActivities(HttpServletRequest request,ModelMap modelMap){
        PageEntity pageEntity=this.getPageEntity(request);
        LinkedHashMap<String,Object> queryParams=this.getConditionMap(request);
        String type=request.getParameter("type");
        String industry=request.getParameter("industry");
        String major=request.getParameter("major");
        String courseType=request.getParameter("courseType");
        String developType=request.getParameter("developType");
        String orderBy=request.getParameter("orderBy");
        if(type!=null&&!type.equals("")){
            modelMap.put("type",type);
            queryParams.put("type",type);
        }
        if(industry!=null&&!industry.equals("")){
            modelMap.put("industry",industry);
            queryParams.put("industry",industry);
        }
        if(major!=null&&!major.equals("")){
            queryParams.put("major",request.getParameter("major"));
            modelMap.put("courseTypes",majorManager.getCoursesByMajorName(major));
            modelMap.put("major",major);
        }
        if(courseType!=null&&!courseType.equals("")){
            modelMap.put("courseType",courseType);
            queryParams.put("courseType",courseType);
        }
        if(developType!=null&&!developType.equals("")){
            modelMap.put("developType",developType);
            queryParams.put("developType",developType);
        }
        PageInfo pageInfo=requirementManager.getPageRequirement(pageEntity, queryParams, orderBy);
        List<Object> listPageExperts=expertManager.getHomeExpert(4);
        modelMap.put("listPageExperts",listPageExperts);
        modelMap.put("pageEntity",pageEntity);
        modelMap.put("pageInfo",pageInfo);
        return "/basic/requirementList";
    }
    /*
    * 需求详情页*/
    @RequestMapping(value = "/view")
    public String viewRequirement(HttpServletRequest request,Model model){
        String requirementId=request.getParameter("requirementId");
        Requirement requirement=(Requirement)baseManager.getObject(Requirement.class.getName(),requirementId);
        model.addAttribute("requirement",requirement);
        return "/basic/requirementView";
    }
    /*
     * 发布需求*/
    @RequestMapping(value = "/publish")
    public String publishRequirement(HttpServletRequest request,Model model){
        model.addAttribute("provinces",cityManager.getProvinces());
        model.addAttribute("myUser",AuthorizationUtil.getMyUser());
        return "/basic/requirementForm";
    }
    /*
     * 保存需求*/
     @RequestMapping(value = "/save")
     public String saveRequirement(Requirement requirement,HttpServletRequest request){
        User expert=AuthorizationUtil.getUser();
        String provinceId=request.getParameter("provinceId");
        requirement.setProvince(cityManager.getProvince(provinceId));
        requirement.setExpert(expert);
        String startDate=request.getParameter("startDate");
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
         try {
             requirement.setStartDatetime(simpleDateFormat.parse(startDate));
         } catch (ParseException e) {
             e.printStackTrace();
         }
        requirement.setFavoriteCount(0);
        requirement.setCreateDatetime(new Date());
        requirement.setTheStatus(1);
        baseManager.saveOrUpdate(Requirement.class.getName(),requirement);
        return "redirect:/pc/requirement/pageList";
    }
    /*我发布的需求*/
    @RequestMapping(value = "/myPublish")
    public String myPublishRequirement(HttpServletRequest request,Model model){
        PageEntity pageEntity=this.getPageEntity(request);
        PageInfo pageInfo=requirementManager.publishRequirements(pageEntity,AuthorizationUtil.getMyUser().getId());
        model.addAttribute("myUser",AuthorizationUtil.getMyUser());
        model.addAttribute("pageEntity",pageEntity);
        model.addAttribute("pageInfo",pageInfo);
        return "/basic/myRequirementList";
    }
    /*保存需求讨论内容*/
    @RequestMapping(value = "/saveDiscuss")
    @ResponseBody
    public Boolean saveDiscuss(RequirementDiscuss requirementDiscuss,HttpServletRequest request){
        String requirementId=request.getParameter("requirementId");
        Requirement requirement=(Requirement)baseManager.getObject(Requirement.class.getName(),requirementId);
        requirementDiscuss.setRequirement(requirement);
        requirementDiscuss.setCreateDatetime(new Date());
        requirementDiscuss.setConsumer(AuthorizationUtil.getUser());
        baseManager.saveOrUpdate(RequirementDiscuss.class.getName(),requirementDiscuss);
        return true;
    }
    /*撤回需求*/
    @RequestMapping(value = "/close")
    @ResponseBody
    public Boolean closeRequirement(HttpServletRequest request){
        String requirementId=request.getParameter("requirementId");
        Requirement requirement=(Requirement)baseManager.getObject(Requirement.class.getName(),requirementId);
        requirement.setTheStatus(-1);
        baseManager.saveOrUpdate(Requirement.class.getName(),requirement);
        return true;
    }
}
