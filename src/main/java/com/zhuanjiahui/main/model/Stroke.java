package com.zhuanjiahui.main.model;

import com.zhuanjiahui.character.model.Expert;

import com.zhuanjiahui.order.model.PurchaseOrder;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Administrator on 2015/6/24.
 * 行程
 */
@Entity
@Table(name="main_stroke")
public class Stroke {
    private String id;
    private Expert consumer;
    private Date date;
    private Integer dateStatus;//日程状态
    private PurchaseOrder purchaseOrder;
    private Integer theStatus;
    @Id
    @GenericGenerator(name="id",strategy = "com.frame.core.p.model.ZJHidGenerator")
    @GeneratedValue(generator = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="consumer_id")
    public Expert getConsumer() {
        return consumer;
    }

    public void setConsumer(Expert consumer) {
        this.consumer = consumer;
    }
    @Column(name="thestatus")
    public Integer getTheStatus() {
        return theStatus;
    }

    public void setTheStatus(Integer theStatus) {
        this.theStatus = theStatus;
    }
    @Column(name="date")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="purchase_order_id")
    public PurchaseOrder getPurchaseOrder() {
        return purchaseOrder;
    }

    public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
        this.purchaseOrder = purchaseOrder;
    }
    @Column(name="date_status")
    public Integer getDateStatus() {
        return dateStatus;
    }

    public void setDateStatus(Integer dateStatus) {
        this.dateStatus = dateStatus;
    }
}
