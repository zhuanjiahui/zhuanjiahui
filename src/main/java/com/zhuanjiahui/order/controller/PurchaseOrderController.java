package com.zhuanjiahui.order.controller;

import com.frame.core.base.service.BaseManager;
import com.frame.core.taglib.PageEntity;
import com.frame.core.util.AuthorizationUtil;
import com.frame.core.util.PageInfo;
import com.frame.organization.model.MyUser;
import com.frame.organization.model.Province;
import com.frame.organization.model.User;
import com.frame.organization.service.CityManager;
import com.zhuanjiahui.basic.controller.BaseController;
import com.zhuanjiahui.basic.model.Activity;
import com.zhuanjiahui.character.model.Expert;
import com.zhuanjiahui.character.model.LinkAddress;
import com.zhuanjiahui.character.model.Linkman;
import com.zhuanjiahui.main.model.ExpertServe;
import com.zhuanjiahui.main.model.Schedule;
import com.zhuanjiahui.main.service.ScheduleManager;
import com.zhuanjiahui.order.model.PurchaseGuide;
import com.zhuanjiahui.order.model.PurchaseOrder;
import com.zhuanjiahui.order.service.OrderManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/7/29.
 */
@Controller
@RequestMapping("/pc/purchaseOrder")
public class PurchaseOrderController extends BaseController{
    @Autowired
    private OrderManager orderManager;
    @Autowired
    private BaseManager baseManager;
    @Autowired
    private CityManager cityManager;
    @Autowired
    private ScheduleManager scheduleManager;

    /*用户订单*/
    @RequestMapping("/userOrders")
    public String listOrders(HttpServletRequest request,ModelMap modelMap){
        PageEntity pageEntity=this.getPageEntity(request);
        PageInfo pageInfo=orderManager.listOrders(AuthorizationUtil.getMyUser().getId(),pageEntity);
        modelMap.put("pageEntity",pageEntity);
        modelMap.put("pageInfo",pageInfo);
        return "/order/userOrderList";
    }
    /*专家订单*/
    @RequestMapping(value = "/expertOrders")
    public String listExpertOrders(HttpServletRequest request,ModelMap modelMap){
        PageEntity pageEntity=this.getPageEntity(request);
        PageInfo pageInfo=orderManager.listExpertOrders(AuthorizationUtil.getMyUser().getId(),pageEntity);
        modelMap.put("pageEntity",pageEntity);
        modelMap.put("pageInfo",pageInfo);
        return "/order/expertOrderList";
    }
    /*助理订单*/
    @RequestMapping(value = "/assistantOrders")
    public String listAssistantOrders(HttpServletRequest request,ModelMap modelMap){
        PageEntity pageEntity=this.getPageEntity(request);
        PageInfo pageInfo=orderManager.listAssistantOrders(AuthorizationUtil.getMyUser().getId(),pageEntity);
        modelMap.put("pageEntity",pageEntity);
        modelMap.put("pageInfo",pageInfo);
        return "/order/assistantOrderList";
    }

