package com.zhuanjiahui.basic.service.impl;

import com.zhuanjiahui.basic.model.CourseType;
import com.zhuanjiahui.basic.model.MajorType;
import com.zhuanjiahui.basic.service.MajorManager;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/6/26.
 */
public class MajorManagerImpl implements MajorManager {
    private static final String MAJOR_XML = "/setting/major.xml";
    private static Map<String,List<CourseType>> majorCourseMap=new LinkedHashMap<>();//<专业，课程列表>
    private static List<CourseType> courseTypes=new ArrayList<>();//<课程列表>
    private static List<MajorType> majorTypes=new ArrayList<>();//专业列表
    @Override
    public List<MajorType> getMajorTypes() {
        return majorTypes;
    }

    @Override
    public List<CourseType> getCoursesByMajorName(String name) {
        return majorCourseMap.get(name);
    }

    @Override
    public List<CourseType> getAllCourses() {
        return courseTypes;
    }

    public static void readXmlFiles() {

        Resource majorResource = new ClassPathResource(MAJOR_XML);
        Document infoDocument = null;
        try {
            infoDocument = new SAXReader().read(majorResource.getInputStream());
        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (infoDocument != null) {
            List<Node> majorTypeNodeList = infoDocument.selectNodes("majors/majorType");
            for (Node majorTypeNode : majorTypeNodeList) {
                MajorType majorType=new MajorType();
                String id = majorTypeNode.selectSingleNode("@id").getText();
                String name = majorTypeNode.selectSingleNode("@name").getText();
                String label = majorTypeNode.selectSingleNode("@label").getText();

                List<Node> courseNodeList = majorTypeNode.selectNodes("courseType");
                List<CourseType> courseTypeList = new ArrayList<>();
                for (Node courseNode : courseNodeList) {
                    CourseType courseType = new CourseType();
                    String courseId = courseNode.selectSingleNode("@id").getText();
                    String courseName = courseNode.selectSingleNode("@name").getText();
                    String courseLabel = courseNode.selectSingleNode("@label").getText();
                    courseType.setId(courseId);
                    courseType.setName(courseName);
                    courseType.setLabel(courseLabel);
                    courseTypeList.add(courseType);
                    courseTypes.add(courseType);

                }
                majorCourseMap.put(name, courseTypeList);
                majorType.setId(id);
                majorType.setName(name);
                majorType.setLabel(label);
                majorType.setCourseTypes(courseTypeList);
                majorTypes.add(majorType);

            }
        }
    }
}
