package com.zhuanjiahui.basic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2015/7/22.
 */
@Controller
@RequestMapping(value = "/pc/static")
public class HtmlController {
    @RequestMapping(value = "{pageName}")
    public String staticPages(HttpServletRequest request,@PathVariable String pageName){
        return "/static/"+pageName;
    }
}
