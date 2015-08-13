package com.frame.core.p.model;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-4-19
 * Time: 下午5:55
 * To change this template use File | Settings | File Templates.
 */
public class Module {


    private String name;
    private String label;
    private List<Xentity> xentityList;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }


    public List<Xentity> getXentityList() {
        return xentityList;
    }

    public void setXentityList(List<Xentity> xentityList) {
        this.xentityList = xentityList;
    }

}
