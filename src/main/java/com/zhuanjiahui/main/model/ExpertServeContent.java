package com.zhuanjiahui.main.model;



import com.frame.organization.model.User;
import com.zhuanjiahui.character.model.Expert;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by Administrator on 2015/8/7.
 */
@Entity
@Table(name="main_expert_serve_content")
public class ExpertServeContent {
    private String id;
    private ExpertServe expertServe;
    private User expert;
    private Expert expert2;
    private String content;
    @Id
    @GenericGenerator(name="id",strategy = "com.frame.core.p.model.ZJHidGenerator")
    @GeneratedValue(generator = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    @OneToOne(fetch = FetchType.LAZY,mappedBy = "expertServeContent")
    public ExpertServe getExpertServe() {
        return expertServe;
    }

    public void setExpertServe(ExpertServe expertServe) {
        this.expertServe = expertServe;
    }
    @Column(name="content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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
    @JoinColumn(name="expert_id",insertable = false,updatable = false)
    public Expert getExpert2() {
        return expert2;
    }

    public void setExpert2(Expert expert2) {
        this.expert2 = expert2;
    }

}
