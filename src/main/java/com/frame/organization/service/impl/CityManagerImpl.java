package com.frame.organization.service.impl;

import com.frame.core.base.service.BaseManager;
import com.frame.organization.model.City;
import com.frame.organization.model.District;
import com.frame.organization.model.Province;
import com.frame.organization.service.CityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2015/7/14.
 */
@Service
public class CityManagerImpl implements CityManager {
    @Autowired
    private BaseManager baseManager;
    @Override
    public List<Province> getProvinces() {
        String queryHQL="from Province p";
        return baseManager.listObject(queryHQL);
    }

    @Override
    public List<City> getCitys(String provinceId) {
        String queryHQL="from City c where c.province.id="+provinceId;
        return baseManager.listObject(queryHQL);
    }

    @Override
    public List<District> getDistricts(String cityId) {
        String queryHQL="from District t where t.city.id="+cityId;
        return baseManager.listObject(queryHQL);

    }

    @Override
    public Province getProvince(String id) {
        return (Province)baseManager.getObject(Province.class.getName(),id);
    }
}
