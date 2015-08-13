package com.zhuanjiahui.basic.model;

/**
 * Created by Administrator on 2015/7/2.
 */
public class CourseType {
    private String id;
    private String name;
    private String label;
    private MajorType majorType;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

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

    public MajorType getMajorType() {
        return majorType;
    }

    public void setMajorType(MajorType majorType) {
        this.majorType = majorType;
    }
}
