package com.zhuanjiahui.order.model;

import com.zhuanjiahui.character.model.Assistant;

import com.zhuanjiahui.character.model.Expert;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Administrator on 2015/6/25.
 */
@Entity
@Table(name="order_purchase_order_comment")
public class PurchaseOrderComment {
    private String id;
    private Integer commentType;//专家评价，用户评价,助理评价
    private Expert expert;
    private Expert consumer;
    private Assistant assistant;
    private String content;
    private Integer grade;
    private Date createDatetime;
    private Integer theStatus;
    @Id
    @GenericGenerator(name="id",strategy = "com.frame.core.p.model.ZJHidGenerator")
    @GeneratedValue(generator = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    @Column(name="comment_type")
    public Integer getCommentType() {
        return commentType;
    }

    public void setCommentType(Integer commentType) {
        this.commentType = commentType;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="expert_id")
    public Expert getExpert() {
        return expert;
    }

    public void setExpert(Expert expert) {
        this.expert = expert;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="consumer_id")
    public Expert getConsumer() {
        return consumer;
    }

    public void setConsumer(Expert consumer) {
        this.consumer = consumer;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="assistant_id")
    public Assistant getAssistant() {
        return assistant;
    }

    public void setAssistant(Assistant assistant) {
        this.assistant = assistant;
    }
   @Column(name="content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    @Column(name="grade")
    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }
    @Column(name="thestatus")
    public Integer getTheStatus() {
        return theStatus;
    }

    public void setTheStatus(Integer theStatus) {
        this.theStatus = theStatus;
    }
    @Column(name="create_datetime")
    public Date getCreateDatetime() {
        return createDatetime;
    }

    public void setCreateDatetime(Date createDatetime) {
        this.createDatetime = createDatetime;
    }
}
