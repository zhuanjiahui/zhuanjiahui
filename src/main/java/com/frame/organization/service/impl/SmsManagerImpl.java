package com.frame.organization.service.impl;

import com.frame.core.base.service.BaseManager;
import com.frame.core.util.DateUtil;
import com.frame.organization.service.SmsManager;
import com.frame.organization.service.SmsProvider;
import com.zhuanjiahui.basic.model.SmsCheckCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by Administrator on 2015/7/21.
 */
@Service
public class SmsManagerImpl implements SmsManager{

    @Autowired
    private BaseManager baseManager;


    @Override
    public Boolean validate(String phone, String code) {
        String hql = "from SmsCheckCode s where s.phone=:phone and s.code=:code";
        LinkedHashMap<String, Object> queryParamMap = new LinkedHashMap<>();
        queryParamMap.put("phone", phone);
        queryParamMap.put("code", code);
        SmsCheckCode smsCheckCode = (SmsCheckCode) baseManager.getUniqueObjectByConditions(hql, queryParamMap);
        if (smsCheckCode != null && DateUtil.compareDate(new Date(), smsCheckCode.getTheDateTime()) < 1) {
            return true;
        } else {
            return false;
        }
    }

    private Boolean validateSendTime(String phone) {
        String hql = "select s from SmsCheckCode s where s.phone=:phone order by s.theDateTime DESC";
        LinkedHashMap<String, Object> queryParamMap = new LinkedHashMap<>();
        queryParamMap.put("phone", phone);
        List<Object> objectList = baseManager.listObject(hql, queryParamMap);
        SmsCheckCode smsCheckCode = null;
        if (objectList != null && objectList.size() > 0) {
            smsCheckCode = (SmsCheckCode) objectList.get(0);
        }

        if (smsCheckCode != null && calLastedTime(smsCheckCode.getTheDateTime()) < 50) {
            return true;
        } else {
            return false;
        }
    }

    private int calLastedTime(Date startDate) {
        long a = new Date().getTime();
        long b = startDate.getTime();
        int c = (int) ((a - b) / 1000);
        return c;
    }

    @Override
    public String send(String phone, String content,String company)  {
        SmsProvider smsProvider= null;
        if("chuanglan".equals(company)){
            smsProvider=new ChuangLanProvider();
        }

            String sendCode = smsProvider.send(phone, content + "验证码");
            SmsCheckCode smsCheckCode = new SmsCheckCode();
            smsCheckCode.setCode(content);
            smsCheckCode.setPhone(phone);
            smsCheckCode.setResultMsg(sendCode);
            smsCheckCode.setTheDateTime(new Date());
            baseManager.saveOrUpdate(SmsCheckCode.class.getName(), smsCheckCode);
            return sendCode;


        }
}
