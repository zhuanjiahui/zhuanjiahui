package com.zhuanjiahui.basic.model;

import com.frame.organization.model.User;
import com.zhuanjiahui.character.model.Expert;
import org.hibernate.annotations.GenericGenerator;


import javax.persistence.*;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.util.Date;

/**
 * Created by Administrator on 2015/8/8.
 * 活动讨论
 */
@Entity
@Table(name="basic_activity_discuss")
public class ActivityDiscuss {
    private String id;
    private String content;
    private Date createDatetime;
    private User consumer;
    private Expert consumer2;
    private String activityId;
    private Activity activity;
    @Id
    @GenericGenerator(name = "id",strategy = "com.frame.core.p.model.ZJHidGenerator")
    @GeneratedValue(generator = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    @Column(name="content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    @Column(name="create_datetime")
    public Date getCreateDatetime() {
        return createDatetime;
    }

    public void setCreateDatetime(Date createDatetime) {
        this.createDatetime = createDatetime;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="consumer_id")
    public User getConsumer() {
        return consumer;
    }

    public void setConsumer(User consumer) {
        this.consumer = consumer;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="consumer_id",insertable = false,updatable = false)
    public Expert getConsumer2() {
        return consumer2;
    }

    public void setConsumer2(Expert consumer2) {
        this.consumer2 = consumer2;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="activity_id",insertable = false,updatable = false)
    public Activity getActivity() {
        return activity;
    }

    public void setActivity(Activity activity) {
        this.activity = activity;
    }
    @Column(name="activity_id")
    public String getActivityId() {
        return activityId;
    }

    public void setActivityId(String activityId) {
        this.activityId = activityId;
    }
}
