package com.zhuanjiahui.basic.controller;

import com.frame.core.taglib.PageEntity;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by Administrator on 2015/7/5.
 */
public class BaseController {
    /**
     * 获得pageEntity对象，该对象代表了列表页面中分页的具体信息，具体查看com.frame.core.taglib.PageEntity
     * @param request
     * @return
     */
    protected PageEntity getPageEntity(HttpServletRequest request) {
        String index = request.getParameter(PageEntity.PARAM_NAME_PAGEINDEX);
        String size = request.getParameter(PageEntity.PARAM_NAME_PAGERECORDS);
        PageEntity pageEntity = new PageEntity();
        pageEntity.setIndex(1);
        pageEntity.setSize(6);
        if (index != null && !index.equals("")) {
            pageEntity.setIndex(Integer.parseInt(index));
        }
        if (size != null && !size.equals("")) {
            pageEntity.setSize(Integer.parseInt(size));
        }
        return pageEntity;
    }
    /**
     * 把新的请求参数加到现有的参数map中
     * @param request
     * @return
     */
    protected LinkedHashMap<String, Object> getConditionMap(HttpServletRequest request,LinkedHashMap param) {

        LinkedHashMap<String, Object> queryParam;
        if (param != null) {
            queryParam = param;
        } else {
            queryParam = new LinkedHashMap<>();
        }
        String conditions = request.getParameter("conditions");
        if (conditions != null && !conditions.equals("") && !conditions.equals("null")) {
            List<String> params;
            if (conditions.contains("!")) {
                params = Arrays.asList(conditions.split("!"));
            } else {
                params = Arrays.asList(conditions);
            }
            for (String paramTemp : params) {
                String key = paramTemp.split(":")[0];
                if (!key.equals("")) {
                    if ( key.equals("industry") || key.equals("type") || key.equals("major")) {
                        Integer value = Integer.parseInt(paramTemp.split(":")[1]);
                        queryParam.put(key, value);
                    } else {
                        String value = paramTemp.split(":")[1];
                        queryParam.put(key, value);
                    }
                }
            }
        }
        String price0 = request.getParameter("price0");
        if (price0 != null&&!price0.equals(""))
            queryParam.put("price0", price0);
        String price1 = request.getParameter("price1");
        if (price1 != null&&!price1.equals(""))
            queryParam.put("price1", price1);
        return queryParam;
    }
    //获取当前的查询条件
    protected String getConditions(HttpServletRequest request){
        StringBuffer conditions=new StringBuffer(200);
        Enumeration params=request.getParameterNames();
        String paramName="";
        while (params.hasMoreElements()){
            paramName=params.nextElement().toString();
            conditions.append(paramName+"="+request.getParameter(paramName)+"&");
        }
        conditions.deleteCharAt(conditions.lastIndexOf("&"));
        return conditions.toString();
    }

    /**
     * 通过request对象创建一个新的参数map
     * @param request 请求对象
     * @return
     */
    protected LinkedHashMap<String, Object> getConditionMap(HttpServletRequest request) {
        return getConditionMap(request, null);
    }

    //还原查询参数，当前页面获得当前的查询信息，以便于添加新的查询信息，为了实现多参数查询
    protected String getCurrentConditions(HttpServletRequest request) {
        if (request.getParameter("conditions") != null && !request.getParameter("conditions").equals("")) {
            return request.getParameter("conditions") + "!";
        } else {
            return null;
        }
    }

    //还原all参数的值，判断当前页面是否是返回所有数据的页面
    protected String getCurrentAllParam(HttpServletRequest request) {
        if (request.getParameter("all") != null && !request.getParameter("all").equals("")) {
            return request.getParameter("all");
        } else {
            return null;
        }
    }
}
