package com.zhuanjiahui.basic.service.impl;

import com.frame.core.base.dao.XdoDao;
import com.frame.core.base.service.BaseManager;
import com.frame.core.taglib.PageEntity;
import com.frame.core.util.PageInfo;
import com.zhuanjiahui.basic.model.Activity;
import com.zhuanjiahui.basic.model.ActivityGuest;
import com.zhuanjiahui.basic.service.ActivityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by Administrator on 2015/7/3.
 */
@Service
public class ActivityManagerImpl implements ActivityManager {
    @Autowired
    private BaseManager baseManager;
    @Autowired
    private XdoDao xdoDao;
    @Override
    public List<Object> getNewActivities(int size) {
        String queryHQL="from "+Activity.class.getName()+" obj where obj.theStatus=1 order by createDatetime desc";
        return  xdoDao.getObjectList(queryHQL,null,size,0);
    }

    @Override
    public PageInfo getPageActivities(PageEntity pageEntity,LinkedHashMap<String,Object> params,String orderBy) {
        StringBuilder queryHQL=new StringBuilder("from "+Activity.class.getName()+" obj where obj.theStatus=1 ");
        LinkedHashMap<String,Object> paramMap=new LinkedHashMap<>();
        if(params!=null&&params.size()>0){
            for (String key:params.keySet()){
                if(!key.equals("price")){
                    queryHQL.append("and obj."+key+"=:"+key+" ");
                    paramMap.put(key, params.get(key));
                }
            }

        }
        if (orderBy!=null&&!orderBy.equals("")){
            String order=orderBy.replace("_"," ");
            queryHQL.append("order by "+order);
        }
        return baseManager.listPageInfo(queryHQL.toString(),pageEntity,paramMap);
    }

    @Override
    public PageInfo myFavoriteActivities(PageEntity pageEntity) {
        String queryHQL="from "+Activity.class.getName()+" ac where ac.expert.id";
        return null;
    }

    @Override
    public PageInfo publishActivities(String expertId,PageEntity pageEntity) {
        String queryHQL="from "+Activity.class.getName()+" ac where ac.theStatus=1 and ac.expert.id='"+expertId+"'";
        return baseManager.listPageInfo(queryHQL,pageEntity,null);

    }

    @Override
    public List<ActivityGuest> getGuestList(String activityId) {
        String queryHQL="from "+ActivityGuest.class.getName()+" s where s.activityId='"+activityId+"'";
        return null;
    }
}
