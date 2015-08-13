package com.zhuanjiahui.order.model;

import com.frame.organization.model.User2;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by Administrator on 2015/6/25.
 */

@Entity
@Table(name = "order_purchase_order_payment")
public class PurchaseOrderPayment {

    private String id;
    private PurchaseOrder purchaseOrder;
    private Integer payType;//付款类型 预付  全额支付 余款支付
    private BigDecimal payed;
    private Integer gateway;//支付方式  1 支付宝 2易宝网银 3易宝手机一键  21 微信支付   31 企业支付(支付码)
    private String serial;//交易流水号
    private Date createDatetime;
    private String account;//支付宝交易号||微信交易号
    private Integer payStatus;//支付状态 1成功 0失败

    @Id
    @GenericGenerator(name = "id", strategy = "com.frame.core.p.model.ZJHidGenerator")
    @GeneratedValue(generator = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @JoinColumn(name = "purchase_order_id")
    @ManyToOne(fetch = FetchType.LAZY)
    public PurchaseOrder getPurchaseOrder() {
        return purchaseOrder;
    }

    public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
        this.purchaseOrder = purchaseOrder;
    }

    @Column(name = "payed")
    public BigDecimal getPayed() {
        return payed;
    }


    public void setPayed(BigDecimal payed) {
        this.payed = payed;
    }

    @Column(name = "gateway")
    public Integer getGateway() {
        return gateway;
    }

    public void setGateway(Integer gateway) {
        this.gateway = gateway;
    }



    @Column(name = "create_datetime")
    public Date getCreateDatetime() {
        return createDatetime;
    }

    public void setCreateDatetime(Date createDatetime) {
        this.createDatetime = createDatetime;
    }

    @Column(name = "account")
    public String getAccount(){
        return account;
    }
    public void setAccount(String account){
        this.account = account;
    }
    @Column(name="pay_type")
    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }
    @Column(name="serial")
    public String getSerial() {
        return serial;
    }

    public void setSerial(String serial) {
        this.serial = serial;
    }
    @Column(name="pay_status")
    public Integer getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(Integer payStatus) {
        this.payStatus = payStatus;
    }
}
