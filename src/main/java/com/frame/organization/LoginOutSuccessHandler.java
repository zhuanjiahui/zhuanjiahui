package com.frame.organization;


import com.frame.organization.model.MyUser;
import com.frame.organization.model.User2;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * Created by hean on 2014/8/4.
 */
public class LoginOutSuccessHandler extends
        SimpleUrlLogoutSuccessHandler implements LogoutSuccessHandler {


    @Override
    public void onLogoutSuccess
            (HttpServletRequest request, HttpServletResponse response, Authentication authentication)
            throws IOException, ServletException {
        if (authentication != null) {
            MyUser myUser = (MyUser) authentication.getPrincipal();
            if (myUser != null ) {
               response.sendRedirect(request.getContextPath() + "/pc/index");
            }
        }

        super.onLogoutSuccess(request, response, authentication);
    }
}

