package com.zhuanjiahui.character.model;

import com.frame.organization.model.BigUser;
import com.frame.organization.model.Province;
import com.zhuanjiahui.main.model.FavoriteExpert;
import com.zhuanjiahui.order.model.PurchaseOrder;

import javax.persistence.*;
import java.util.List;

/**
 * Created by Administrator on 2015/6/24.
 * 助理
 */
@Entity
@Table(name="organization_assistant")
public class Assistant extends BigUser {
    private List<FavoriteExpert> favoriteExperts;
    private List<Expert> expertList;//我的专家
    private List<PurchaseOrder> purchaseOrders;

    @OneToMany(fetch = FetchType.LAZY,mappedBy = "assistant")
    public List<Expert> getExpertList() {
        return expertList;
    }

    public void setExpertList(List<Expert> myExperts) {
        this.expertList = expertList;
    }

    @OneToMany(fetch = FetchType.LAZY,mappedBy = "assistant")
    public List<PurchaseOrder> getPurchaseOrders() {
        return purchaseOrders;
    }

    public void setPurchaseOrders(List<PurchaseOrder> purchaseOrders) {
        this.purchaseOrders = purchaseOrders;
    }
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "user")
    public List<FavoriteExpert> getFavoriteExperts() {
        return favoriteExperts;
    }

    public void setFavoriteExperts(List<FavoriteExpert> favoriteExperts) {
        this.favoriteExperts = favoriteExperts;
    }
}
