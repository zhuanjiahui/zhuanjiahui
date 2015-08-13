package com.frame.organization.service;

import com.frame.organization.model.City;
import com.frame.organization.model.District;
import com.frame.organization.model.Province;

import java.util.List;

/**
 * Created by Administrator on 2015/7/14.
 */
public abstract interface CityManager {

    public Province getProvince(String id);

    public List<Province> getProvinces();

    public List<City> getCitys(String provinceId);

    public List<District> getDistricts(String cityId);
}
