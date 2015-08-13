package com.zhuanjiahui.character.service.impl;

import com.frame.core.base.dao.XdoDao;
import com.frame.core.base.service.BaseManager;
import com.frame.core.taglib.PageEntity;
import com.frame.core.util.PageInfo;
import com.zhuanjiahui.character.model.Assistant;
import com.zhuanjiahui.character.model.Expert;
import com.zhuanjiahui.character.service.AssistantManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by Administrator on 2015/7/2.
 */
@Service
public class AssistantManagerImpl implements AssistantManager {
    @Autowired
    private XdoDao xdoDao;
    @Autowired
    private BaseManager baseManager;
    @Override
    public List<Object> popularAssistants(int size) {
        String queryHQL="from "+Assistant.class.getName()+" obj where obj.theStatus=1 and obj.utype=3 order by praise desc,orderNumber desc ";
        return  xdoDao.getObjectList(queryHQL,null,size,0);
    }

    @Override
    public PageInfo pageAssistants(PageEntity pageEntity, LinkedHashMap<String,Object> params, String orderBy) {
        StringBuffer queryHQL=new StringBuffer("from "+Assistant.class.getName()+" obj where obj.theStatus=1 ") ;
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
        }
        return baseManager.listPageInfo(queryHQL.toString(),pageEntity,paramMap);
    }

    @Override
    public PageInfo myExperts(PageEntity pageEntity, String userId) {
        String queryHQL="from "+Expert.class.getName()+" s where s.theStatus=1 and s.assistant.id='"+userId+"'";
        return baseManager.listPageInfo(queryHQL,pageEntity,null);
    }
}
