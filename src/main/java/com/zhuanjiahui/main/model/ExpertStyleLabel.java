package com.zhuanjiahui.main.model;

import com.zhuanjiahui.character.model.Expert;
import org.hibernate.annotations.GenericGenerator;


import javax.persistence.*;

/**
 * Created by Administrator on 2015/7/10.
 */
@Entity
@Table(name="main_expert_style_label")
public class ExpertStyleLabel {
    private String id;
    private String styleLabel;
    private Expert expert;
    @Id
    @GenericGenerator(name="id",strategy = "com.frame.core.p.model.ZJHidGenerator")
    @GeneratedValue(generator = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    @Column(name="style_label")
    public String getStyleLabel() {
        return styleLabel;
    }

    public void setStyleLabel(String styleLabel) {
        this.styleLabel = styleLabel;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="expert_id")
    public Expert getExpert() {
        return expert;
    }

    public void setExpert(Expert expert) {
        this.expert = expert;
    }
}
