package com.zhuanjiahui.main.service;

import com.frame.core.taglib.PageEntity;
import com.frame.core.util.PageInfo;
import com.zhuanjiahui.main.model.FavoriteExpert;

import java.util.List;

/**
 * Created by Administrator on 2015/7/10.
 */
public interface FavoriteManager {
    /*我的收藏专家*/
    public PageInfo pageFavoriteExpert(String userId,PageEntity pageEntity);
    /*是否已经收藏*/
    public FavoriteExpert getFavoriteExpert(String userId,String expertId);
}
