package com.zhuanjiahui.basic.service;

import com.frame.core.taglib.PageEntity;
import com.frame.core.util.PageInfo;

import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by Administrator on 2015/7/3.
 */
public interface RequirementManager {
    /*最新需求*/
    public List<Object> getNewRequirements(int size);

    public PageInfo getPageRequirement(PageEntity pageEntity,LinkedHashMap<String,Object> params,String orderBy);
    /*发布的需求*/
    public PageInfo publishRequirements(PageEntity pageEntity,String userId);
}
