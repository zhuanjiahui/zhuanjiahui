package com.zhuanjiahui.basic.model;

import com.frame.organization.model.User2;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: ming
 * Date: 12-10-30
 * Time: 上午11:43
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "info_sms")
public class Sms {

    private String id;
    private String content;
    private String target;
    private int amount; //短信成功发送了多少条
    private String serialNumber;    //流水号
    private Date theDatetime;
    private User2 author;
    private String result;


    @Id
    @GenericGenerator(name = "id", strategy = "com.frame.core.p.model.ZJHidGenerator")
    @GeneratedValue(generator = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


    @Column(name = "target")
    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    @Column(name = "the_date_time")
    public Date getTheDatetime() {
        return theDatetime;
    }

    public void setTheDatetime(Date theDatetime) {
        this.theDatetime = theDatetime;
    }

    @Column(name = "result")
    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    public User2 getAuthor() {
        return author;
    }

    public void setAuthor(User2 author) {
        this.author = author;
    }


    @Column(name = "amount")
    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Column(name = "serial_number")
    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    @Transient     //发送成功率
    public String getSuccessRate() {
        int total = target.split(",").length;
        return amount + "/" + total;
    }
}
