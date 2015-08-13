package com.frame.organization.model;

import com.zhuanjiahui.character.model.Company;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/7/2.
 */
@Entity
@Table(name="organization_user")
@Inheritance(strategy = InheritanceType.JOINED)
public class BigUser {
    protected String id;
    protected String idNo;
    protected String username;
    protected String name;
    protected String password;
    private Integer checkStatus;// 审核状态：1刚刚注册 2基本信息填写完毕（包括行业和专业） 3增添服务  4审核未通过  5审核通过待认证 6认证不通过 7身份认证通过  9完全设置完毕
    protected Integer utype;//用户类型：用户1、专家2、助理3、系统管理员4
    protected Integer gender;//性别 男1 女0
    protected Date birthday;
    protected Date createDatetime;//入驻日期
    protected String pictureUrl;//头像
    private BigDecimal balance;//账户余额
    protected String phone;
    protected String email;
    protected String memo;//描述
    protected Integer roleType;//用户等级 普通1 会员2
    protected String introduce;//介绍

    protected String companyName;//现任公司
    protected String companyAddress;
    protected String companyMemo;
    protected String industry;//公司行业

    protected Province province;
    protected Integer workTime;
    protected Date lastLogintime;
    protected Integer orderNumber;//订单量
    protected Integer praise;//好评
    protected Integer visitCount;//访问量
    protected Integer orderValue;//排序值

    protected String identityPicUrl;
    protected String identityPicUrl2;
    protected Integer theStatus;//数据状态
    protected boolean enabled;               //是否可用
    protected boolean accountExpired;       //账号过期
    protected boolean accountLocked;        //账号锁定
    protected boolean credentialsExpired;  //证书过期
    @Id
    @GenericGenerator(name="id",strategy = "com.frame.core.p.model.ZJHidGenerator")
    @GeneratedValue(generator = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    @Column(name="id_no")
    public String getIdNo() {
        return idNo;
    }

    public void setIdNo(String idNo) {
        this.idNo = idNo;
    }
    @Column(name="check_status")
    public Integer getCheckStatus() {
        return checkStatus;
    }

    public void setCheckStatus(Integer checkStatus) {
        this.checkStatus = checkStatus;
    }

    @Column(name="username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    @Column(name="name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    @Column(name="password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    @Column(name="utype")
    public Integer getUtype() {
        return utype;
    }

    public void setUtype(Integer utype) {
        this.utype = utype;
    }

    @Column(name="gender")
    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }
    @Column(name="birthday")
    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
    @Column(name="create_datetime")
    public Date getCreateDatetime() {
        return createDatetime;
    }

    public void setCreateDatetime(Date createDatetime) {
        this.createDatetime = createDatetime;
    }
    @Column(name="picture_url")
    public String getPictureUrl() {
        return pictureUrl;
    }

    public void setPictureUrl(String pictureUrl) {
        this.pictureUrl = pictureUrl;
    }
    @Column(name="phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    @Column(name="email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    @Column(name="memo")
    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }
    @Column(name="role_type")
    public Integer getRoleType() {
        return roleType;
    }

    public void setRoleType(Integer roleType) {
        this.roleType = roleType;
    }

    @Column(name="company_name")
    public String getCompanyName() {
            return companyName;
        }

    public void setCompanyName(String companyName) {
            this.companyName = companyName;
        }
    @Column(name="company_address")
    public String getCompanyAddress() {
            return companyAddress;
        }

    public void setCompanyAddress(String companyAddress) {
            this.companyAddress = companyAddress;
        }
    @Column(name="company_memo")
    public String getCompanyMemo() {
            return companyMemo;
        }

    public void setCompanyMemo(String companyMemo) {
            this.companyMemo = companyMemo;
        }

    @Column(name="thestatus")
    public Integer getTheStatus() {
        return theStatus;
    }

    public void setTheStatus(Integer theStatus) {
        this.theStatus = theStatus;
    }
    @Column(name="is_enabled")
    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
    @Column(name="is_account_expired")
    public boolean isAccountExpired() {
        return accountExpired;
    }

    public void setAccountExpired(boolean accountExpired) {
        this.accountExpired = accountExpired;
    }
    @Column(name="is_account_locked")
    public boolean isAccountLocked() {
        return accountLocked;
    }

    public void setAccountLocked(boolean accountLocked) {
        this.accountLocked = accountLocked;
    }
    @Column(name="is_credentials_expired")
    public boolean isCredentialsExpired() {
        return credentialsExpired;
    }

    public void setCredentialsExpired(boolean credentialsExpired) {
        this.credentialsExpired = credentialsExpired;
    }
    @Column(name="work_time")
    public Integer getWorkTime() {
        return workTime;
    }

    public void setWorkTime(Integer workTime) {
        this.workTime = workTime;
    }
    @Column(name="last_login_time")
    public Date getLastLogintime() {
        return lastLogintime;
    }

    public void setLastLogintime(Date lastLogintime) {
        this.lastLogintime = lastLogintime;
    }
    @Column(name="order_number")
    public Integer getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(Integer orderNumber) {
        this.orderNumber = orderNumber;
    }
    @Column(name="praise")
    public Integer getPraise() {
        return praise;
    }

    public void setPraise(Integer praise) {
        this.praise = praise;
    }
    @Column(name="visit_count")
    public Integer getVisitCount() {
        if (visitCount==null){
            return 0;
        }else {
            return visitCount;
        }
    }

    public void setVisitCount(Integer visitCount) {
        this.visitCount = visitCount;
    }
    @Column(name="order_value")
    public Integer getOrderValue() {
        return orderValue;
    }

    public void setOrderValue(Integer orderValue) {
        this.orderValue = orderValue;
    }
    @Column(name="industry")
    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }
    @Column(name="identity_pic_url")
    public String getIdentityPicUrl() {
        return identityPicUrl;
    }

    public void setIdentityPicUrl(String identityPicUrl) {
        this.identityPicUrl = identityPicUrl;
    }
    @Column(name="identity_pic_url2")
    public String getIdentityPicUrl2() {
        return identityPicUrl2;
    }

    public void setIdentityPicUrl2(String identityPicUrl2) {
        this.identityPicUrl2 = identityPicUrl2;
    }
    @Column(name="balance")
    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="province_id")
    public Province getProvince() {
        return province;
    }

    public void setProvince(Province province) {
        this.province = province;
    }
    @Column(name="introduce")
    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }
}
