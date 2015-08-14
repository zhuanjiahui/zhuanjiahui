package com.zhuanjiahui.order.service.impl;

import com.frame.core.base.dao.XdoDao;
import com.frame.core.base.service.BaseManager;
import com.frame.core.taglib.PageEntity;
import com.frame.core.util.PageInfo;
import com.zhuanjiahui.basic.model.Activity;
import com.zhuanjiahui.character.model.Expert;
import com.zhuanjiahui.character.model.LinkAddress;
import com.zhuanjiahui.character.model.Linkman;
import com.zhuanjiahui.main.model.Schedule;
import com.zhuanjiahui.main.service.ScheduleManager;
import com.zhuanjiahui.order.model.PurchaseGuide;
import com.zhuanjiahui.order.model.PurchaseOrder;
import com.zhuanjiahui.order.model.PurchaseOrderPayment;
import com.zhuanjiahui.order.model.PurchaseOrderTemp;
import com.zhuanjiahui.order.service.OrderManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/7/20.
 */
@Service
public class OrderManagerImpl implements OrderManager {
    @Autowired
    private BaseManager baseManager;
    @Autowired
    private ScheduleManager scheduleManager;
    @Autowired
    private XdoDao xdoDao;
    @Override
    public Linkman getDefaultLinkman(String expertId) {
        String hql="from "+Linkman.class.getName()+" s where s.isDefault=1 and s.theStatus=1 and s.expert.id='"+expertId+"'";
        return (Linkman)baseManager.getUniqueObjectByConditions(hql,null);
    }

    @Override
    public LinkAddress getDefaultAddress(String expertId) {
        String hql="from "+LinkAddress.class.getName()+" s where s.isDefault=1 and s.theStatus=1 and s.expert.id='"+expertId+"'";
        return (LinkAddress)baseManager.getUniqueObjectByConditions(hql,null);
    }

    @Override
    public PageInfo listOrders(String userId,PageEntity pageEntity) {
        String queryHQL="from "+ PurchaseOrder.class.getName()+" s where s.theStatus=1 and s.consumer.id='"+userId+"'";
        return baseManager.listPageInfo(queryHQL,pageEntity,null);
    }

    @Override
    public PageInfo listExpertOrders(String userId, PageEntity pageEntity) {
        String queryHQL="from "+ PurchaseOrder.class.getName()+" s where s.theStatus=1 and s.expert.id='"+userId+"'";
        return baseManager.listPageInfo(queryHQL,pageEntity,null);
    }

    @Override
    public PageInfo listAssistantOrders(String userId, PageEntity pageEntity) {
        String queryHQL="from "+ PurchaseOrder.class.getName()+" s where s.theStatus=1 and s.expert2.assistant.id='"+userId+"'";
        return baseManager.listPageInfo(queryHQL,pageEntity,null);
    }

    @Override
    public void successPay(String paymentId) {

        PurchaseOrderPayment purchaseOrderPayment=(PurchaseOrderPayment)baseManager.getObject(PurchaseOrderPayment.class.getName(),paymentId);
        purchaseOrderPayment.setPayStatus(1);//成功支付
        PurchaseOrder purchaseOrder=purchaseOrderPayment.getPurchaseOrder();
        Schedule schedule=scheduleManager.getSchedule(purchaseOrder.getExpert().getId(),purchaseOrder.getServeDatetime());
        if(schedule==null){
            schedule=new Schedule();
            schedule.setDate(purchaseOrder.getServeDatetime());
            schedule.setExpert(purchaseOrder.getExpert());

        }
        schedule.setPurchaseOrder(purchaseOrder);
        schedule.setAddress(purchaseOrder.getProvince().getName());
        schedule.setDateStatus(3);
        if(purchaseOrderPayment.getPayType()==1){
            purchaseOrder.setPayStatus(2);//已预付
            baseManager.saveOrUpdate(Schedule.class.getName(),schedule);
        }else if(purchaseOrderPayment.getPayType()==2){
            purchaseOrder.setPayStatus(3);
            baseManager.saveOrUpdate(Schedule.class.getName(),schedule);
        }else {
            //余款支付
            purchaseOrder.setPayStatus(3);
        }

        baseManager.saveOrUpdate(PurchaseOrderPayment.class.getName(), purchaseOrderPayment);
        baseManager.saveOrUpdate(PurchaseOrder.class.getName(),purchaseOrder);
    }

    @Override
    public List<Object> listScheduleOrders(String expertId,int size) {
        String queryHQL="from "+PurchaseOrder.class.getName()+" obj where obj.theStatus=1 and obj.expert.id='"+expertId+"'";
        return xdoDao.getObjectList(queryHQL,null,size,0);
    }

    @Override
    public PurchaseOrder createActivityOrder(PurchaseOrder purchaseOrder, Activity activity) {
        purchaseOrder.setPayStatus(1);
        purchaseOrder.setTheStatus(1);
        purchaseOrder.setIndustry(activity.getIndustry());
        purchaseOrder.setActivity(activity);
        purchaseOrder.setCreateDatetime(new Date());
        purchaseOrder.setOrderType("activity");
        purchaseOrder.setServeDatetime(activity.getActivityDate());
        purchaseOrder.setProcessStatus(1);
        purchaseOrder.setPayType(2);
        purchaseOrder.setProvince(activity.getProvince());
        purchaseOrder.setTotal(activity.getPrice());
        purchaseOrder.setSerial(String.valueOf(System.currentTimeMillis()));
        return purchaseOrder;
    }
}
