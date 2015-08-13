package com.zhuanjiahui.order.model;

import com.zhuanjiahui.character.model.Expert;
import com.zhuanjiahui.main.model.ExpertServe;
import org.hibernate.annotations.GenericGenerator;


import javax.persistence.*;
import java.util.Date;

/**
 * Created by Administrator on 2015/7/20.
 */
@Entity
@Table(name="order_purchase_order_temp")
public class PurchaseOrderTemp {
    private String id;
    private ExpertServe expertServe;
    private Date orderDate;
    private Integer payType;//预付 全额
    private Integer dayType;//上午 下午 全天
    private PurchaseOrder purchaseOrder;

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
    @JoinColumn(name="expert_serve_id")
    public ExpertServe getExpertServe() {
        return expertServe;
    }

    public void setExpertServe(ExpertServe expertServe) {
        this.expertServe = expertServe;
    }
    @Column(name = "order_date")
    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
    @Column(name="pay_type")
    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }
    @Column(name="day_type")
    public Integer getDayType() {
        return dayType;
    }

    public void setDayType(Integer dayType) {
        this.dayType = dayType;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="purchase_order_id")
    public PurchaseOrder getPurchaseOrder() {
        return purchaseOrder;
    }

    public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
        this.purchaseOrder = purchaseOrder;
    }

}
