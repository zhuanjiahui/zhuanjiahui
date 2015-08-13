package com.zhuanjiahui.basic.service;

import com.zhuanjiahui.basic.model.CourseType;
import com.zhuanjiahui.basic.model.MajorType;

import java.util.List;

/**
 * Created by Administrator on 2015/6/26.
 */
public interface MajorManager {

    public List<MajorType> getMajorTypes();

    public List<CourseType> getCoursesByMajorName(String name);

    public List<CourseType> getAllCourses();

}
