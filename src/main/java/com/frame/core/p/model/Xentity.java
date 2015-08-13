package com.frame.core.p.model;

import java.util.LinkedHashMap;

/**
 * Created with IntelliJ IDEA.
 * User: ming
 * Date: 12-11-28
 * Time: 上午9:51
 * To change this template use File | Settings | File Templates.
 */
public class Xentity {

    private String name;
    private String label;
    private LinkedHashMap<String, StatusType> statusMap;

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

    public LinkedHashMap<String, StatusType> getStatusMap() {
        return statusMap;
    }

    public void setStatusMap(LinkedHashMap<String, StatusType> statusMap) {
        this.statusMap = statusMap;
    }
}


