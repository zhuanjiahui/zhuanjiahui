package com.zhuanjiahui.main.model;

import com.frame.organization.model.User;
import com.zhuanjiahui.character.model.Expert;
import com.zhuanjiahui.order.model.PurchaseOrder;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Administrator on 2015/6/24.
 * 档期
 */
@Entity
@Table(name="main_schedule")
public class Schedule {
    private String id;
    private Date date;
    private Integer dateStatus;//0不可约  1可约  2抢约 3已约
    private User expert;
    private Expert expert2;
    private PurchaseOrder purchaseOrder;
    private String address;
    @Id
    @GenericGenerator(name="id",strategy = "com.frame.core.p.model.ZJHidGenerator")
    @GeneratedValue(generator = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    @Column(name="date")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    @Column(name="date_status")
    public Integer getDateStatus() {
        return dateStatus;
    }

    public void setDateStatus(Integer dateStatus) {
        this.dateStatus = dateStatus;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="expert_id")
    public User getExpert() {
        return expert;
    }

    public void setExpert(User expert) {
        this.expert = expert;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="expert_id",insertable = false,updatable = false)
    public Expert getExpert2() {
        return expert2;
    }

    public void setExpert2(Expert expert) {
        this.expert2 = expert;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="purchase_order_id")
    public PurchaseOrder getPurchaseOrder() {
        return purchaseOrder;
    }

    public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
        this.purchaseOrder = purchaseOrder;
    }
    @Column(name="address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
