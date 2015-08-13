package com.frame.organization.service;

/**
 * Created by Administrator on 2015/7/21.
 */
public interface SmsManager {
    public String send(String phone, String content,String company);

    public Boolean validate(String phone, String code);
}
