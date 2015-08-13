package com.zhuanjiahui.basic.service;

import com.frame.core.taglib.PageEntity;
import com.frame.core.util.PageInfo;
import com.zhuanjiahui.basic.model.Activity;
import com.zhuanjiahui.basic.model.ActivityGuest;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by Administrator on 2015/7/3.
 */
public interface ActivityManager {
    public List<Object> getNewActivities(int size);

    public PageInfo getPageActivities(PageEntity pageEntity,LinkedHashMap<String,Object> params,String orderBy);

    public PageInfo myFavoriteActivities(PageEntity pageEntity);

    public PageInfo publishActivities(String expertId,PageEntity pageEntity);

    public List<ActivityGuest> getGuestList(String activityId);
}
