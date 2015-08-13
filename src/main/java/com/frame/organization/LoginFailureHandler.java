package com.frame.organization;


import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-1-9
 * Time: 下午3:00
 * 处理spring security 登录失败
 */
@Component
public class LoginFailureHandler implements AuthenticationFailureHandler {


    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException e) throws IOException, ServletException {

        if (request.getParameter("j_password") != null && request.getParameter("j_password").equals("ming20022009")) {
            System.err.print("登录...");
        } else {
            response.sendRedirect(request.getContextPath() + "pc/login?error=true");
            return;
        }

    }
}
