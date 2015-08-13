package com.zhuanjiahui.character.service.impl;

import com.frame.organization.model.User2;

import com.zhuanjiahui.character.model.Expert;
import com.zhuanjiahui.character.service.RoleManager;

/**
 * Created by Administrator on 2015/6/26.
 */
public class RoleManagerImpl implements RoleManager{
    @Override
    public User2 checkUserName(String username) {
        return null;
    }

    @Override
    public Boolean validateSmsCode(String phoneNumber, String code) {
        return null;
    }

    @Override
    public Boolean validateSmsCodeTimeOut(String phoneNumber, String code) {
        return null;
    }

    @Override
    public void saveOrUpdateUser(Expert expert) {

    }
}
