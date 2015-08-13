package com.frame.organization.controller;

import com.frame.organization.model.City;
import com.frame.organization.model.District;
import com.frame.organization.model.Province;
import com.frame.organization.model.User;
import com.frame.organization.service.CityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2015/7/14.
 */
@Controller
@RequestMapping(value = "/pc/city")
public class CityController {
    @Autowired
    private CityManager cityManager;
    @RequestMapping(value = "/jCityList")
    @ResponseBody
    public List<City> getCitys(HttpServletRequest request){
        List<City> cities=new ArrayList<>();
        String provinceId=request.getParameter("provinceId");
        return cityManager.getCitys(provinceId);

    }
    @RequestMapping(value = "/jDistrictList")
    @ResponseBody
    public List<District> getDistricts(HttpServletRequest request){
        List<District> districts=new ArrayList<>();
        String cityId=request.getParameter("cityId");
        return cityManager.getDistricts(cityId);
    }
}
