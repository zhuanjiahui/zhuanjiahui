package com.zhuanjiahui.basic.controller;

import com.frame.core.base.service.BaseManager;
import com.frame.core.p.model.ZJHidGenerator;
import com.frame.core.taglib.PageEntity;
import com.frame.core.util.AuthorizationUtil;
import com.frame.core.util.OSSClientService;
import com.frame.core.util.PageInfo;
import com.frame.core.util.StringUtil;
import com.frame.organization.model.MyUser;
import com.frame.organization.model.User;
import com.frame.organization.service.CityManager;
import com.zhuanjiahui.basic.model.Activity;
import com.zhuanjiahui.basic.model.ActivityDiscuss;
import com.zhuanjiahui.basic.model.ActivityGuest;
import com.zhuanjiahui.basic.service.ActivityManager;
import com.zhuanjiahui.character.model.Expert;
import com.zhuanjiahui.character.service.ExpertManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by Administrator on 2015/7/3.
 */
@Controller
@RequestMapping(value = "/pc/activity")
public class ActivityController extends BaseController{
    @Autowired
    private ActivityManager activityManager;
    @Autowired
    private ExpertManager expertManager;
    @Autowired
    private BaseManager baseManager;
    @Autowired
    private CityManager cityManager;
    @Autowired
    private OSSClientService ossClientService;
    @RequestMapping(value="/pageList")
    public String listActivities(HttpServletRequest request,ModelMap modelMap){
        PageEntity pageEntity=this.getPageEntity(request);
        LinkedHashMap<String,Object> queryParams=new LinkedHashMap<>();
        String typeTemp=request.getParameter("type");
        String industry=request.getParameter("industry");
        String orderBy=request.getParameter("orderBy");
        if(typeTemp!=null&&!typeTemp.equals("")){
            int type=Integer.parseInt(typeTemp);
            modelMap.put("type",type);
            queryParams.put("type",type);

        }
        if(industry!=null&&!industry.equals("")){
            modelMap.put("industry",industry);
            queryParams.put("industry",industry);

        }
        List<Object> homeExperts=expertManager.getHomeExpert(4);
        PageInfo pageInfo=activityManager.getPageActivities(pageEntity, queryParams, orderBy);
        modelMap.put("homeExperts",homeExperts);
        modelMap.put("pageEntity",pageInfo.getPageEntity());
        modelMap.put("pageInfo",pageInfo);
        return "/basic/activityList";
    }
    /*
    * 活动详情页*/
    @RequestMapping(value = "/view")
    public String viewActivity(HttpServletRequest request,Model model){
        String activityId=request.getParameter("activityId");
        Activity activity=(Activity)baseManager.getObject(Activity.class.getName(),activityId);
        model.addAttribute("activity",activity);
        return "/basic/activityView";
    }
    /*立即报名--》购物车--》支付*/

    /*
    * 发布活动*/
     @RequestMapping(value = "/publish")
     public String publishActivity(Model model){
        String activityId= StringUtil.random(16,4);
        model.addAttribute("id",activityId);
        model.addAttribute("myUser",AuthorizationUtil.getMyUser());
        model.addAttribute("provinces",cityManager.getProvinces());
        return "/basic/activityForm";
    }


    /*
    * 保存活动*/
     @RequestMapping(value = "/save")
     public String saveActivity(Activity activity,HttpServletRequest request) throws ParseException {
        User expert=AuthorizationUtil.getUser();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm");
        Date activityDate=simpleDateFormat.parse(request.getParameter("startDatetime")) ;
        Date activityDate2=simpleDateFormat.parse(request.getParameter("endDatetime"));
        activity.setActivityDate(activityDate);
        activity.setActivityDate2(activityDate2);
        activity.setExpert(expert);
        activity.setFavoriteCount(0);
        activity.setVisitCount(0);
        activity.setRealCount(0);
        activity.setCreateDatetime(new Date());
        activity.setUserNumber(0);
        activity.setTheStatus(1);
        baseManager.saveObject(activity);
        return "redirect:/pc/activity/pageList";
    }
    @RequestMapping(value = "/uploadPic")
    @ResponseBody
    public String uploadActivityPic(MultipartRequest multipartRequest) throws IOException {
        MultipartFile multipartFile = multipartRequest.getFiles("Filedata").get(0);
        String uploadUrl = "activity/common/" + multipartFile.getOriginalFilename();
        InputStream content = multipartFile.getInputStream();
        long size = multipartFile.getSize();
        ossClientService.putObject("zhuanjiahui", uploadUrl, content, size);
        return uploadUrl;
    }
    @RequestMapping(value = "/uploadGuestPic")
    @ResponseBody
    public String uploadActivityGuestPic(MultipartRequest multipartRequest) throws IOException {
        MultipartFile multipartFile = multipartRequest.getFiles("Filedata").get(0);
        String uploadUrl = "activity/guest/" + multipartFile.getOriginalFilename();
        InputStream content = multipartFile.getInputStream();
        long size = multipartFile.getSize();
        ossClientService.putObject("zhuanjiahui", uploadUrl, content, size);
        return uploadUrl;
    }
    @RequestMapping(value = "/myActivity")
    public String getMyActivitys(HttpServletRequest request,ModelMap modelMap){
        String userId=AuthorizationUtil.getMyUser().getId();
        PageEntity pageEntity=this.getPageEntity(request);
        pageEntity.setSize(5);
        PageInfo pageInfo=activityManager.publishActivities(userId,pageEntity);
        modelMap.put("myUser",AuthorizationUtil.getMyUser());
        modelMap.put("pageInfo",pageInfo);
        modelMap.put("pageEntity",pageEntity);
        return "/basic/myActivities";

    }
    /*保存活动嘉宾*/
    @RequestMapping(value = "/saveGuest")
    @ResponseBody
    public ActivityGuest saveGuest(ActivityGuest activityGuest){
        baseManager.saveOrUpdate(ActivityGuest.class.getName(),activityGuest);
        return activityGuest;
    }
    /*保存活动讨论*/
    @RequestMapping(value = "/saveDiscuss")
    @ResponseBody
    public ActivityDiscuss saveDiscuss(ActivityDiscuss activityDiscuss,HttpServletRequest request){
        String activityId=request.getParameter("activityId");
        activityDiscuss.setCreateDatetime(new Date());
        activityDiscuss.setConsumer(AuthorizationUtil.getUser());
        baseManager.saveOrUpdate(ActivityDiscuss.class.getName(),activityDiscuss);
        return activityDiscuss;
    }
}
