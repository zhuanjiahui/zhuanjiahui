package com.frame.organization.service.impl;


import com.frame.organization.dao.UserDao;
import com.frame.organization.model.BigUser;
import com.frame.organization.model.MyUser;
import com.frame.organization.model.User2;
import com.frame.organization.service.UserManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: ming
 * Date: 12-10-15
 * Time: 下午5:02
 * To change this template use File | Settings | File Templates.
 */

@Service
@Transactional
public class UserManagerImpl implements UserManager, UserDetailsService {

    @Autowired
    private UserDao userDao;


    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }



    @Override
    public void saveOrUpdateBigUser(BigUser user) {
        userDao.saveOrUpdateObject(user);
    }



    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
        String queryStr = "SELECT u FROM MyUser u WHERE u.username=:username AND u.theStatus != 0";
        LinkedHashMap<String, Object> queryParamMap = new LinkedHashMap<>();
        queryParamMap.put("username", username.split(",")[0]);
        MyUser myUser = userDao.getUniqueMyUserByConditions("", queryStr, queryParamMap);
        if (myUser == null) {
            throw new UsernameNotFoundException("user '" + username + "' not found...");
        } else {
            return myUser;
        }
    }


}
