package com.zhuanjiahui.order.model;

import com.frame.organization.model.Province;
import com.frame.organization.model.User;
import com.zhuanjiahui.basic.model.Activity;
import com.zhuanjiahui.basic.model.Requirement;

import com.zhuanjiahui.character.model.Assistant;

import com.zhuanjiahui.character.model.Expert;
import com.zhuanjiahui.main.model.ExpertServe;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/6/24.
 */
@Entity
@Table(name="order_purchase_order")
public class PurchaseOrder {
    private String id;
    private String serial;//序列号 时间
    private String ptype;//培训、咨询、开发
    private String orderType;//normal正常订单、activity活动订单
    private String industry;
    private String major;
    private User consumer;
    private Expert consumer2;//用户
    private User expert;
    private Expert expert2;//专家
    private Assistant assistant;//助理
    private Integer processStatus;//待确认  专家取消 专家确认 用户取消  用户确认（服务完成）
    private Integer payStatus;//支付状态 未支付 已预付 已支付
    private BigDecimal total;//金额
    private Date createDatetime;//下单时间
    private Date serveDatetime;
    private Activity activity;
    private Requirement requirement;
    private Integer workDays;//工作周期
    private Integer dayType;// 半天
    private Integer payType;//全额 预付
    private List<PurchaseOrderPayment> purchaseOrderPaymentList;
    private Integer theStatus;
    private ExpertServe expertServe;
    private String linkman;
    private String telephone;
    private String linkAddress;
    private Province province;
    private String memo;//订单备注，补充说明的要求
    private List<Activity> activityList;


    @Id
    @GenericGenerator(name="id",strategy = "com.frame.core.p.model.ZJHidGenerator")
    @GeneratedValue(generator = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    @Column(name="serial")
    public String getSerial() {
        return serial;
    }

    public void setSerial(String serial) {
        this.serial = serial;
    }
    @Column(name="ptype")
    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype;
    }

    @Column(name="order_type")
    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="consumer_id",insertable = false,updatable = false)
    public Expert getConsumer2() {
        return consumer2;
    }

    public void setConsumer2(Expert consumer) {
        this.consumer2 = consumer;
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
    @JoinColumn(name="consumer_id")
    public User getConsumer() {
        return consumer;
    }

    public void setConsumer(User consumer) {
        this.consumer = consumer;
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
    @JoinColumn(name="assistant_id")
    public Assistant getAssistant() {
        return assistant;
    }

    public void setAssistant(Assistant assistant) {
        this.assistant = assistant;
    }
    @Column(name="process_status")
    public Integer getProcessStatus() {
        return processStatus;
    }

    public void setProcessStatus(Integer processStatus) {
        this.processStatus = processStatus;
    }
    @Column(name="total")
    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    @Column(name="create_datetime")
    public Date getCreateDatetime() {
        return createDatetime;
    }

    public void setCreateDatetime(Date createDatetime) {
        this.createDatetime = createDatetime;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="activity_id")
    public Activity getActivity() {
        return activity;
    }

    public void setActivity(Activity activity) {
        this.activity = activity;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="requirement_id")
    public Requirement getRequirement() {
        return requirement;
    }

    public void setRequirement(Requirement requirement) {
        this.requirement = requirement;
    }
    @Column(name="work_days")
    public Integer getWorkDays() {
        return workDays;
    }

    public void setWorkDays(Integer workDays) {
        this.workDays = workDays;
    }
    @Column(name="thestatus")
    public Integer getTheStatus() {
        return theStatus;
    }

    public void setTheStatus(Integer theStatus) {
        this.theStatus = theStatus;
    }
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "purchaseOrder")
    public List<PurchaseOrderPayment> getPurchaseOrderPaymentList() {
        return purchaseOrderPaymentList;
    }

    public void setPurchaseOrderPaymentList(List<PurchaseOrderPayment> purchaseOrderPaymentList) {
        this.purchaseOrderPaymentList = purchaseOrderPaymentList;
    }
    @Column(name="industry")
    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }
    @Column(name="major")
    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }
    @Column(name="day_type")
    public Integer getDayType() {
        return dayType;
    }

    public void setDayType(Integer dayType) {
        this.dayType = dayType;
    }
    @Column(name="pay_type")
    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="expert_serve_id")
    public ExpertServe getExpertServe() {
        return expertServe;
    }

    public void setExpertServe(ExpertServe expertServe) {
        this.expertServe = expertServe;
    }
    @Column(name="serve_datetime")
    public Date getServeDatetime() {
        return serveDatetime;
    }

    public void setServeDatetime(Date serveDatetime) {
        this.serveDatetime = serveDatetime;
    }
    @Column(name="linkman")
    public String getLinkman() {
        return linkman;
    }

    public void setLinkman(String linkman) {
        this.linkman = linkman;
    }
    @Column(name="telephone")
    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
    @Column(name="link_address")
    public String getLinkAddress() {
        return linkAddress;
    }

    public void setLinkAddress(String linkAddress) {
        this.linkAddress = linkAddress;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="province_id")
    public Province getProvince() {
        return province;
    }

    public void setProvince(Province province) {
        this.province = province;
    }
    @Column(name="memo")
    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }
    @Column(name="pay_status")
    public Integer getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(Integer payStatus) {
        this.payStatus = payStatus;
    }
    @ManyToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
    @JoinTable(name = "basic_activity_order",
            joinColumns = {@JoinColumn(name = "activity_id", referencedColumnName = "id")},
            inverseJoinColumns = {@JoinColumn(name = "order_id", referencedColumnName = "id")})
    public List<Activity> getActivityList() {
        return activityList;
    }

    public void setActivityList(List<Activity> activityList) {
        this.activityList = activityList;
    }
}
