package com.zhuanjiahui.main.controller;

import com.frame.core.base.service.BaseManager;
import com.frame.core.taglib.PageEntity;
import com.frame.core.util.AuthorizationUtil;
import com.frame.core.util.PageInfo;
import com.frame.organization.model.MyUser;
import com.zhuanjiahui.character.model.Expert;
import com.zhuanjiahui.main.model.Schedule;
import com.zhuanjiahui.main.service.ScheduleManager;
import com.zhuanjiahui.order.model.PurchaseOrder;
import com.zhuanjiahui.order.service.OrderManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Administrator on 2015/6/30.
 */
@Controller
@RequestMapping(value="/pc/schedule")
public class ScheduleController {
    @Autowired
    private ScheduleManager scheduleManager;
    @Autowired
    private OrderManager orderManager;
    @Autowired
    private BaseManager baseManager;
    /*查看专家档期: 日期（日）、年月日、日期状态、档期id、过期状态、所在地点、年、月、日*/
    @RequestMapping(value = "/view")
    public String viewSchedule(HttpServletRequest request,ModelMap modelMap) throws ParseException {
        MyUser user=AuthorizationUtil.getMyUser();
        String year=request.getParameter("year");
        String month=request.getParameter("month");
        Calendar calendar = Calendar.getInstance();
        if (year != null) {
            calendar.set(Calendar.DAY_OF_MONTH, 1);
            calendar.set(Calendar.MONTH, Integer.parseInt(month) - 1);//一月份表示0 etc.
            calendar.set(Calendar.YEAR, Integer.parseInt(year));
        } else {
            Date date = new Date();
            calendar.setTime(date);
        }

        List<Object> purchaseOrderList=orderManager.listScheduleOrders(user.getId(),5);
        List<Map> schedules=scheduleManager.getScheduleList(user.getId(),calendar.getTime());
        modelMap=scheduleManager.getCalendar(modelMap,calendar.getTime());
        modelMap.put("purchaseOrderList",purchaseOrderList);
        modelMap.put("myUser",user);
        modelMap.put("scheduleList",schedules);
        return "/main/schedule";
    }
    /*设置档期，已经预约的不可以编辑*/
    @RequestMapping(value="/change")
    @ResponseBody
    public String setSchedule(HttpServletRequest request) throws ParseException {
        String id = request.getParameter("id");
        String status = request.getParameter("status");
        Schedule schedule = null;
        if (id != null && !id.equals("")&&!id.equals("undefined")) {//已存在时，只变更状态信息
            schedule = (Schedule) baseManager.getObject(Schedule.class.getName(), id);
            schedule.setDateStatus(Integer.parseInt(status));
        } else {
            schedule = new Schedule();
            String date = request.getParameter("date");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            schedule.setDate(dateFormat.parse(date));
            schedule.setDateStatus(Integer.parseInt(status));
            schedule.setExpert(AuthorizationUtil.getUser());
        }
        baseManager.saveOrUpdate(Schedule.class.getName(), schedule);
        return status;
    }
    @RequestMapping(value = "/preMonth")
    public String preMonthSchedule(HttpServletRequest request,ModelMap modelMap) throws ParseException {
        String year=request.getParameter("year");
        String month=request.getParameter("month");
        String day=request.getParameter("day");
        String expertId=request.getParameter("expertId");
        Calendar calendar=Calendar.getInstance();
        if(year!=null&&!year.equals("")){
            calendar.set(Integer.parseInt(year),Integer.parseInt(month),Integer.parseInt(day));
            calendar.add(Calendar.DAY_OF_YEAR,-35);
        }
        Date date=calendar.getTime();
        List<Map> schedules=scheduleManager.getScheduleList(expertId,date);
        modelMap=scheduleManager.getCalendar(modelMap,date);
        modelMap.put("myUser",AuthorizationUtil.getMyUser());
        modelMap.put("scheduleList",schedules);
        return "/main/schedule";

    }
    /*下个月*/
    @RequestMapping(value = "/nextMonth")
    public String nextMonthSchedule(HttpServletRequest request,ModelMap modelMap) throws ParseException {
        String year=request.getParameter("year");
        String month=request.getParameter("month");
        String day=request.getParameter("day");
        String expertId=request.getParameter("expertId");
        Calendar calendar=Calendar.getInstance();
        if(year!=null&&!year.equals("")){
            calendar.set(Integer.parseInt(year),Integer.parseInt(month),Integer.parseInt(day));
            calendar.add(Calendar.DAY_OF_YEAR,35);
        }
        Date date=calendar.getTime();
        List<Map> schedules=scheduleManager.getScheduleList(expertId,date);
        modelMap=scheduleManager.getCalendar(modelMap,date);
        modelMap.put("myUser",AuthorizationUtil.getMyUser());
        modelMap.put("scheduleList",schedules);
        return "/main/schedule";
    }
    /*查看专家档期: 日期（日）、年月日、日期状态、档期id、过期状态、所在地点、年、月、日*/
    @RequestMapping(value = "/expertSchedule")
    @ResponseBody
    public Map viewExpertSchedule(HttpServletRequest request,ModelMap modelMap) throws ParseException {
        Map map=new HashMap();
        String expertId=request.getParameter("expertId");
        List<Map> schedules=scheduleManager.getScheduleList(expertId,new Date());

        Calendar currentCalendar=Calendar.getInstance();
        currentCalendar.setTime(new Date());
        int day=currentCalendar.get(Calendar.DAY_OF_MONTH);
        map.put("year", currentCalendar.get(Calendar.YEAR));
        map.put("month", currentCalendar.get(Calendar.MONTH)+1);
        map.put("day",day);
        int weekday=currentCalendar.get(Calendar.DAY_OF_WEEK);
        String bigDay="";
        switch (weekday){
            case 1:
                bigDay="日";
                break;
            case 2:
                bigDay="一";
                break;
            case 3:
                bigDay="二";
                break;
            case 4:
                bigDay="三";
                break;
            case 5:
                bigDay="四";
                break;
            case 6:
                bigDay="五";
                break;
            case 7:
                bigDay="六";
                break;
        }
        map.put("weekday",bigDay);
        map.put("scheduleList",schedules);
        return map;
    }
}
