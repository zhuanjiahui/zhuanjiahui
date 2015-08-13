package com.zhuanjiahui.basic.model;

import java.util.List;

/**
 * Created by Administrator on 2015/7/2.
 */
public class MajorType {
    private String id;
    private String name;
    private String label;
    private String type;//专家、活动、需求
    private List<CourseType> courseTypes;

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<CourseType> getCourseTypes() {
        return courseTypes;
    }

    public void setCourseTypes(List<CourseType> courseTypes) {
        this.courseTypes = courseTypes;
    }
}
