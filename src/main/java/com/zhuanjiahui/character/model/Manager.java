package com.zhuanjiahui.character.model;

import com.frame.organization.model.BigUser;
import com.frame.organization.model.User2;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by Administrator on 2015/6/29.
 */
@Entity
@Table(name="organization_manager")
public class Manager extends BigUser {
    private String introduce;
    @Column(name="introduce")
    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }
}
