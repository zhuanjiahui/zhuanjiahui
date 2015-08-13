package com.zhuanjiahui.basic.model;


import com.frame.organization.model.BigUser;
import com.frame.organization.model.Province;
import com.frame.organization.model.User;
import com.zhuanjiahui.character.model.Expert;
import org.hibernate.annotations.GenericGenerator;


import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/7/31.
 */
@Entity
@Table(name="basic_requirement")
public class Requirement {
    private String id;
    private String name;
    private String type;
    private String industry;
    private BigDecimal price;//预算
    private String memo;//期望
    private Date createDatetime;
    private Date startDatetime;
    private String address;
    private String linkman;
    private String telephone;
    private Integer theStatus;
    private String itemsName;//类似项目名称
    private String itemsUrl;//项目路径
    private Integer favoriteCount;
    private Province province;
    private String introduce;
    private String major;
    private String courseType;
    private String developType;
    private User expert;
    private List<RequirementDiscuss> requirementDiscussList;
    @Id
    @GenericGenerator(name="id",strategy = "com.frame.core.p.model.ZJHidGenerator")
    @GeneratedValue(generator = "id")
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
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    @Column(name="industry")
    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }
    @Column(name="price")
    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    @Column(name="memo")
    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }
    @Column(name="create_datetime")
    public Date getCreateDatetime() {
        return createDatetime;
    }

    public void setCreateDatetime(Date createDatetime) {
        this.createDatetime = createDatetime;
    }
    @Column(name="start_datetime")
    public Date getStartDatetime() {
        return startDatetime;
    }

    public void setStartDatetime(Date startDatetime) {
        this.startDatetime = startDatetime;
    }
    @Column(name="address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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
    @Column(name="thestatus")
    public Integer getTheStatus() {
        return theStatus;
    }

    public void setTheStatus(Integer theStatus) {
        this.theStatus = theStatus;
    }
    @Column(name="items_name")
    public String getItemsName() {
        return itemsName;
    }

    public void setItemsName(String itemsName) {
        this.itemsName = itemsName;
    }
    @Column(name="items_url")
    public String getItemsUrl() {
        return itemsUrl;
    }

    public void setItemsUrl(String itemsUrl) {
        this.itemsUrl = itemsUrl;
    }
    @Column(name="favorite_count")
    public Integer getFavoriteCount() {
        return favoriteCount;
    }

    public void setFavoriteCount(Integer favoriteCount) {
        this.favoriteCount = favoriteCount;
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
    @JoinColumn(name="expert_id")
    public User getExpert() {
        return expert;
    }

    public void setExpert(User expert) {
        this.expert = expert;
    }
    @Column(name="introduce")
    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "requirement")
    public List<RequirementDiscuss> getRequirementDiscussList() {
        return requirementDiscussList;
    }

    public void setRequirementDiscussList(List<RequirementDiscuss> requirementDiscussList) {
        this.requirementDiscussList = requirementDiscussList;
    }
    @Column(name="major")
    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }
    @Column(name="course_type")
    public String getCourseType() {
        return courseType;
    }

    public void setCourseType(String courseType) {
        this.courseType = courseType;
    }
    @Column(name="develop_type")
    public String getDevelopType() {
        return developType;
    }

    public void setDevelopType(String developType) {
        this.developType = developType;
    }
}
