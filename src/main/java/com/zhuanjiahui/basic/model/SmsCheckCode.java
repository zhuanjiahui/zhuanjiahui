package com.zhuanjiahui.basic.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-7-2
 * Time: 上午11:50
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "info_sms_check_code")
public class SmsCheckCode {
    private String id;
    private String phone;
    private String code;
    private Date theDateTime;
    private String resultMsg;

    @Id
    @GenericGenerator(name = "id", strategy = "uuid")
    @GeneratedValue(generator = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(name = "phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Column(name = "code")
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Column(name = "the_date_time")
    public Date getTheDateTime() {
        return theDateTime;
    }

    public void setTheDateTime(Date theDateTime) {
        this.theDateTime = theDateTime;
    }

    @Column(name = "result_msg")
    public String getResultMsg() {
        return resultMsg;
    }

    public void setResultMsg(String resultMsg) {
        this.resultMsg = resultMsg;
    }


}
