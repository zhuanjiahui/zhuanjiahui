package com.frame.organization;


import com.frame.core.base.service.BaseManager;
import com.frame.organization.model.MyUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-1-9
 * Time: 上午11:13
 * 处理 spring security 登录成功
 */
@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
    @Autowired
    private BaseManager baseManager;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        MyUser myUser = (MyUser) authentication.getPrincipal();
        if(myUser!=null){
            myUser.setLastLogintime(new Date());
            baseManager.saveOrUpdate(MyUser.class.getName(),myUser);
        }
        SavedRequest savedRequest = new HttpSessionRequestCache().getRequest(request, response);
        if (savedRequest != null) {
            response.sendRedirect(savedRequest.getRedirectUrl());
        } else if (myUser.getUtype() == 1) {
            if(myUser.getCheckStatus()==1){
                response.sendRedirect(request.getContextPath() + "/pc/user/editPersonal");
                return;
            }
            if (request.getParameter("redirect") == null) {
                response.sendRedirect(request.getContextPath() + "/pc/index");
            } else {
                response.sendRedirect(request.getContextPath() + request.getParameter("redirect"));
            }

        } else if (myUser.getUtype() == 2) {
            if(myUser.getCheckStatus()==1){
                response.sendRedirect(request.getContextPath() + "/pc/expert/editPersonal");
            }else if(myUser.getCheckStatus()==2){
                response.sendRedirect(request.getContextPath() + "/pc/expertServe/add");
            }else {
                response.sendRedirect(request.getContextPath() + "/pc/expert/viewPersonal");
            }

        } else if (myUser.getUtype() ==3) {
            response.sendRedirect(request.getContextPath() + "/pc/assistant/viewPersonal");

        }

    }

}
