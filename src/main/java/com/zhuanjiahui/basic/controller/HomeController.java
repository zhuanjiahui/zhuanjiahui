package com.zhuanjiahui.basic.controller;

import com.frame.core.util.AuthorizationUtil;
import com.frame.organization.model.MyUser;
import com.frame.organization.service.CityManager;
import com.zhuanjiahui.basic.service.ActivityManager;
import com.zhuanjiahui.basic.service.MajorManager;
import com.zhuanjiahui.basic.service.RequirementManager;
import com.zhuanjiahui.basic.service.impl.MajorManagerImpl;
import com.zhuanjiahui.character.service.AssistantManager;
import com.zhuanjiahui.character.service.ExpertManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;


/**
 * Created by Administrator on 2015/6/24.
 */
@Controller
@RequestMapping(value = "/pc")
public class HomeController {
    @Autowired
    private ExpertManager expertManager;
    @Autowired
    private AssistantManager assistantManager;
    @Autowired
    private ActivityManager activityManager;
    @Autowired
    private RequirementManager requirementManager;
    @Autowired
    private MajorManager majorManager;
    @Autowired
    private CityManager  cityManager;
    @RequestMapping(value = "/index")
    public String homePage(HttpServletRequest request,ModelMap modelMap){
        modelMap.put("majorTypes", majorManager.getMajorTypes());
        modelMap.put("experts",expertManager.getNewExpert(6));
        modelMap.put("popularExperts",expertManager.popularExpert(6));
        modelMap.put("assistants",assistantManager.popularAssistants(6));
        modelMap.put("activities",activityManager.getNewActivities(5));
        modelMap.put("requirements",requirementManager.getNewRequirements(5));
        return "/index";
    };
    @RequestMapping(value="login")
    public String login(HttpServletRequest request, Model model) {
        if (request.getParameter("redirect") != null) {
            String redirectUrl = request.getParameter("redirect");
            model.addAttribute("redirect", redirectUrl);
        }
        if (request.getParameter("error") != null && request.getParameter("error").equals("true")) {
            model.addAttribute("message", "用户名密码不匹配");
        } else if ("1".equals(request.getParameter("updatePsw"))) {
            model.addAttribute("message", "密码修改成功");
        }
        model.addAttribute("enrollUsername", request.getParameter("enrollUsername"));
        return "/basic/login";
    }
    /*切换用户类型*/
    @RequestMapping(value = "/switchUser")
    public String switchUType(){
        MyUser user=AuthorizationUtil.getMyUser();
        if(user.getUtype()==1){
            expertManager.switchUtype(2,user.getId());
            return "redirect:/pc/login";
        }else{
            expertManager.switchUtype(1,user.getId());
            return "redirect:/pc/login";
        }
    }

}
