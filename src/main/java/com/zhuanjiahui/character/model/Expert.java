package com.zhuanjiahui.character.model;

import com.frame.organization.model.BigUser;


import com.zhuanjiahui.basic.model.Activity;
import com.zhuanjiahui.basic.model.Keywords;
import com.zhuanjiahui.main.model.*;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/7/2.
 */
@Entity
@Table(name="organization_expert")
public class Expert extends BigUser{
    private List<FavoriteExpert> favoriteExperts;//收藏的专家
    private List<Stroke> strokes;//我的行程
    private Boolean isChief;//是否还任最高职务
    private Boolean freedom;

    private Integer grade;
    //专家
    private String preposition;
    private String chief;//最高职位
    private List<ExpertServe> expertServes;
    private List<Schedule> schedules;//档期
    private Assistant assistant;//专家的助理
    private Integer favoriteCount;
    private Integer homePageIndex;//推荐值

    private List<Company> companyList;
    private BigDecimal minPrice;
    private BigDecimal maxPrice;
    private List<Keywords> keywordsList;
    private List<Stylelabel> styleLabelList;
    private List<ExpertIndustry> expertIndustryList;
    private String linkman;//第二联系人
    private String linkmanPhone;
    private List<Activity> activityList;

    @OneToMany(fetch = FetchType.LAZY,mappedBy = "consumer")
    public List<Stroke> getStrokes() {
        return strokes;
    }

    public void setStrokes(List<Stroke> strokes) {
        this.strokes = strokes;
    }



    @OneToMany(fetch = FetchType.LAZY,mappedBy = "expert")
    public List<ExpertServe> getExpertServes() {
        return expertServes;
    }

    public void setExpertServes(List<ExpertServe> expertServes) {
        this.expertServes = expertServes;
    }
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "expert")
    public List<Schedule> getSchedules() {
        return schedules;
    }

    public void setSchedules(List<Schedule> schedules) {
        this.schedules = schedules;
    }

    @Column(name="favorite_count")
    public Integer getFavoriteCount() {
        return favoriteCount;
    }

    public void setFavoriteCount(Integer favoriteCount) {
        this.favoriteCount = favoriteCount;
    }


    @Column(name="home_page_index")
    public Integer getHomePageIndex() {
        return homePageIndex;
    }

    public void setHomePageIndex(Integer homePageIndex) {
        this.homePageIndex = homePageIndex;
    }
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "expert")
    public List<Company> getCompanyList() {
        return companyList;
    }

    public void setCompanyList(List<Company> companyList) {
        this.companyList = companyList;
    }
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "user")
    public List<FavoriteExpert> getFavoriteExperts() {
        return favoriteExperts;
    }

    public void setFavoriteExperts(List<FavoriteExpert> favoriteExperts) {
        this.favoriteExperts = favoriteExperts;
    }

    @Column(name="min_price")
    public BigDecimal getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(BigDecimal minPrice) {
        this.minPrice = minPrice;
    }
    @Column(name="max_price")
    public BigDecimal getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(BigDecimal maxPrice) {
        this.maxPrice = maxPrice;
    }
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "expert")
    public List<Keywords> getKeywordsList() {
        return keywordsList;
    }

    public void setKeywordsList(List<Keywords> keywordsList) {
        this.keywordsList = keywordsList;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="assistant_id")
    public Assistant getAssistant() {
        return assistant;
    }

    public void setAssistant(Assistant assistant) {
        this.assistant = assistant;
    }
    @Column(name="chief")
    public String getChief() {
        if(isChief==null||isChief){
            return chief;
        }else {
            return "原"+chief;
        }
    }

    public void setChief(String chief) {
        this.chief = chief;
    }
    @Column(name="is_chief")
    public Boolean getIsChief() {
        return isChief;
    }

    public void setIsChief(Boolean isChief) {
        this.isChief = isChief;
    }

    @OneToMany(fetch = FetchType.LAZY,mappedBy = "expert")
    public List<ExpertIndustry> getExpertIndustryList() {
        return expertIndustryList;
    }

    public void setExpertIndustryList(List<ExpertIndustry> expertIndustryList) {
        this.expertIndustryList = expertIndustryList;
    }
    @Column(name="linkman")
    public String getLinkman() {
        return linkman;
    }

    public void setLinkman(String linkman) {
        this.linkman = linkman;
    }
    @Column(name="linkman_phone")
    public String getLinkmanPhone() {
        return linkmanPhone;
    }

    public void setLinkmanPhone(String linkmanPhone) {
        this.linkmanPhone = linkmanPhone;
    }

    @Column(name="preposition")
    public String getPreposition() {
        return preposition;
    }

    public void setPreposition(String preposition) {
        this.preposition = preposition;
    }
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "expert")
    public List<Stylelabel> getStyleLabelList() {
        return styleLabelList;
    }

    public void setStyleLabelList(List<Stylelabel> styleLabelList) {
        this.styleLabelList = styleLabelList;
    }
    @Column(name="grade")
    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }
    @Column(name="freedom")
    public Boolean getFreedom() {
        return freedom;
    }

    public void setFreedom(Boolean freedom) {
        this.freedom = freedom;
    }
    @ManyToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
    @JoinTable(name = "basic_expert_activity",
            joinColumns = {@JoinColumn(name = "activity_id", referencedColumnName = "id")},
            inverseJoinColumns = {@JoinColumn(name = "expert_id", referencedColumnName = "id")})
    public List<Activity> getActivityList() {
        return activityList;
    }

    public void setActivityList(List<Activity> activityList) {
        this.activityList = activityList;
    }
}
