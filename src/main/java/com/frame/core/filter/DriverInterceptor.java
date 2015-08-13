package com.frame.core.filter;

import com.frame.core.util.HttpUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator on 2015/1/27.
 */
public class DriverInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    InternalResourceViewResolver internalResourceViewResolver;

    public void postHandle(HttpServletRequest request,HttpServletResponse response, Object o, ModelAndView mav) throws Exception {
        internalResourceViewResolver.setCache(false);
        if ( !request.getRequestURI().startsWith("/manage")) {
            if (!HttpUtil.isPhone(request)) {
                internalResourceViewResolver.setPrefix("/WEB-INF/springmvc/pc");
            } else {
                internalResourceViewResolver.setPrefix("/WEB-INF/springmvc/mobile");
            }
        } else {
            internalResourceViewResolver.setPrefix("/WEB-INF/springmvc/");
        }
    }
}
