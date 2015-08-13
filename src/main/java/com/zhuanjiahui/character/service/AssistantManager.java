package com.zhuanjiahui.character.service;

import com.frame.core.taglib.PageEntity;
import com.frame.core.util.PageInfo;
import com.zhuanjiahui.character.model.Assistant;

import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by Administrator on 2015/7/2.
 */
public interface AssistantManager {
    public List<Object> popularAssistants(int size);

    public PageInfo pageAssistants(PageEntity pageEntity,LinkedHashMap<String,Object> params,String orderBy);

    public PageInfo myExperts(PageEntity pageEntity,String userId);
}