    @RequestMapping(value = "/create")
    public String setPurchaseOrder(HttpServletRequest request,ModelMap modelMap) throws ParseException {
        String orderTime=request.getParameter("orderTime");
        String serveId=request.getParameter("serveId");
        Integer dayType=Integer.parseInt(new String(request.getParameter("dayType")));

        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");

        ExpertServe expertServe=(ExpertServe)baseManager.getObject(ExpertServe.class.getName(),serveId);
        User expert=expertServe.getExpert();
        Date date =simpleDateFormat.parse(orderTime);
        PurchaseOrder purchaseOrder=new PurchaseOrder();
        purchaseOrder.setSerial(String.valueOf(System.currentTimeMillis()));
        purchaseOrder.setExpertServe(expertServe);
        purchaseOrder.setServeDatetime(date);

        purchaseOrder.setPtype(expertServe.getServeType());
        purchaseOrder.setDayType(dayType);
        purchaseOrder.setTheStatus(1);

        purchaseOrder.setConsumer(AuthorizationUtil.getUser());
        purchaseOrder.setExpert(expert);
        purchaseOrder.setAssistant(expertServe.getExpert2().getAssistant());
        BigDecimal price=expertServe.getPrice();

        //非全天
        if(dayType!=3){
            price=price.multiply(new BigDecimal(expertServe.getDiscount()/10));
        }
        purchaseOrder.setTotal(price);
        purchaseOrder.setIndustry(expertServe.getIndustry());
        purchaseOrder.setMajor(expertServe.getMajor());
        purchaseOrder.setCreateDatetime(new Date());

        purchaseOrder.setProcessStatus(1);
        purchaseOrder.setPayStatus(1);
        baseManager.saveOrUpdate(PurchaseOrder.class.getName(),purchaseOrder);
        Schedule schedule =scheduleManager.getSchedule(expert.getId(),date);
        if(schedule==null){
            schedule=new Schedule();
            schedule.setDate(date);
            schedule.setDateStatus(2);
            schedule.setExpert(expert);
        }
        schedule.setDateStatus(2);
        baseManager.saveOrUpdate(Schedule.class.getName(),schedule);
        return "redirect:/pc/purchaseOrder/orderLink?id="+purchaseOrder.getId();
    }
    @RequestMapping(value = "/viewOrder")
    public String viewPurchaseOrder(HttpServletRequest request,Model model){
        String orderId=request.getParameter("orderId");
        PurchaseOrder purchaseOrder=(PurchaseOrder)baseManager.getObject(PurchaseOrder.class.getName(),orderId);
        model.addAttribute("purchaseOrder",purchaseOrder);
        return "/order/purchaseOrderView";
    }
    /*支付页面*/
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
    /*余款支付页面*/
    @RequestMapping(value = "/sparePay")
    public String sparePay(HttpServletRequest request,ModelMap modelMap){
        String orderId=request.getParameter("id");
        PurchaseOrder purchaseOrder=(PurchaseOrder)baseManager.getObject(PurchaseOrder.class.getName(),orderId);
        modelMap.put("purchaseOrder",purchaseOrder);
        return "/order/sparePay";
    }
   /* *//*保存联系人*//*
    @RequestMapping(value = "/saveLinkman")
    @ResponseBody
    public Linkman saveLinkman(HttpServletRequest request){
        User expert=AuthorizationUtil.getUser();
        String name=request.getParameter("name");
        String phone=request.getParameter("phone");
        Linkman linkman=new Linkman();
        linkman.setName(name);
        linkman.setPhone(phone);
        linkman.setExpert(expert);
        linkman.setIsDefault(false);
        linkman.setTheStatus(1);
        baseManager.saveOrUpdate(Linkman.class.getName(),linkman);
        return linkman;
    }*/
  /*  *//*保存联系地址*//*
    @RequestMapping(value = "/saveLinkAddress")
    @ResponseBody
    public LinkAddress saveLinkAddress(LinkAddress linkAddress,String provinceId){
        Province province=cityManager.getProvince(provinceId);
        User expert=AuthorizationUtil.getUser();
        linkAddress.setProvince(province);
        linkAddress.setExpert(expert);
        linkAddress.setIsDefault(false);
        baseManager.saveOrUpdate(LinkAddress.class.getName(),linkAddress);
        return linkAddress;
    }*/
    /*修改订单状态*/
    @RequestMapping(value = "/process")
    @ResponseBody
    public int changeOrderProcess(HttpServletRequest request){
        try {
            String orderId=request.getParameter("orderId");
            int processStatus=Integer.parseInt(request.getParameter("processStatus"));
            PurchaseOrder purchaseOrder=(PurchaseOrder)baseManager.getObject(PurchaseOrder.class.getName(),orderId);
            purchaseOrder.setProcessStatus(processStatus);
            baseManager.saveOrUpdate(PurchaseOrder.class.getName(),purchaseOrder);
            return processStatus;
        }catch (NullPointerException e){
            return 0;
        }
    }
    @RequestMapping(value = "/myOrders")
    public String myOrders(){
        MyUser myUser=AuthorizationUtil.getMyUser();
        if(myUser.getUtype()==1){
            return "redirect:/pc/purchaseOrder/userOrders";
        }else if(myUser.getUtype()==2){
            return "redirect:/pc/purchaseOrder/expertOrders";
        }else {
            return "redirect:/pc/purchaseOrder/assistantOrders";
        }
    }
  /*  public void joinActivity(HttpServletRequest request){
        String activityId=request.getParameter("activityId");
        Activity activity=(Activity)baseManager.getObject(Activity.class.getName(),activityId);
        List<Expert> expertList=activity.getExpertList();
        *//*List<PurchaseOrder> purchaseOrderList=activity.getPurchaseOrderList();*//*
        if(expertList!=null&&expertList.size()<activity.getUserNumber()){

        }
    }*/
}
