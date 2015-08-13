package com.zhuanjiahui.manage.controller;

import com.frame.core.taglib.PageEntity;
import com.frame.core.util.PageInfo;
import com.zhuanjiahui.manage.service.SystemManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2015/6/29.
 */
@Controller
@RequestMapping(value = "/manage")
public class SystemController {
    @Autowired
    private SystemManager systemManager;
    @RequestMapping(value = {"main","main.do"})
    public String toMain(Model model){
        PageEntity pageEntity=new PageEntity();
        pageEntity.setIndex(1);
        pageEntity.setSize(10);
        PageInfo pageInfo=systemManager.getPageExpertList(pageEntity);
        model.addAttribute("pageInfo",pageInfo);
        return "/manage/index";
    }
}
