package com.frame.core.base.dao.hibernate;

import com.frame.core.base.dao.BaseDao;

import org.hibernate.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import javax.persistence.Entity;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: ming
 * Date: 12-10-15
 * Time: 下午2:01
 * To change this template use File | Settings | File Templates.
 */
public class BaseDaoSupport<T> implements BaseDao<T> {

    private Class entityClass;

    @Autowired
    @Qualifier("sessionFactory")
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return this.sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession() {
        //事务必须是开启的(Required)，否则获取不到
        return sessionFactory.getCurrentSession();
    }


    public BaseDaoSupport() {
        Type genType = getClass().getGenericSuperclass();
        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
        entityClass = (Class) params[0];
    }


    /**
     * 获取实体的名称
     *
     * @param <E>
     * @param clazz 实体类
     * @return
     */
    protected static <E> String getEntityName(Class<E> clazz) {
        String entityName = clazz.getSimpleName();
        Entity entity = clazz.getAnnotation(Entity.class);
        if (entity.name() != null && !"".equals(entity.name())) {
            entityName = entity.name();
        }
        return entityName;
    }

    @Override
    public T getObject(Integer id) {
        return (T) this.getSession().get(entityClass, id);
    }

    @Override
    public T getObject(String id) {
        return (T) this.getSession().get(entityClass, id);
    }

    @Override
    public void saveObject(T entity) {
        this.getSession().save(entity);
    }

    @Override
    public void updateObject(T entity) {
        this.getSession().update(entity);
    }

    @Override
    public void saveOrUpdateObject(T entity) {
        this.getSession().saveOrUpdate(entity);
    }

    @Override
    public void deleteObject(T entity) {
        this.getSession().delete(entity);
    }

    protected void setParameters(Query query, Object[] paramlist) {
        if (paramlist != null) {
            for (int i = 0; i < paramlist.length; i++) {
                if (paramlist[i] instanceof Date) {
                    //TODO 难道这是bug 使用setParameter不行？？
                    query.setTimestamp(i, (Date) paramlist[i]);
                } else {
                    query.setParameter(i, paramlist[i]);
                }
            }
        }
    }

    @Override
    public List<T> getObjectList(String queryHql, Object... params) {

        Query query = getSession().createQuery(queryHql);
        setParameters(query, params);
        return query.list();
    }

    @Override
    public T getUniqueObjectByConditions(String queryHql, LinkedHashMap<String, Object> queryParamMap) {
        Query listQuery = this.getSession().createQuery(queryHql);
        setQueryParams(listQuery, queryParamMap);
        return (T) listQuery.uniqueResult();
    }

    @Override
    public List<T> getObjectListByConditions(String queryHql, LinkedHashMap<String, Object> queryParamMap) {

        Query listQuery = this.getSession().createQuery(queryHql);
        setQueryParams(listQuery, queryParamMap);
        return listQuery.list();
    }




    protected static void setQueryParams(Query query, LinkedHashMap<String, Object> queryParamMap) {
        if (queryParamMap != null && queryParamMap.size() > 0) {
            for (String paramName : queryParamMap.keySet()) {
                if (queryParamMap.get(paramName) instanceof Object[]) {
                    query.setParameterList(paramName, (Object[]) queryParamMap.get(paramName));
                } else if (queryParamMap.get(paramName) instanceof Collection) {
                    query.setParameterList(paramName, (Collection) queryParamMap.get(paramName));
                } else {
                    query.setParameter(paramName, queryParamMap.get(paramName));
                }
            }
        }
    }
    /*
    * 假删除*//*
    @Override
    public int removeObj(String modelType,String id){

        String query = "update " + modelType + " s set s.theStatus = 0 where s.id =:id";
        return this.getSession().createQuery(query).setString("id", id).executeUpdate();

    }

    *//*
    * 批量更新或保存，要么注册，要么更新
    * type:操作类型
    * objects：对象列表
    * *//*
    @Override
    public void batchSaveOrUpdateObj(String type,List<Object> objects){
        StatelessSession session = sessionFactory.openStatelessSession();
        Transaction tx = session.beginTransaction();
        if ("save".equals(type)){
            for (Object obj:objects){
                session.insert(obj);
            }
        }else {
            for (Object obj:objects){
                session.update(obj);
            }
        }
        tx.commit();
        session.close();
    }
    *//*
 * 批量可以即存在注册，又存在更新
 * type:操作类型
 * objects：对象列表
 * *//*
 @Override
 public void batchSaveAndUpdate(String type,List<Object> objects){
        Session session = this.getSession();
        Transaction tx = session.beginTransaction();
        for (Object obj:objects){
            session.saveOrUpdate(obj);
        }
        tx.commit();
        session.close();
    }*/
}
