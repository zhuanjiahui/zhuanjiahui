package com.zhuanjiahui.character.service;

import com.zhuanjiahui.character.model.Company;

import java.util.List;

/**
 * Created by Administrator on 2015/7/30.
 */
public interface CompanyManager {
    public List<Company> listCompany(String expertId);
}
