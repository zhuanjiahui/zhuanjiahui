package com.zhuanjiahui.order.service.impl;

import com.frame.core.base.service.BaseManager;
import com.zhuanjiahui.order.model.PurchaseOrderComment;
import com.zhuanjiahui.order.service.CommentManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2015/7/6.
 */
@Service
public class CommentManagerImpl implements CommentManager{
    @Autowired
    private BaseManager baseManager;
    @Override
    public List<PurchaseOrderComment> getMyComments(String id,Integer commentType) {
        String queryHQL="from "+PurchaseOrderComment.class.getName()+" s where s.theStatus=1 and s.commentType="+commentType;
        if(commentType==1)
            queryHQL+=" and s.consumer.id='"+id+"'";
        else if(commentType==2)
            queryHQL+=" and s.expert.id='"+id+"'";
        else if(commentType==3)
            queryHQL+=" and s.asistant.id='"+id+"'";
        return baseManager.listObject(queryHQL);
    }
}
