package com.frame.organization.dao;

import com.frame.core.base.dao.BaseDao;

import com.frame.organization.model.BigUser;
import com.frame.organization.model.MyUser;
import com.frame.organization.model.User2;

import java.util.LinkedHashMap;

/**
 * Created by IntelliJ IDEA.
 * User: ming
 * Date: 12-10-16
 * Time: 下午4:18
 * To change this template use File | Settings | File Templates.
 */
public interface UserDao extends BaseDao<BigUser> {


    public MyUser getUniqueMyUserByConditions(String branchName, String queryHql, LinkedHashMap<String, Object> queryParamMap);



}
