package com.zhuanjiahui.main.model;

import com.frame.organization.model.User;
import com.zhuanjiahui.character.model.Expert;

import org.hibernate.annotations.GenericGenerator;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

/**
 * Created by Administrator on 2015/6/26.
 */
@Entity
@Table(name="main_expert_serve")
public class ExpertServe {
    private String id;
    private String name;
    private String serveType;//培训 咨询 研发
    private String courseType;//课程
    private String industry;//行业
    private String major;//专业
    private String developType;//开发类型
    private Integer grade;//等级
    private User expert;
    private Expert expert2;
    private BigDecimal price;
    private Integer workTime;//年限
    private Integer discount;//半天折扣5-10
    private Integer cheap;//优惠0-2.5
    private Integer theStatus;
    private Integer listPageIndex;//列表也推荐
/*
    private List<ServedConsumer> consumerList;//服务过的客户
*/
    private String servedConsumer;//服务过的客户
    private ExpertServeContent expertServeContent;


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
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="expert_id")
    public User getExpert() {
        return expert;
    }

    public void setExpert(User expert) {
        this.expert = expert;
    }

    @Column(name="serve_type")
    public String getServeType() {
        return serveType;
    }

    public void setServeType(String serveType) {
        this.serveType = serveType;
    }
    @Column(name="price")
    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    @Column(name="work_time")
    public Integer getWorkTime() {
        return workTime;
    }

    public void setWorkTime(Integer workTime) {
        this.workTime = workTime;
    }
   /* @OneToMany(fetch = FetchType.LAZY,mappedBy = "serve")
    public List<ServedConsumer> getConsumerList() {
        return consumerList;
    }

    public void setConsumerList(List<ServedConsumer> consumerList) {
        this.consumerList = consumerList;
    }*/
    @Column(name="served_consumer")
    public String getServedConsumer() {
        return servedConsumer;
    }

    public void setServedConsumer(String servedConsumer) {
        this.servedConsumer = servedConsumer;
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
    @Column(name="thestatus")
    public Integer getTheStatus() {
        return theStatus;
    }

    public void setTheStatus(Integer theStatus) {
        this.theStatus = theStatus;
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
    @Column(name="list_page_index")
    public Integer getListPageIndex() {
        return listPageIndex;
    }

    public void setListPageIndex(Integer listPageIndex) {
        this.listPageIndex = listPageIndex;
    }
    @Column(name="grade")
    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }
    @Column(name="discount")
    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }
    @Column(name="cheap")
    public Integer getCheap() {
        return cheap;
    }

    public void setCheap(Integer cheap) {
        this.cheap = cheap;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="expert_id",insertable = false,updatable = false)
    public Expert getExpert2() {
        return expert2;
    }

    public void setExpert2(Expert expert2) {
        this.expert2 = expert2;
    }
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="expert_serve_content_id")
    public ExpertServeContent getExpertServeContent() {
        return expertServeContent;
    }

    public void setExpertServeContent(ExpertServeContent expertServeContent) {
        this.expertServeContent = expertServeContent;
    }

}
