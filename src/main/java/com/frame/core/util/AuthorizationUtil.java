package com.frame.core.util;

import com.frame.organization.model.BigUser;
import com.frame.organization.model.MyUser;

import com.frame.organization.model.User;
import com.frame.organization.model.User2;
import com.zhuanjiahui.character.model.Expert;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;


/**
 * @author ZhouYongChao
 */
public class AuthorizationUtil {

    /*
    * 获取当前用户*/
    public static MyUser getMyUser() {
        SecurityContext securityContext = SecurityContextHolder.getContext();
        Authentication authentication = securityContext.getAuthentication();
        try {
            return (MyUser) authentication.getPrincipal();
        } catch (Exception e) {
            MyUser myUser=new MyUser();
            return myUser;
        }
    }


    public static Expert getExpert() {
        SecurityContext securityContext = SecurityContextHolder.getContext();
        Authentication authentication = securityContext.getAuthentication();
        try {
            BigUser user = (BigUser) authentication.getPrincipal();
            Expert expert=(Expert)user;
            return  expert;
        } catch (Exception e) {
            return new Expert();
        }
    }

    public static User getUser() {
        SecurityContext securityContext = SecurityContextHolder.getContext();
        Authentication authentication = securityContext.getAuthentication();
        MyUser myUser = (MyUser) authentication.getPrincipal();
        User user = new User();
        user.setId(myUser.getId());
        user.setName(myUser.getName());
        user.setUsername(myUser.getUsername());
        user.setUtype(myUser.getUtype());
        user.setTheStatus(myUser.getTheStatus());
        user.setCheckStatus(myUser.getCheckStatus());
        user.setRoleType(myUser.getRoleType());
        return user;
    }




}
