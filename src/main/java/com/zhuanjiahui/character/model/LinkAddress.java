package com.zhuanjiahui.character.model;

import com.frame.organization.model.Province;
import com.frame.organization.model.User;
import org.hibernate.annotations.GenericGenerator;


import javax.persistence.*;

/**
 * Created by Administrator on 2015/7/28.
 */
@Entity
@Table(name="character_link_address")
public class LinkAddress {
    private String id;
    private Province province;
    private String address;
    private Boolean isDefault;
    private User expert;
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
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="province_id")
    public Province getProvince() {
        return province;
    }

    public void setProvince(Province province) {
        this.province = province;
    }
    @Column(name="address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    @Column(name="is_default")
    public Boolean getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(Boolean isDefault) {
        this.isDefault = isDefault;
    }
    @Column(name="thestatus")
    public Integer getTheStatus() {
        return theStatus;
    }

    public void setTheStatus(Integer theStatus) {
        this.theStatus = theStatus;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "expert_id")
    public User getExpert() {
        return expert;
    }

    public void setExpert(User expert) {
        this.expert = expert;
    }
}
