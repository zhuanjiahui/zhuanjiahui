package com.zhuanjiahui.character.service.impl;

import com.frame.core.base.dao.XdoDao;
import com.frame.core.base.dao.hibernate.XdoDaoSupport;
import com.frame.core.base.service.BaseManager;
import com.frame.core.taglib.PageEntity;
import com.frame.core.util.PageInfo;
import com.frame.organization.model.User;
import com.zhuanjiahui.character.model.Expert;

import com.zhuanjiahui.character.model.ExpertIndustry;


import com.zhuanjiahui.character.model.ExpertIndustryMajor;
import com.zhuanjiahui.character.model.ExpertMajor;
import com.zhuanjiahui.character.service.ExpertManager;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;


import org.springframework.stereotype.Service;


import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by Administrator on 2015/6/30.
 * */


@Service
public class ExpertManagerImpl implements ExpertManager {
    @Autowired
    private BaseManager baseManager;
    @Autowired
    private XdoDao xdoDao;
    @Autowired
    @Qualifier("sessionFactory")
    private SessionFactory sessionFactory;
    @Override
    public Expert setBaseMassage(Expert user1, Expert user2) {
        return user1;
    }

    @Override
    public List<Object> getHomeExpert(int size) {
        String queryHQL="from "+Expert.class.getName()+" obj where obj.theStatus=1 and obj.utype=2 order by homePageIndex desc ";
        return  xdoDao.getObjectList(queryHQL,null,size,0);
    }

    @Override
    public List<Object> getNewExpert(int size) {
        String queryHQL="from "+Expert.class.getName()+" obj where obj.theStatus=1 and obj.utype=2 order by createDatetime desc ";
        return xdoDao.getObjectList(queryHQL,null,size,0);
    }

    @Override
    public List<Object> popularExpert(int size) {
        String queryHQL="from "+Expert.class.getName()+" obj where obj.theStatus=1 and obj.utype=2 order by visitCount desc ";
        return xdoDao.getObjectList(queryHQL,null,size,0);
    }

    @Override
    public PageInfo pageExpert(PageEntity pageEntity,LinkedHashMap<String,Object> param,String orderBy) {

        StringBuilder queryHQL=new StringBuilder("from "+Expert.class.getName()+" obj where obj.utype=2");
        if (param!=null&&param.size()>0){
            for (String paramName:param.keySet()){
                if (!paramName.equals("price")){
                    queryHQL.append(" and obj."+paramName+"=:"+paramName);
                }else {
                    String price=param.get("price").toString();
                    queryHQL.append(" and obj.price>:"+price.split("_")[0]+" and obj.price<:"+price.split("_")[1]);
                    param.remove("price");
                }
            }
            queryHQL.append(" and obj.theStatus=1");
            if(orderBy!=null&&!orderBy.equals("")){
                String orderCase=orderBy.replace("_"," ");
                queryHQL.append(" order by "+orderCase);
            }
        }
        return baseManager.listPageInfo(queryHQL.toString(),pageEntity,param);
    }

    @Override
    public Expert viewExpert(String id) {
        return (Expert)baseManager.getObject(Expert.class.getName(),id);
    }

   /* @Override
    public List<ExpertIndustryMajor> listExpertByIM(String industry, String major,String upor,PageEntity pageEntity) {
        LinkedHashMap<String,Object> params=new LinkedHashMap();
        List<ExpertIndustryMajor> expertIndustryMajors=new ArrayList<>();
        StringBuffer queryHQL=new StringBuffer("select ity.expert ,ity.industry , mjr.major from "+ExpertIndustry.class.getName()+" ity , "+ ExpertMajor.class.getName()+" mjr");
        queryHQL.append(" where ity.expert.id=mjr.expert.id");
        if (industry!=null&&!industry.equals("")){
            queryHQL.append(" and ity.industry=:industry");
            params.put("industry",industry);
        }
        if(major!=null&&!major.equals("")){
            queryHQL.append(" and mjr.major=:major");
            params.put("major",major);
        }
        if(upor!=null&&!upor.equals("")){
            queryHQL.append(" and ity.expert.upor=:upor");
            params.put("upor",upor);
        }
        *//*queryHQL.append(" and ity.theStatus=1 and mjr.theStatus=1");*//*
        Session session=sessionFactory.getCurrentSession();
        Query query=session.createQuery(queryHQL.toString());
        for (String paramName:params.keySet()){
            query.setParameter(paramName,params.get(paramName));
        }
        query.setFirstResult(pageEntity.getIndex());
        query.setMaxResults(pageEntity.getSize());
        List<Object[]> objects=query.list();
        for(Object[] objTemp:objects){
            ExpertIndustryMajor expertIndustryMajor=new ExpertIndustryMajor((Expert)objTemp[0],objTemp[1].toString(),objTemp[2].toString());
            expertIndustryMajors.add(expertIndustryMajor);
        }
        return expertIndustryMajors;
    }
*/


    @Override
    public Expert getExpertByNamePsw(String username, String password) {
        String queryHQL="from "+Expert.class.getName()+" ext where ext.theStatus=1 and ext.username='"+username+"' and ext.password='"+password+"'";
        return (Expert)baseManager.getUniqueObjectByConditions(queryHQL,null);
    }

    @Override
    public void switchUtype(int utype,String userId) {
        String queryHQL="update organization_user s set s.utype="+utype+" where s.id='"+userId+"'" ;
        baseManager.executeSql("",queryHQL,null);
    }
}
