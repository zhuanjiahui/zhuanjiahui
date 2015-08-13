package com.zhuanjiahui.basic.model;

import com.zhuanjiahui.character.model.Expert;
import org.hibernate.annotations.GenericGenerator;


import javax.persistence.*;

/**
 * Created by Administrator on 2015/7/9.
 */
@Entity
@Table(name="basic_keywords")
public class Keywords {
    private String id;
    private Expert expert;
    private String words;

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
    @Column(name="words")
    public String getWords() {
        return words;
    }

    public void setWords(String words) {
        this.words = words;
    }

}
