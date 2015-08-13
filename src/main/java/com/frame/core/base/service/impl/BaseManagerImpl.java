package com.frame.core.base.service.impl;


import com.frame.core.base.dao.XdoDao;
import com.frame.core.base.service.BaseManager;
import com.frame.core.taglib.PageEntity;
import com.frame.core.util.PageInfo;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: ming
 * Date: 12-11-10
 * Time: 上午10:14
 * To change this template use File | Settings | File Templates.
 */
@Service
public class BaseManagerImpl implements BaseManager {

    @Autowired
    private XdoDao xdoDao;


    @Override
    public Object getObject(String model, String id) {
        return xdoDao.getObject(model, id);
    }

    /**
     * 保存
     */
    @Override
    public void saveOrUpdate(String model, Object object) {
        xdoDao.saveOrUpdateObject(model, object);
    }

    @Override
    public void saveObject(Object object) {
        xdoDao.saveObject(object);
    }

    @Override
    public void delete(String model, String id) {
        xdoDao.deleteObject(model, id);
    }

    @Override
    public void remove(String model, String id) {
        xdoDao.removeObject(model,id);
    }

    /**
     * 不需要配置文件的查询，需要在controller中写查询语句和查询参数
     */
    @Override
    public List listObject(String queryHql, LinkedHashMap<String, Object> queryParamMap) {
        return xdoDao.getObjectList(queryHql, queryParamMap);
    }

    @Override
    public List listObject(String queryHql, Object... params) {
        return xdoDao.getObjectList(queryHql, params);
    }

    @Override
    public PageInfo listPageInfo(String queryHql, PageEntity pageEntity, LinkedHashMap<String, Object> queryParamMap) {
        return xdoDao.getPageByConditions(pageEntity, queryHql, queryParamMap);  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Object getUniqueObjectByConditions(String queryHql, LinkedHashMap<String, Object> queryParamMap) {
        return xdoDao.getUniqueObjectByConditions(queryHql, queryParamMap);
    }


    /**
     * 批量假删  将theStatus状态改为0
     */
    public int batchRemove(String model, String[] idArray) {
        if (idArray == null || idArray.length == 0) {
            return 0;
        } else {
            StringBuilder queryStrBuilder = new StringBuilder("update " + model + " set theStatus = 0 where id in (:ids)");
            LinkedHashMap<String, Object> queryParamMap = new LinkedHashMap<>();
            queryParamMap.put("ids", idArray);
            return xdoDao.execteBulk(queryStrBuilder.toString(), queryParamMap);
        }

    }

    /**
     * 批量真删
     */
    public int batchDelete(String model, String[] idArray) {
        if (idArray == null || idArray.length == 0) {
            return 0;
        } else {
            StringBuilder queryStrBuilder = new StringBuilder("delete from " + model + " where id in (:ids)");
            LinkedHashMap<String, Object> queryParamMap = new LinkedHashMap<>();
            queryParamMap.put("ids", idArray);
            return xdoDao.execteBulk(queryStrBuilder.toString(), queryParamMap);
        }
    }

    /**
     * 批量真删
     */
    public int batchDeleteByCase(String model,String property, String[] propertyArray) {
        if (propertyArray == null || propertyArray.length == 0) {
            return 0;
        } else {
            StringBuilder queryStrBuilder = new StringBuilder("delete from " + model + " where "+property+" in (:properties)");
            LinkedHashMap<String, Object> queryParamMap = new LinkedHashMap<>();
            queryParamMap.put("properties", propertyArray);
            return xdoDao.execteBulk(queryStrBuilder.toString(), queryParamMap);
        }
    }


    @Override
    public void batchSaveOrUpdate(String type, String modelType, List<Object> objectList) {

        xdoDao.batchSaveOrUpdate(type, modelType, objectList);

        //To change body of implemented methods use File | Settings | File Templates.
    }


    @Override
    public Object executeSql(String type, String queryStr, LinkedHashMap<String, Object> queryParamMap) {
        return xdoDao.executeSql(type, queryStr, queryParamMap);  //To change body of implemented methods use File | Settings | File Templates.
    }




}
