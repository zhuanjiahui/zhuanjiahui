package com.zhuanjiahui.order.service;

import com.frame.core.taglib.PageEntity;
import com.frame.core.util.PageInfo;
import com.zhuanjiahui.character.model.LinkAddress;
import com.zhuanjiahui.character.model.Linkman;
import com.zhuanjiahui.order.model.PurchaseGuide;
import com.zhuanjiahui.order.model.PurchaseOrder;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by Administrator on 2015/7/20.
 */
public interface OrderManager {
    public Linkman getDefaultLinkman(String expertId);

    public LinkAddress getDefaultAddress(String expertId);

    public PageInfo listOrders(String userId,PageEntity pageEntity);

    public PageInfo listExpertOrders(String userId,PageEntity pageEntity);

    public PageInfo listAssistantOrders(String userId,PageEntity pageEntity);

    public void successPay(String paymentId);

    public List<Object> listScheduleOrders(String expertId,int size);


}
