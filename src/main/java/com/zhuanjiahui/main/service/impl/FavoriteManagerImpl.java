package com.zhuanjiahui.main.service.impl;

import com.frame.core.base.service.BaseManager;
import com.frame.core.taglib.PageEntity;
import com.frame.core.util.PageInfo;
import com.zhuanjiahui.main.model.FavoriteExpert;
import com.zhuanjiahui.main.service.FavoriteManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2015/7/10.
 */
@Service
public class FavoriteManagerImpl implements FavoriteManager {
    @Autowired
    private BaseManager baseManager;
    @Override
    public PageInfo pageFavoriteExpert(String userId,PageEntity pageEntity) {
        String queryHQL="select s.expert from  FavoriteExpert s where s.theStatus=1 and s.user.id='"+userId+"'";
        return baseManager.listPageInfo(queryHQL,pageEntity,null);
    }

    @Override
    public FavoriteExpert getFavoriteExpert(String userId, String expertId) {
        String queryHQL="from FavoriteExpert s where s.theStatus=1 and s.user.id='"+userId+"' s.expert.id='"+expertId+"'";
        return (FavoriteExpert)baseManager.getUniqueObjectByConditions(queryHQL,null);
    }
}
