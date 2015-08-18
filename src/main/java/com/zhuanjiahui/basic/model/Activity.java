package com.zhuanjiahui.basic.model;

import com.frame.core.base.service.BaseManager;
import com.frame.core.base.service.impl.BaseManagerImpl;
import com.frame.organization.model.*;
import com.zhuanjiahui.character.model.Expert;
import com.zhuanjiahui.order.model.PurchaseOrder;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/6/24.
 * 活动
 */
@Entity
@Table(name="basic_activity")
public class Activity {
    private String id;
    private String name;
    private Integer type;//专题培训
    private String address;
    private BigDecimal price;
    private Date activityDate;
    private Date activityDate2;
    private Date createDatetime;
    private String industry;//行业
    private String activityPicUrl;
    private Integer userNumber;
    private Integer realCount;
    private String linkman;
    private String telephone;
    private String introduce;
    private User user;
    private BigUser user2;
    private Province province;
    private Integer visitCount;


    private Integer favoriteCount;
    private List<ActivityGuest> activityGuests;
    private List<PurchaseOrder> purchaseOrderList;
    private List<ActivityDiscuss> activityDiscussList;
    private Integer theStatus;
    @Id
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    @Column(name="name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name="type")
    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
    @Column(name="address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    @Column(name="price")
    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    @Column(name="activity_date")
    public Date getActivityDate() {
        return activityDate;
    }

    public void setActivityDate(Date activityDate) {
        this.activityDate = activityDate;
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
    @Column(name="industry")
    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }
    @Column(name="activity_pic_url")
    public String getActivityPicUrl() {
        return activityPicUrl;
    }

    public void setActivityPicUrl(String activityPicUrl) {
        this.activityPicUrl = activityPicUrl;
    }
    @Column(name="user_number")
    public Integer getUserNumber() {
        return userNumber;
    }

    public void setUserNumber(Integer userNumber) {
        this.userNumber = userNumber;
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
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "activity")
    public List<ActivityGuest> getActivityGuests() {
        return activityGuests;
    }

    public void setActivityGuests(List<ActivityGuest> activityGuests) {
        this.activityGuests = activityGuests;
    }

    @ManyToMany(cascade = CascadeType.PERSIST,mappedBy = "activityList")
    public List<PurchaseOrder> getPurchaseOrderList() {
        return purchaseOrderList;
    }

    public void setPurchaseOrderList(List<PurchaseOrder> purchaseOrderList) {
        this.purchaseOrderList = purchaseOrderList;
    }

    @Column(name="favorite_count")
    public Integer getFavoriteCount() {
        return favoriteCount;
    }

    public void setFavoriteCount(Integer favoriteCount) {
        this.favoriteCount = favoriteCount;
    }
    @Column(name="introduce")
    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }
    @Column(name="real_count")
    public Integer getRealCount() {
        return realCount;
    }

    public void setRealCount(Integer realCount) {
        this.realCount = realCount;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="province_id")
    public Province getProvince() {
        return province;
    }

    public void setProvince(Province province) {
        this.province = province;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id",insertable = false,updatable = false)
    public BigUser getUser2() {
        return user2;
    }

    public void setUser2(BigUser user2) {
        this.user2 = user2;
    }

    @Column(name="visit_count")
    public Integer getVisitCount() {
        return visitCount;
    }

    public void setVisitCount(Integer visitCount) {
        this.visitCount = visitCount;
    }
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "activity")
    public List<ActivityDiscuss> getActivityDiscussList() {
        return activityDiscussList;
    }

    public void setActivityDiscussList(List<ActivityDiscuss> activityDiscussList) {
        this.activityDiscussList = activityDiscussList;
    }
    @Column(name="activity_date2")
    public Date getActivityDate2() {
        return activityDate2;
    }

    public void setActivityDate2(Date activityDate2) {
        this.activityDate2 = activityDate2;
    }

}
