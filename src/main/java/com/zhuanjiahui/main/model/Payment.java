package com.zhuanjiahui.main.model;

import com.frame.organization.model.User2;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by Administrator on 2015/6/26.
 */
@Entity
@Table(name="main_payment")
public class Payment {
    private String id;
    private Integer payType;//1 收入 2支出
    private User2 incomeUser;
    private User2 outlayUser;
    private BigDecimal payed;
    private Date createDatetime;
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
    @Column(name="pay_type")
    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="income_user_id")
    public User2 getIncomeUser() {
        return incomeUser;
    }

    public void setIncomeUser(User2 incomeUser) {
        this.incomeUser = incomeUser;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="outlay_user_id")
    public User2 getOutlayUser() {
        return outlayUser;
    }

    public void setOutlayUser(User2 outlayUser) {
        this.outlayUser = outlayUser;
    }
    @Column(name="payed")
    public BigDecimal getPayed() {
        return payed;
    }

    public void setPayed(BigDecimal payed) {
        this.payed = payed;
    }
    @Column(name="create_datetime")
    public Date getCreateDatetime() {
        return createDatetime;
    }

    public void setCreateDatetime(Date createDatetime) {
        this.createDatetime = createDatetime;
    }
    @Column(name="thestatus")
    public Integer getTheStatus() {
        return theStatus;
    }

    public void setTheStatus(Integer theStatus) {
        this.theStatus = theStatus;
    }
}
