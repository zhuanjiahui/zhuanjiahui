package com.zhuanjiahui.basic.service.impl;

import com.frame.core.base.dao.XdoDao;
import com.frame.core.base.service.BaseManager;
import com.frame.core.taglib.PageEntity;
import com.frame.core.util.PageInfo;

import com.zhuanjiahui.basic.model.Requirement;
import com.zhuanjiahui.basic.service.RequirementManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by Administrator on 2015/7/3.
 */
@Service
public class RequirementManagerImpl implements RequirementManager {
    @Autowired
    private BaseManager baseManager;
    @Autowired
    private XdoDao xdoDao;
    /*
    * 最新需求*/
    @Override
    public List<Object> getNewRequirements(int size) {
        String queryHQL="from "+Requirement.class.getName()+" obj where obj.theStatus=1 order by createDatetime desc ";
        return  xdoDao.getObjectList(queryHQL,null,size,0);
    }
    /*
    * 需求列表*/
    @Override
    public PageInfo getPageRequirement(PageEntity pageEntity,LinkedHashMap<String,Object> params,String orderBy) {
        StringBuilder queryHQL=new StringBuilder("from "+Requirement.class.getName()+" obj where obj.theStatus=1 ");
        LinkedHashMap<String,Object> paramMap=new LinkedHashMap<>();
        if(params!=null&&params.size()>0){
            for (String key:params.keySet()){
                if(!key.equals("price")){
                    queryHQL.append("and obj."+key+"=:"+key+" ");
                    paramMap.put(key,params.get(key));
                }
            }

        }
        if (orderBy!=null&&!orderBy.equals("")){
            String order=orderBy.replace("_"," ");
            queryHQL.append("order by "+order);
        }else {
            queryHQL.append("order by createDatetime desc");
        }
        return baseManager.listPageInfo(queryHQL.toString(),pageEntity,paramMap);
    }

    @Override
    public PageInfo publishRequirements(PageEntity pageEntity,String userId) {
        String queryHQL="from Requirement r where r.expert.id='"+userId+"' and r.theStatus=1";
        return baseManager.listPageInfo(queryHQL,pageEntity,null);

    }
}
