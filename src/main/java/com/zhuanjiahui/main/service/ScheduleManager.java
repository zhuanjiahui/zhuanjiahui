package com.zhuanjiahui.main.service;

import com.zhuanjiahui.main.model.Schedule;
import org.springframework.ui.ModelMap;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/6/30.
 */
public interface ScheduleManager {
    public List<Map> getScheduleList(String userId,Date date) throws ParseException;

    public ModelMap getCalendar(ModelMap modelMap,Date date);

    public Schedule getSchedule(String userId,Date date);
}
