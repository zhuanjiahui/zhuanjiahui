package com.frame.core.base.dao;



import com.frame.core.taglib.PageEntity;
import com.frame.core.util.PageInfo;

import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: ming
 * Date: 12-10-15
 * Time: 下午2:01
 * To change this template use File | Settings | File Templates.
 */
public interface XdoDao {

    public void saveObject(Object object);

    public void saveOrUpdateObject(String modelType, Object object);

    public void deleteObject(String modelType, String id);

    public int removeObject(String modelType, String id);

    public Object getObject(String modelType, String id);

    public List getObjectList(String queryHql, LinkedHashMap<String, Object> queryParamMap);

    public List getObjectList(String queryHql, Object... params);

    public List<Object> getObjectList(String hql, LinkedHashMap<String, Object> params, Integer limit, Integer offset);

    public PageInfo getPageByConditions(PageEntity pageEntity, String queryHql, LinkedHashMap<String, Object> queryParamMap);

    public int execteBulk(final String hql, final LinkedHashMap<String, Object> queryParamMap);

    public Object getUniqueObjectByConditions(String queryHql, LinkedHashMap<String, Object> queryParamMap);



    public void batchSaveOrUpdate(String type, String modelType, List<Object> objectList);

    public Object executeSql(String type, String queryStr, LinkedHashMap<String, Object> queryParamMap);


}
