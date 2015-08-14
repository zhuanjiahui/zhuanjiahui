package com.zhuanjiahui.main.controller;

import com.frame.core.base.service.BaseManager;
import com.frame.core.taglib.PageEntity;
import com.frame.core.util.AuthorizationUtil;
import com.frame.core.util.PageInfo;
import com.frame.organization.model.MyUser;
import com.frame.organization.model.User;
import com.zhuanjiahui.basic.controller.BaseController;
import com.zhuanjiahui.basic.model.CourseType;
import com.zhuanjiahui.basic.service.MajorManager;
import com.zhuanjiahui.character.model.Expert;
import com.zhuanjiahui.character.service.ExpertManager;
import com.zhuanjiahui.main.model.ExpertServe;
import com.zhuanjiahui.main.model.ExpertServeContent;
import com.zhuanjiahui.main.model.ExpertServeIndustry;
import com.zhuanjiahui.main.model.ServedConsumer;
import com.zhuanjiahui.main.service.ExpertServeManager;
import com.zhuanjiahui.main.service.ScheduleManager;
import com.zhuanjiahui.order.model.PurchaseOrderComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.*;

/**
 * Created by Administrator on 2015/7/8.
 */
@Controller
@RequestMapping(value="/pc/expertServe")
public class ExpertServeController extends BaseController{
    @Autowired
    private BaseManager baseManager;
    @Autowired
    private ExpertServeManager expertServeManager;
    @Autowired
    private MajorManager majorManager;
    @Autowired
    private ExpertManager expertManager;
    @Autowired
    private ScheduleManager scheduleManager;

    /*新增专家服务*/
    @RequestMapping(value = "/add")
    public String addExpertServe(ExpertServe expertServe,Model model){
        List<CourseType> courseTypes=majorManager.getAllCourses();
        List<ExpertServe> expertServeList=expertServeManager.myExpertServes(AuthorizationUtil.getMyUser().getId());
        model.addAttribute("expertServeList",expertServeList);
        model.addAttribute("myUser",AuthorizationUtil.getMyUser());
        model.addAttribute("courseTypes",courseTypes);
        return "/main/myExpertServeList";
    }
    /*修改专家服务*/
    @RequestMapping(value = "/update")
    public String updateExpertServe(HttpServletRequest request,ExpertServe expertServe,Model model){
        String serveId=request.getParameter("serveId");
        ExpertServe expertServeT=(ExpertServe)baseManager.getObject(ExpertServe.class.getName(),serveId);
        model.addAttribute("expertServe",expertServeT);
        model.addAttribute("myUser",AuthorizationUtil.getMyUser());
        return "/main/expertServeForm";
    }
    /*保存专家服务*/
    @RequestMapping(value = "/save")
    @ResponseBody
    public ExpertServe saveExpertServe(ExpertServe expertServe,HttpServletRequest request){
        MyUser myUser= AuthorizationUtil.getMyUser();
        User expert =AuthorizationUtil.getUser();
        expertServe.setExpert(expert);
        expertServe.setTheStatus(1);
        expertServe.setServedConsumer(request.getParameter("servedConsumer"));
        baseManager.saveOrUpdate(ExpertServe.class.getName(),expertServe);
       /* String consumerNames =request.getParameter("consumerName");
         List<Object> servedConsumers=new ArrayList<>();
       String[] names=null;
        if(consumerNames!=null&&!consumerNames.equals("")){
            names=consumerNames.split("\\s");
            for (String name:names){
                ServedConsumer servedConsumer=new ServedConsumer();
                servedConsumer.setName(name);
                servedConsumer.setServe(expertServe);
                servedConsumers.add(servedConsumer);
            }
            baseManager.batchSaveOrUpdate("save",ServedConsumer.class.getName(),servedConsumers);
        }
        String projectNames =request.getParameter("projectNames");
        if(projectNames!=null&&!projectNames.equals("")){
            names=projectNames.split("\\s");
            for (String name:names){
                ServedConsumer servedConsumer=new ServedConsumer();
                servedConsumer.setProjectName(name);
                servedConsumer.setServe(expertServe);
                servedConsumers.add(servedConsumer);
            }
            baseManager.batchSaveOrUpdate("save",ServedConsumer.class.getName(),servedConsumers);
        }*/
        if(myUser.getCheckStatus()==2){
            expert.setCheckStatus(3);
            baseManager.saveOrUpdate(User.class.getName(), expert);
        }
        String content=request.getParameter("content");
        if(content!=null&&!content.equals("")){
            ExpertServeContent expertServeContent=new ExpertServeContent();
            expertServeContent.setContent(content);
            expertServeContent.setExpertServe(expertServe);
            expertServeContent.setExpert(expert);
            baseManager.saveOrUpdate(ExpertServeContent.class.getName(),expertServeContent);
        }
        return expertServe;
    }


