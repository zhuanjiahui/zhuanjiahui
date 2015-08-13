package com.frame.organization.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

/**
 * Created by Administrator on 2015/7/21.
 */
public interface SmsProvider {

    /*发送验证码*/
    public String send(String mobile, String content);
    /*发送短信*/
    public String sendMsg(String mobile, String content, String ext, String stime,
                            String rrid,String msgfmt);
}
