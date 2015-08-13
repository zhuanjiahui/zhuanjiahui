package com.zhuanjiahui.basic.service;

import com.frame.organization.model.BigUser;
import com.frame.organization.model.User;
import com.frame.organization.model.User2;
import com.zhuanjiahui.character.model.Expert;


/**
 * Created by Administrator on 2015/6/29.
 */
public interface SigninManager {
    public User checkUserName(String username);

    public Expert initExpert(Expert expert);
}
