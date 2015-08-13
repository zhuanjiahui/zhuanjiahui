package com.zhuanjiahui.manage.service.impl;

import com.frame.core.base.service.BaseManager;
import com.frame.core.taglib.PageEntity;
import com.frame.core.util.PageInfo;

import com.zhuanjiahui.character.model.Expert;
import com.zhuanjiahui.manage.service.SystemManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2015/6/29.
 */
@Service
public class SystemManagerImpl implements SystemManager {
    @Autowired
    private BaseManager baseManager;
    @Override
    public PageInfo getPageExpertList(PageEntity pageEntity) {
        String hqlHQL="from "+Expert.class.getName()+" s where s.theStatus=1";
        return baseManager.listPageInfo(hqlHQL,pageEntity,null);
    }
}
