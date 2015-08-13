package com.zhuanjiahui.character.service.impl;

import com.frame.core.base.service.BaseManager;
import com.zhuanjiahui.character.model.Company;
import com.zhuanjiahui.character.service.CompanyManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2015/7/30.
 */
@Service
public class CompanyManagerImpl implements CompanyManager {
    @Autowired
    private BaseManager baseManager;
    @Override
    public List<Company> listCompany(String expertId) {
        String queryHQL="from "+Company.class.getName()+" s where s.expert.id='"+expertId+"'";
        return baseManager.listObject(queryHQL);
    }
}
