package com.zhuanjiahui.basic.model;

import com.frame.organization.model.User;
import com.zhuanjiahui.character.model.Expert;
import org.hibernate.annotations.GenericGenerator;


import javax.persistence.*;
import java.util.List;

/**
 * Created by Administrator on 2015/8/13.
 * 活动报名者
 */
@Entity
@Table(name="basic_activity_expert")
public class ActivityExpert {
    private String id;
    private User expert;
    private Activity activity;
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
    public User getExpert() {
        return expert;
    }

    public void setExpert(User expert) {
        this.expert = expert;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="activity_id")
    public Activity getActivity() {
        return activity;
    }

    public void setActivity(Activity activity) {
        this.activity = activity;
    }


}
