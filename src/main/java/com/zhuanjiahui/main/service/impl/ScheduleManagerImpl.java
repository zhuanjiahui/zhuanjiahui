package com.zhuanjiahui.main.service.impl;

import com.frame.core.base.service.BaseManager;
import com.frame.core.util.AuthorizationUtil;
import com.zhuanjiahui.main.model.Schedule;
import com.zhuanjiahui.main.service.ScheduleManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Administrator on 2015/6/30.
 */
@Service
public class ScheduleManagerImpl implements ScheduleManager {
    @Autowired
    private BaseManager baseManager;
    /*获取某天所在的日历*/
    @Override
    public List<Map> getScheduleList(String userId,Date date) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date minDate = this.getMinDate(date,dateFormat);
        Date maxDate = this.getMaxDate(minDate,dateFormat);
        //本页面档期
        Map<String,Schedule> scheduleMap=findArrangementInfo(userId,minDate,maxDate);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(minDate);
        List<Map> schedules=new ArrayList<>(35);
        int num = 1;
        while (num <= 35) {//每一个月份显示六周的时间
            Map map = new HashMap();
            map.put("day", calendar.get(Calendar.DAY_OF_MONTH));
            map.put("date",dateFormat.format(calendar.getTime()));
            //日期状态
            map.put("dateStatus",1);
            Schedule schedule=scheduleMap.get(dateFormat.format(calendar.getTime()));
            if (schedule!=null){
                map.put("dateStatus",schedule.getDateStatus());
                map.put("address",schedule.getAddress());
                map.put("id",schedule.getId());
            }
            Date nowTime=new Date();
            long time=nowTime.getTime()+24*3600*1000;
            nowTime.setTime(time);
            if (calendar.getTime().compareTo(nowTime) < 0) {//当前操作的日期是否过期
                map.put("outOfDate", 1);//已过期
            } else {
                map.put("outOfDate", 0);
            }
            schedules.add(map);
            calendar.add(Calendar.DAY_OF_MONTH, 1);
            num++;
        }
        return schedules;
    }


    /**
     * 获取指定日期月份对应的预约日历的最小日期(默认日历中第一行第一个日期为星期一)
     * @param date
     * @return
     */
    private Date getMinDate(Date date, SimpleDateFormat dateFormat) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        int weekDay = calendar.get(Calendar.DAY_OF_WEEK);//获取当月1号是星期几.1表示星期天，2表示星期一 etc.
        calendar.add(Calendar.DAY_OF_MONTH, -(weekDay + 5) % 7);//[(weekDay+7)-2]%7
        try {
            date = dateFormat.parse(dateFormat.format(calendar.getTime()));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 获取指定日期月份对应的预约日历的最大日期(即日常日历中最后一行最后一个日期)
     *
     * @param date
     * @return
     */
    private Date getMaxDate(Date date, SimpleDateFormat dateFormat) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_MONTH, 34);  //显示5周的时间
        try {
            date = dateFormat.parse(dateFormat.format(calendar.getTime()));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
    /*
    * 获取某时间段的个人档期*/
    private Map<String, Schedule> findArrangementInfo(String userId,Date startDate, Date endDate) {
        LinkedHashMap paramMap = new LinkedHashMap();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        paramMap.put("userId", userId);
        paramMap.put("startDate", startDate);
        paramMap.put("endDate", endDate);
        String queryHql = "from "+Schedule.class.getName()+" s" +
                " where s.expert.id=:userId and s.date<=:endDate and s.date>=:startDate order by s.date desc";
        List list = baseManager.listObject(queryHql, paramMap);

        Map<String, Schedule> scheduleMap = new HashMap<String, Schedule>();
        for (Iterator iterator = list.iterator(); iterator.hasNext(); ) {
            Schedule schedule = (Schedule) iterator.next();
            //每个日期对应的预约信息
            scheduleMap.put(simpleDateFormat.format(schedule.getDate()), schedule);
        }
        return scheduleMap;
    }
    /*获取日历*/
    @Override
    public ModelMap getCalendar(ModelMap modelMap,Date date) {
        Calendar currentCalendar=Calendar.getInstance();
        currentCalendar.setTime(date);
        int day=currentCalendar.get(Calendar.DAY_OF_MONTH);
        modelMap.put("year", currentCalendar.get(Calendar.YEAR));
        modelMap.put("month", currentCalendar.get(Calendar.MONTH)+1);
        modelMap.put("day",day);
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
        modelMap.put("weekday",bigDay);
        return modelMap;
    }

    @Override
    public Schedule getSchedule(String userId, Date date) {

        Date date1=new Date(date.getTime()-1000);
        Date date2=new Date(date.getTime()+1000);
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String dateStr1=simpleDateFormat.format(date1);
        String dateStr2=simpleDateFormat.format(date2);
        try {
            date1=simpleDateFormat.parse(dateStr1);
            date2=simpleDateFormat.parse(dateStr2);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        LinkedHashMap<String,Object> param=new LinkedHashMap<>();
        param.put("date1",date1);
        param.put("date2",date2);
        String queryHQL="from "+Schedule.class.getName()+" s where s.expert.id='"+userId+"' and s.date>=:date1 and s.date<=:date2";
        return (Schedule)baseManager.getUniqueObjectByConditions(queryHQL,param);
    }
}
