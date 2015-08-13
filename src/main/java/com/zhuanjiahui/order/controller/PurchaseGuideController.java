package com.zhuanjiahui.order.controller;

import com.frame.core.base.service.BaseManager;
import com.frame.core.util.AuthorizationUtil;
import com.frame.core.util.StringUtil;
import com.frame.organization.model.User;
import com.frame.organization.service.CityManager;
import com.zhuanjiahui.character.model.Expert;
import com.zhuanjiahui.character.service.ExpertManager;
import com.zhuanjiahui.main.model.ExpertServe;
import com.zhuanjiahui.main.model.Schedule;
import com.zhuanjiahui.main.service.ScheduleManager;
import com.zhuanjiahui.order.model.PurchaseGuide;
import com.zhuanjiahui.order.model.PurchaseOrder;
import com.zhuanjiahui.order.model.PurchaseOrderTemp;
import com.zhuanjiahui.order.service.OrderManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/7/20.
 */
@Controller
@RequestMapping(value = "/pc/purchaseGuide")
public class PurchaseGuideController {
    @Autowired
    private ExpertManager expertManager;
    @Autowired
    private BaseManager baseManager;
    @Autowired
    private OrderManager orderManager;
    @Autowired
    private ScheduleManager scheduleManager;
    @Autowired
    private CityManager cityManager;
    /*购物车*/
    @RequestMapping(value = "/add")
    public String setPurchaseGuide(HttpServletRequest request,ModelMap modelMap) throws ParseException {
        String orderTime=request.getParameter("orderTime");
        String serveId=request.getParameter("serveId");
        Integer dayType=Integer.parseInt(new String(request.getParameter("dayType")));
        Integer payType=Integer.parseInt(new String(request.getParameter("payType")));
        String serveType=request.getParameter("serveType");
        String expertId=AuthorizationUtil.getMyUser().getId();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");

        PurchaseGuide purchaseGuide=(PurchaseGuide)request.getSession().getAttribute("purchaseGuide");
        if(purchaseGuide==null){
            purchaseGuide=new PurchaseGuide();
        }
        ExpertServe expertServe=(ExpertServe)baseManager.getObject(ExpertServe.class.getName(),serveId);
        User expert=expertServe.getExpert();
        Date date =simpleDateFormat.parse(orderTime);
        PurchaseOrder purchaseOrder=new PurchaseOrder();
        purchaseOrder.setSerial(String.valueOf(System.currentTimeMillis()));
        purchaseOrder.setExpertServe(expertServe);
        purchaseOrder.setServeDatetime(date);
        purchaseOrder.setPtype(serveType);
        purchaseOrder.setDayType(dayType);
        purchaseOrder.setPayType(payType);
        purchaseOrder.setTheStatus(1);
        purchaseOrder.setConsumer(AuthorizationUtil.getUser());
        purchaseOrder.setExpert(expert);

        BigDecimal price=expertServe.getPrice();
        //全额支付
        if(payType==2){
            price=price.multiply(new BigDecimal(expertServe.getCheap()/10));
        }
        //非全天
        if(dayType!=3){
            price=price.multiply(new BigDecimal(expertServe.getDiscount()/10));
        }
        purchaseOrder.setTotal(price);
        purchaseOrder.setIndustry(expertServe.getIndustry());
        purchaseOrder.setMajor(expertServe.getMajor());
        purchaseOrder.setCreateDatetime(new Date());
        purchaseOrder.setProcessStatus(1);
     /*   purchaseGuide.setPurchaseOrder(purchaseOrder);
        purchaseGuide.setTotal(purchaseOrder.getTotal());
        request.getSession().setAttribute("purchaseGuide",purchaseGuide);
        modelMap.put("experts",expertManager.getHomeExpert(5));*/

        return "redirect:/pc/purchaseGuide/orderLink?id="+purchaseOrder.getId();
    }
    @RequestMapping(value = "/orderLink")
    public String myPurchaseGuide(HttpServletRequest request,ModelMap modelMap){
        String orderId=request.getParameter("id");
        PurchaseOrder purchaseOrder=(PurchaseOrder)baseManager.getObject(PurchaseOrder.class.getName(),orderId);
        modelMap.put("purchaseOrder",purchaseOrder);
        modelMap.put("linkman",orderManager.getDefaultLinkman(AuthorizationUtil.getUser().getId()));
        modelMap.put("linkAddress",orderManager.getDefaultAddress(AuthorizationUtil.getUser().getId()));
        modelMap.put("provinces",cityManager.getProvinces());
        return "/order/orderLink";
    }
   /* *//*减少购物车*//*
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Boolean reducePurchaseGuide(HttpServletRequest request){
        String expertServeId=request.getParameter("serveId");
        PurchaseGuide purchaseGuide=(PurchaseGuide)request.getSession().getAttribute("purchaseGuide");
        for (PurchaseOrder temp:purchaseGuide.getPurchaseOrderList()){
            if(expertServeId.equals(temp.getExpertServe().getId())){
                purchaseGuide.getPurchaseOrderList().remove(temp);
                purchaseGuide.setTotal(temp.getTotal().multiply(new BigDecimal(-1)));
                request.getSession().setAttribute("purchaseGuide", purchaseGuide);
                return true;
            }
        }
        return false;
    }*/
/*    *//*保存订单 修改档期*//*
    @RequestMapping(value = "/sure")
    public String sureOrderMsg(HttpServletRequest request,ModelMap modelMap){

        modelMap.put("linkman",orderManager.getDefaultLinkman());
        modelMap.put("linkAddress",orderManager.getDefaultAddress());
        modelMap.put("provinces",cityManager.getProvinces());
        return "/order/orderLink";
    }*/

/*
    */
/*保存订单 修改档期*//*

    @RequestMapping(value = "/sure")
    public String sureOrderMsg(HttpServletRequest request,ModelMap modelMap){
        PurchaseGuide purchaseGuide=(PurchaseGuide)request.getSession().getAttribute("purchaseGuide");
        List<PurchaseOrder> purchaseOrderList=purchaseGuide.getPurchaseOrderList();
        List<Object> objects=new ArrayList<>();
        for(PurchaseOrder purchaseOrder:purchaseOrderList){
            objects.add(purchaseOrder);
            Schedule schedule=scheduleManager.getSchedule(purchaseOrder.getExpert().getId(),purchaseOrder.getServeDatetime());
            if(schedule==null){
                schedule=new Schedule();
                schedule.setExpert(purchaseOrder.getExpert());
                schedule.setDate(purchaseOrder.getServeDatetime());
                schedule.setPurchaseOrder(purchaseOrder);
*/
/*
                schedule.setAddress(purchaseOrder.getProvince().getName());
*//*

            }
            schedule.setDateStatus(3);//抢约
            baseManager.saveOrUpdate(Schedule.class.getName(),schedule);
        }
        baseManager.batchSaveOrUpdate("save",PurchaseOrder.class.getName(),objects);
        modelMap.put("linkman",orderManager.getDefaultLinkman());
        modelMap.put("linkAddress",orderManager.getDefaultAddress());
        modelMap.put("provinces",cityManager.getProvinces());
        return "/order/orderLink";
    }
*/

}
