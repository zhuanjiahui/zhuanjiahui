package com.zhuanjiahui.character.controller;

import com.frame.core.base.service.BaseManager;
import com.frame.core.util.AuthorizationUtil;
import com.zhuanjiahui.character.model.Company;
import com.zhuanjiahui.character.model.Expert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2015/7/30.
 */
@Controller
@RequestMapping(value="/pc/company")
public class CompanyController {
   @Autowired
   private BaseManager baseManager;
    /*专家完善工作经历*/
    @RequestMapping(value = "/add")
    @ResponseBody
    public Company addCompany(Company company,HttpServletRequest request) throws ParseException {
        String expertId=request.getParameter("expertId");
        Expert expert= (Expert)baseManager.getObject(Expert.class.getName(),expertId);
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        String startDatetime=request.getParameter("startDatetime");
        String endDatetime=request.getParameter("endDatetime");

        Date startDate=simpleDateFormat.parse(startDatetime);
        Date endDate=simpleDateFormat.parse(endDatetime);
        company.setStartDate(startDate);
        company.setEndDate(endDate);
        company.setExpert(expert);
        baseManager.saveOrUpdate(Company.class.getName(),company);
        return company;



    }
}
