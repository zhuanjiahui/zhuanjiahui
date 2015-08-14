package com.zhuanjiahui.main.service.impl;

import com.frame.core.base.dao.XdoDao;
import com.frame.core.base.service.BaseManager;
import com.frame.core.taglib.PageEntity;
import com.frame.core.util.PageInfo;
import com.frame.organization.model.User;
import com.zhuanjiahui.basic.model.Keywords;
import com.zhuanjiahui.character.model.Expert;
import com.zhuanjiahui.character.model.ExpertIndustry;
import com.zhuanjiahui.character.model.ExpertIndustryMajor;
import com.zhuanjiahui.main.model.ExpertServe;
import com.zhuanjiahui.main.model.ExpertServeContent;
import com.zhuanjiahui.main.model.ExpertServeIndustry;
import com.zhuanjiahui.main.service.ExpertServeManager;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by Administrator on 2015/7/8.
 */
@Service
public class ExpertServeManagerImpl implements ExpertServeManager {
    @Autowired
    private BaseManager baseManager;
    @Autowired
    private XdoDao xdoDao;


    @Override
    public PageInfo pageExpertServe(PageEntity pageEntity,LinkedHashMap<String,Object> param,String orderBy) {
        StringBuffer queryHQL=new StringBuffer("");
        queryHQL.append("select obj from "+ ExpertServe.class.getName()+" obj  where  obj.expert2.theStatus=1 and obj.expert2.checkStatus>1 and obj.theStatus=1 ");
        if (param!=null&&param.size()>0){
            for (String paramName:param.keySet()){
                if (paramName.equals("price0")){
                    queryHQL.append(" and obj.price>:price0");
                }else if(paramName.equals("price1")){
                    queryHQL.append(" and obj.price<:price1");
                }else {
                    queryHQL.append(" and obj."+paramName+"=:"+paramName);
                }
            }

            if(orderBy!=null&&!orderBy.equals("")){
                String orderCase=orderBy.replace("_"," ");
                queryHQL.append(" order by "+orderCase);
            }
        }
        return baseManager.listPageInfo(queryHQL.toString(),pageEntity,param);

    }
 /*   @Override
    public List<ExpertServeIndustry> pageExpertServe2(PageEntity pageEntity,LinkedHashMap<String,Object> param,String orderBy) {
        List<ExpertServeIndustry> expertServeIndustries=new ArrayList<>();
        StringBuffer queryHQL=new StringBuffer("");
        queryHQL.append("select obj  from "+ ExpertServe.class.getName()+" obj , "+ ExpertIndustry.class.getName()+" ity where obj.expert2.id=ity.expert.id and obj.expert2.theStatus=1 and obj.expert2.checkStatus>1 and obj.theStatus=1 ");
        queryHQL.append("select obj ,obj.expert2 from "+ ExpertServe.class.getName()+" obj  where  obj.expert2.theStatus=1 and obj.expert2.checkStatus>1 and obj.theStatus=1 ");
        if (param!=null&&param.size()>0){
            for (String paramName:param.keySet()){
                if (paramName.equals("price0")){
                    queryHQL.append(" and obj.price>:price0");
                }else if(paramName.equals("price1")){
                    queryHQL.append(" and obj.price<:price1");
                }else {
                    queryHQL.append(" and obj."+paramName+"=:"+paramName);
                }
            }

            if(orderBy!=null&&!orderBy.equals("")){
                String orderCase=orderBy.replace("_"," ");
                queryHQL.append(" order by "+orderCase);
            }
        }

        Session session=sessionFactory.getCurrentSession();
        Query query=session.createQuery(queryHQL.toString());

        for (String paramName:param.keySet()){
            query.setParameter(paramName,param.get(paramName));
        }
        int count=query.list().size();
        pageEntity.setCount(count);
        query.setFirstResult(pageEntity.getIndex());
        query.setMaxResults(pageEntity.getSize());
        List<Object[]> objects=query.list();
        for(Object[] objTemp:objects){
            ExpertServeIndustry expertServeIndustry=new ExpertServeIndustry((ExpertServe)objTemp[0],"",(Expert)objTemp[1]);
            expertServeIndustries.add(expertServeIndustry);
        }
        return expertServeIndustries;
    }


    public List<ExpertServeIndustry> pageExpertServe3(PageEntity pageEntity,LinkedHashMap<String,Object> param,String industry,String orderBy) {
        List<ExpertServeIndustry> expertServeIndustries=new ArrayList<>();
        StringBuffer queryHQL=new StringBuffer("");
        queryHQL.append("select obj , ity.industry ,obj.expert2 from "+ ExpertServe.class.getName()+" obj , "+ ExpertIndustry.class.getName()+" ity where obj.expert2.id=ity.expert.id and obj.expert2.theStatus=1 and obj.expert2.checkStatus>1 and obj.theStatus=1 ");
        if (param!=null&&param.size()>0){
            for (String paramName:param.keySet()){
                if (paramName.equals("price0")){
                    queryHQL.append(" and obj.price>:price0");
                }else if(paramName.equals("price1")){
                    queryHQL.append(" and obj.price<:price1");
                }else if(paramName.equals("industry")){
                    queryHQL.append(" and ity."+paramName+"=:"+paramName);
                }else {
                    queryHQL.append(" and obj."+paramName+"=:"+paramName);
                }
            }

            if(orderBy!=null&&!orderBy.equals("")){
                String orderCase=orderBy.replace("_"," ");
                queryHQL.append(" order by "+orderCase);
            }
            Session session=sessionFactory.getCurrentSession();
            Query query=session.createQuery(queryHQL.toString());
            for (String paramName:param.keySet()){
                query.setParameter(paramName,param.get(paramName));
            }
            int count=query.list().size();
            pageEntity.setCount(count);
            query.setFirstResult(pageEntity.getIndex());
            query.setMaxResults(pageEntity.getSize());
            List<Object[]> objects=query.list();
            for(Object[] objTemp:objects){
                ExpertServeIndustry expertServeIndustry=new ExpertServeIndustry((ExpertServe)objTemp[0],objTemp[1].toString(),(Expert)objTemp[2]);
                expertServeIndustries.add(expertServeIndustry);
            }
        }
        return expertServeIndustries;
    }*/
    @Override
    public List<Object> listPageExpert(LinkedHashMap<String, Object> params) {
        StringBuffer queryHQL=new StringBuffer("from "+ ExpertServe.class.getName()+" obj where obj.expert.checkStatus>2 and obj.theStatus=1");
        queryHQL.append(" order by obj.listPageIndex desc");
        return xdoDao.getObjectList(queryHQL.toString(),params,4,0);
    }

    @Override
    public List<ExpertServe> myExpertServes(String expertId) {
        String queryHQL="from "+ExpertServe.class.getName()+" obj where obj.theStatus=1 and obj.expert.id='"+expertId+"'";
        return baseManager.listObject(queryHQL);
    }

    @Override
    public PageInfo searchExpertServe(PageEntity pageEntity,String words) {
        String queryHQL="select s from "+ExpertServe.class.getName()+" s where s.theStatus=1 and s.expert.name like '%"+words+"%'" ;
        return baseManager.listPageInfo(queryHQL,pageEntity,null);
    }

    @Override
    public List<ExpertServe> loadServeByType(String expertId, String serveType) {
        String queryHQL="from "+ExpertServe.class.getName()+" s where s.expert.id='"+expertId+"' and s.serveType="+serveType;
        return baseManager.listObject(queryHQL);
    }

    @Override
    public List<ExpertServeContent> listServeContent(String expertId) {
        String queryHQL="from "+ExpertServeContent.class.getName()+" s where s.expert.id='"+expertId+"'" ;
        return  baseManager.listObject(queryHQL);
    }
}
