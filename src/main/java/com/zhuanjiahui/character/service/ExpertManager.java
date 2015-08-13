package com.zhuanjiahui.character.service;




import com.frame.core.taglib.PageEntity;
import com.frame.core.util.PageInfo;
import com.zhuanjiahui.character.model.Expert;
import com.zhuanjiahui.character.model.ExpertIndustry;
import com.zhuanjiahui.character.model.ExpertIndustryMajor;

import javax.servlet.http.HttpServletRequest;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/6/30.
 */
public interface ExpertManager {
    public Expert setBaseMassage(Expert user1,Expert user2);
    //推荐的专家
    public List<Object> getHomeExpert(int size);
    //最新入驻
    public List<Object> getNewExpert(int size);
    //热门专家
    public List<Object> popularExpert(int size);
    //专家列表
    public PageInfo pageExpert(PageEntity pageEntity,LinkedHashMap<String,Object> param,String orderBy);
    //专家详情
    public Expert viewExpert(String id);
    //搜索专家
    public PageInfo searchExperts(String keywords);
    //查询一个专家
    public Expert getExpertByNamePsw(String username,String password);

    public void switchUtype(int utype,String userId);
}
