package com.zhuanjiahui.main.controller;

import com.frame.core.base.service.BaseManager;
import com.frame.core.taglib.PageEntity;
import com.frame.core.util.AuthorizationUtil;
import com.frame.core.util.PageInfo;
import com.frame.organization.model.MyUser;
import com.zhuanjiahui.basic.controller.BaseController;
import com.zhuanjiahui.character.model.Expert;
import com.zhuanjiahui.main.model.FavoriteExpert;
import com.zhuanjiahui.main.service.FavoriteManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by Administrator on 2015/7/22.
 */
@Controller
@RequestMapping(value = "/pc/favorite")
public class FavoriteController extends BaseController {
    @Autowired
    private FavoriteManager favoriteManager;
    @Autowired
    private BaseManager baseManager;
    /*我收藏的专家*/
    @RequestMapping(value = "/listExpert")
    public String myFavoriteExperts(HttpServletRequest request,ModelMap modelMap){
        String userId= AuthorizationUtil.getMyUser().getId();
        PageEntity pageEntity=this.getPageEntity(request);
        PageInfo pageInfo=favoriteManager.pageFavoriteExpert(userId,pageEntity);
        modelMap.put("myUser",AuthorizationUtil.getMyUser());
        modelMap.put("pageInfo",pageInfo);
        modelMap.put("pageEntity",pageEntity);
        return "/main/favoriteExperts";
    }
    /*收藏专家*/
    @RequestMapping(value = "/addExpert")
    @ResponseBody
    public Boolean favoriteExpert(HttpServletRequest request){
        MyUser user=AuthorizationUtil.getMyUser();
        String expertId=request.getParameter("expertId");
        if(!user.getId().equals(expertId)){
            Expert expert=(Expert)baseManager.getObject(Expert.class.getName(),expertId);
            FavoriteExpert favoriteExpert=new FavoriteExpert();
            favoriteExpert.setExpert(expert);
            favoriteExpert.setTheStatus(1);
            favoriteExpert.setCreateDatetime(new Date());
            favoriteExpert.setUser(user);
            baseManager.saveOrUpdate(FavoriteExpert.class.getName(),favoriteExpert);
            return true;
        }
        return false;
    }
    /*收藏专家*/
    @RequestMapping(value = "/delExpert")
    @ResponseBody
    public Boolean delFavoriteExpert(HttpServletRequest request){
        try {
            String expertId=request.getParameter("expertId");
            baseManager.remove(FavoriteExpert.class.getName(),expertId);
            return true;
        }catch (NullPointerException e){
            return false;
        }

    }
}
