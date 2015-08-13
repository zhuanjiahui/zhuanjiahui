package com.zhuanjiahui.main.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by Administrator on 2015/6/26.
 */
@Entity
@Table(name="main_served_consumer")
public class ServedConsumer {
    private String id;
    private String name;//客户名称
    private String projectName;
    private String introduce;
    private ExpertServe serve;
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
    @Column(name="project_name")
    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    @Column(name="introduce")
    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="serve_id")
    public ExpertServe getServe() {
        return serve;
    }

    public void setServe(ExpertServe serve) {
        this.serve = serve;
    }
}
