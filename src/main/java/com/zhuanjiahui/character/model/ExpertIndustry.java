package com.zhuanjiahui.character.model;


import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by Administrator on 2015/7/8.
 */
@Entity
@Table(name="character_expert_industry")
public class ExpertIndustry {
    private String id;
    private Expert expert;
    private String industry;

    @Id
    @GenericGenerator(name="id",strategy = "com.frame.core.p.model.ZJHidGenerator")
    @GeneratedValue(generator = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="expert_id")
    public Expert getExpert() {
        return expert;
    }

    public void setExpert(Expert expert) {
        this.expert = expert;
    }
    @Column(name="industry")
    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }


}