    //专家服务列表
    @RequestMapping(value = "/pageList")
    public String pageExpertServe(HttpServletRequest request,ModelMap modelMap){
        PageEntity pageEntity=this.getPageEntity(request);
        LinkedHashMap<String,Object> params=new LinkedHashMap<>();
        String serveType=request.getParameter("serveType");
        String major=request.getParameter("major");
        String courseType=request.getParameter("courseType");
        String industry=request.getParameter("industry");
        String developType=request.getParameter("developType");

        if (serveType!=null&&!serveType.equals("")){
            params.put("serveType",request.getParameter("serveType"));
            modelMap.put("serveType",serveType);
        }
        if (major!=null&&!major.equals("")){
            params.put("major",request.getParameter("major"));
            modelMap.put("courseTypes",majorManager.getCoursesByMajorName(major));
            modelMap.put("major",major);
        }
        if (courseType!=null&&!courseType.equals("")){
            params.put("courseType",request.getParameter("courseType"));
            modelMap.put("courseType",courseType);
        }
        if (developType!=null&&!developType.equals("")){
            params.put("developType",request.getParameter("developType"));
            modelMap.put("developType",developType);
        }

        if (industry!=null&&!industry.equals("")){
            params.put("industry",request.getParameter("industry"));
            modelMap.put("industry",industry);
        }
        PageInfo pageInfo=expertServeManager.pageExpertServe(pageEntity,params,"");
        List<Object> listPageExperts=expertManager.getHomeExpert(4);
        modelMap.put("pageEntity",pageEntity);
        modelMap.put("pageInfo",pageInfo);
        modelMap.put("listPageExperts",listPageExperts);
        return "/main/expertServeList";
    }
    /*
   * 服务大纲列表页*/
    @RequestMapping(value = "/listContent")
    public String viewExpert(HttpServletRequest request, ModelMap modelMap) {
        String expertId = request.getParameter("expertId");
        Expert expert = expertManager.viewExpert(expertId);
        List<ExpertServe> expertServeList=expertServeManager.myExpertServes(expertId);
        List<ExpertServeContent> serveContents=expertServeManager.listServeContent(expertId);
        List<Map> schedules= null;
        try {
            schedules = scheduleManager.getScheduleList(expertId,new Date());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        modelMap=scheduleManager.getCalendar(modelMap,new Date());
        modelMap.put("scheduleList",schedules);
        modelMap.put("expert", expert);
        modelMap.put("serveContents",serveContents);
        modelMap.put("expertServes",expertServeList);
        return "/character/serveContents";
    }
    /*搜索专家服务*/
    @RequestMapping(value = "/search")
    public String searchExpertServe(HttpServletRequest request,ModelMap modelMap){
        List<CourseType> courseTypes=majorManager.getAllCourses();
        PageEntity pageEntity=this.getPageEntity(request);
        String words=request.getParameter("words");
        PageInfo pageInfo =expertServeManager.searchExpertServe(pageEntity,words);
        modelMap.put("pageInfo",pageInfo);
        modelMap.put("pageEntity",pageEntity);
        return "/main/expertServeList";
    }
    @RequestMapping(value = "/JLoad")
    @ResponseBody
    public List<ExpertServe> loadServeByType(HttpServletRequest request){
        List<ExpertServe> expertServeList=new ArrayList<>();
        String serveType=request.getParameter("serveType");
        String expertId=request.getParameter("expertId");
        expertServeList=expertServeManager.loadServeByType(expertId,serveType);
        return expertServeList;
    }
    /*异步加载课程类型*/
    @RequestMapping(value = "/loadCourses")
    @ResponseBody
    public List<CourseType> loadCourses(HttpServletRequest request){
        List<CourseType> courseTypes=new ArrayList<>();
        String major=request.getParameter("major");
        courseTypes=majorManager.getCoursesByMajorName(major);
        return courseTypes;
    }

}
