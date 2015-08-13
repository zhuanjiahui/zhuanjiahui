package com.zhuanjiahui.main.service;

import com.frame.core.taglib.PageEntity;
import com.frame.core.util.PageInfo;
import com.zhuanjiahui.main.model.ExpertServe;
import com.zhuanjiahui.main.model.ExpertServeContent;
import com.zhuanjiahui.main.model.ExpertServeIndustry;

import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by Administrator on 2015/7/8.
 */
public interface ExpertServeManager {
 /*   //专家服务课程
    public List<ExpertServeIndustry> pageExpertServe2(PageEntity pageEntity,LinkedHashMap<String,Object> params,String orderBy);*/

    public PageInfo pageExpertServe(PageEntity pageEntity,LinkedHashMap<String,Object> params,String orderBy);

    //列表也推荐专家服务
    public List<Object> listPageExpert(LinkedHashMap<String,Object> params);

    public List<ExpertServe> myExpertServes(String expertId);

    public PageInfo searchExpertServe(PageEntity pageEntity,String words);

    public List<ExpertServe> loadServeByType(String expertId,String serveType);

    /*专家服务大纲*/
    public List<ExpertServeContent> listServeContent(String expertId );
}
