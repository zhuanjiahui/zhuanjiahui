package com.zhuanjiahui.basic.model;

/**
 * Created by Administrator on 2015/6/26.
 */
public class Address {
    private String id;
    private String province;//省份
    private String city;//城市
    private String addr;//详细地址
    private String allAddr;//全址
    private String linkman;
    private String telephone;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getAllAddr() {
        return province+city+addr;
    }

    public void setAllAddr(String allAddr) {
        this.allAddr = allAddr;
    }

    public String getLinkman() {
        return linkman;
    }

    public void setLinkman(String linkman) {
        this.linkman = linkman;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
}
