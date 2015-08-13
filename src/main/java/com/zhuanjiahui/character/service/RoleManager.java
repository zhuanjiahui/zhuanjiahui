package com.zhuanjiahui.character.service;

import com.frame.organization.model.User2;
import com.zhuanjiahui.character.model.Expert;


/**
 * Created by Administrator on 2015/6/26.
 */
public interface RoleManager {
    //验证用户名唯一
    public User2 checkUserName(String username);
    //验证短信验证码是否可用
    public Boolean validateSmsCode(String phoneNumber,String code);

    public Boolean validateSmsCodeTimeOut(String phoneNumber,String code);

    public void saveOrUpdateUser(Expert expert);

    
}
