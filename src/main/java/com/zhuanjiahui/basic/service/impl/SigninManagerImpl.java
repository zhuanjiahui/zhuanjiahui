package com.zhuanjiahui.basic.service.impl;

import com.frame.core.base.service.BaseManager;
import com.frame.core.util.StringUtil;
import com.frame.organization.model.BigUser;
import com.frame.organization.model.User;
import com.frame.organization.model.User2;
import com.zhuanjiahui.basic.service.SigninManager;

import com.zhuanjiahui.character.model.Expert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/6/29.
 */
@Service
public class SigninManagerImpl implements SigninManager {
    @Autowired
    private BaseManager baseManager;
    @Override
    public User checkUserName(String username) {
        String queryHQL="from com.frame.organization.model.User s where s.username=? and s.theStatus>0";
        List<User> userList=(List<User>) baseManager.listObject(queryHQL,username);
        if (userList==null||userList.size()==0){
            return null;
        }else return userList.get(0);
    }

    @Override
    public Expert initExpert(Expert expert) {
        expert.setTheStatus(1);
        expert.setCheckStatus(1);
        expert.setPassword(StringUtil.encodePassword(expert.getPassword(), "sha"));
        expert.setRoleType(1);
        String idNO=new Date().getTime()+"";
        expert.setIdNo(idNO.substring(3,12));
        expert.setPictureUrl("/images/default.png");
        expert.setCreateDatetime(new Date());
        expert.setAccountExpired(false);//账户过期？
        expert.setEnabled(true);//账户有效？
        expert.setCredentialsExpired(false);//证书过期?
        expert.setAccountLocked(false);//上锁？
        return expert;
    }
}
