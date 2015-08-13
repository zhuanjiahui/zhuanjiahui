package com.zhuanjiahui.order.service;

import com.zhuanjiahui.order.model.PurchaseOrderComment;

import java.util.List;

/**
 * Created by Administrator on 2015/7/6.
 */
public interface CommentManager {
    /*评价分为三类：
    * 专家评价（对用户）、助理评价（对用户）、用户评价（对专家和助理）
    * 我的评价：
    * 专家-3 expertId   助理-3 assistantId 用户-1、2 consumerId
    * */
    public List<PurchaseOrderComment> getMyComments(String id,Integer commentType);
}
