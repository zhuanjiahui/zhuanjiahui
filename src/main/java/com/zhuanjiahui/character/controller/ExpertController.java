package com.zhuanjiahui.character.controller;

import com.frame.core.base.service.BaseManager;
import com.frame.core.util.AuthorizationUtil;
import com.frame.core.util.DateUtil;
import com.frame.core.util.OSSClientService;
import com.frame.organization.model.Province;
import com.frame.organization.service.CityManager;
import com.zhuanjiahui.basic.model.Keywords;
import com.zhuanjiahui.character.model.Company;
import com.zhuanjiahui.character.model.Expert;

import com.zhuanjiahui.character.model.ExpertIndustry;
import com.zhuanjiahui.character.model.Linkman;
import com.zhuanjiahui.character.service.CompanyManager;
import com.zhuanjiahui.character.service.ExpertManager;
import com.zhuanjiahui.main.model.ExpertServe;
import com.zhuanjiahui.main.model.Stylelabel;
import com.zhuanjiahui.main.service.ExpertServeManager;
import com.zhuanjiahui.main.service.ScheduleManager;
import com.zhuanjiahui.order.model.PurchaseOrderComment;
import com.zhuanjiahui.order.service.CommentManager;
import com.zhuanjiahui.order.service.OrderManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Administrator on 2015/6/30.
 */
@Controller
@RequestMapping(value = "/pc/expert")
public class ExpertController  {
    @Autowired
    private ExpertManager expertManager;
    @Autowired
    private CommentManager commentManager;
    @Autowired
    private OSSClientService ossClientService;
    @Autowired
    private CityManager cityManager;
    @Autowired
    private BaseManager baseManager;
    @Autowired
    private ExpertServeManager expertServeManager;
    @Autowired
    private ScheduleManager scheduleManager;
    @Autowired
    private CompanyManager companyManager;
    @Autowired
    private OrderManager orderManager;

    /*
    * 专家详情页*/
    @RequestMapping(value = "/viewExpert")
    public String viewExpert(HttpServletRequest request, ModelMap modelMap) {
        String expertId = request.getParameter("expertId");
        Expert expert = expertManager.viewExpert(expertId);
        expert.setVisitCount(expert.getVisitCount()+1);
        baseManager.saveOrUpdate(Expert.class.getName(),expert);
        List<PurchaseOrderComment> comments = commentManager.getMyComments(expertId, 2);
        List<ExpertServe> expertServeList=expertServeManager.myExpertServes(expertId);
        List<Map> schedules= null;
        try {
            schedules = scheduleManager.getScheduleList(expertId,new Date());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        modelMap=scheduleManager.getCalendar(modelMap,new Date());
        modelMap.put("companyList",companyManager.listCompany(expertId));
        modelMap.put("scheduleList",schedules);
        modelMap.put("expert", expert);
        modelMap.put("expertServes",expertServeList);
        modelMap.put("comments", comments);
        return "/character/expertView";
    }
    /*
       * 专家详情页*/
    @RequestMapping(value = "/viewNextExpert")
    public String viewNextExpert(HttpServletRequest request, ModelMap modelMap) {
        String expertId = request.getParameter("expertId");
        Expert expert = expertManager.viewExpert(expertId);
        String year=request.getParameter("year");
        String month=request.getParameter("month");
        Calendar calendar=Calendar.getInstance();
        if(month!=null&&!month.equals("")){
            calendar.set(Calendar.DAY_OF_MONTH, 1);
            calendar.set(Calendar.MONTH, Integer.parseInt(month) - 1);//一月份表示0 etc.
            calendar.set(Calendar.YEAR, Integer.parseInt(year));
        }

        List<PurchaseOrderComment> comments = commentManager.getMyComments(expertId, 2);
        List<ExpertServe> expertServeList=expertServeManager.myExpertServes(expertId);
        List<Map> schedules= null;
        try {
            schedules = scheduleManager.getScheduleList(expertId,calendar.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        modelMap=scheduleManager.getCalendar(modelMap,calendar.getTime());
        modelMap.put("scheduleList",schedules);
        modelMap.put("expert", expert);
        modelMap.put("expertServes",expertServeList);
        modelMap.put("comments", comments);
        return "/character/expertView";
    }


    /*查看个人信息*/
    @RequestMapping(value = "/viewPersonal")
    public String viewPersonal(Model model){
        String id = AuthorizationUtil.getMyUser().getId();
        Expert expert = expertManager.viewExpert(id);
        model.addAttribute("myUser",AuthorizationUtil.getMyUser());
        model.addAttribute("expert",expert);
        return "/character/expertDataView";
    }
    /*
     * 保存个人资料*/
    @RequestMapping(value = "/savePerson")
    public String saveExpertData(HttpServletRequest request, Expert expert, Model model) throws ParseException {
        String id = AuthorizationUtil.getMyUser().getId();
        String provinceId=request.getParameter("provinceId");
        Province province=cityManager.getProvince(provinceId);
        Expert expertTemp = expertManager.viewExpert(id);
        expertTemp.setWorkTime(expert.getWorkTime());
        expertTemp.setName(expert.getName());
        expertTemp.setGender(expert.getGender());
        expertTemp.setChief(expert.getChief());
        SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyy-MM-dd");
        Date birthday=simpleDateFormat.parse(request.getParameter("birthdayDate"));
        expertTemp.setBirthday(birthday);
        expertTemp.setIsChief(expert.getIsChief());
        expertTemp.setCompanyName(expert.getCompanyName());
        expertTemp.setPreposition(expert.getPreposition());
        expertTemp.setCompanyAddress(expert.getCompanyAddress());

        expertTemp.setPictureUrl(expert.getPictureUrl());
        expertTemp.setEmail(expert.getEmail());
        expertTemp.setPhone(expert.getPhone());
        expertTemp.setMemo(expert.getMemo());
        expertTemp.setIntroduce(expert.getIntroduce());
        expertTemp.setCheckStatus(2);//个人资料待审核

        expertTemp.setProvince(province);
        expertTemp.setMinPrice(expert.getMinPrice());
        expertTemp.setMaxPrice(expert.getMaxPrice());
        baseManager.saveOrUpdate(Expert.class.getName(), expertTemp);

        /*设为默认联系人*/
        Linkman linkman=orderManager.getDefaultLinkman(id);
        if(linkman==null){
            linkman=new Linkman();
            linkman.setExpert(AuthorizationUtil.getUser());
            linkman.setTheStatus(1);
            linkman.setIsDefault(true);
            linkman.setName(expertTemp.getName());
            linkman.setPhone(expertTemp.getPhone());
            baseManager.saveOrUpdate(Linkman.class.getName(),linkman);
        }

        String[] industries=request.getParameterValues("industrys");
        if(industries!=null&&industries.length>0){
            for (ExpertIndustry expertIndustry:expertTemp.getExpertIndustryList()){
                baseManager.delete(ExpertIndustry.class.getName(),expertIndustry.getId());
            }
            List<Object> expertIndustryList=new ArrayList<>();
            for(String industry:industries){
                ExpertIndustry expertIndustry=new ExpertIndustry();
                expertIndustry.setIndustry(industry);
                expertIndustry.setExpert(expertTemp);
                expertIndustryList.add(expertIndustry);
            }
            baseManager.batchSaveOrUpdate("save",ExpertIndustry.class.getName(),expertIndustryList);
        }
        String keywords=request.getParameter("keywords");
        if(keywords!=null&&!keywords.equals("")){
            List<Object> keywordList=new ArrayList<>();
            for(String word:keywords.split("\\s")){
                Keywords key=new Keywords();
                key.setExpert(expertTemp);
                key.setWords(word);
                keywordList.add(key);
            }
            baseManager.batchSaveOrUpdate("save", Keywords.class.getName(), keywordList);
        }
        String styleLabels=request.getParameter("styleLabels");
        if(styleLabels!=null&&!styleLabels.equals("")){

            List<Object> styleLableList=new ArrayList<>();
            String[] labels= styleLabels.split("\\s");
            for(String label:labels){
                Stylelabel style=new Stylelabel();
                style.setExpert(expertTemp);
                style.setLabel(label);
                styleLableList.add(style);
            }
            baseManager.batchSaveOrUpdate("save",Stylelabel.class.getName(),styleLableList);
        }
        model.addAttribute("expert", expertTemp);
        return "redirect:/pc/expert/viewPersonal";
    }

    /*
   * 编辑个人资料*/
    @RequestMapping(value = "/editPersonal")
    public String editPersonalData(ModelMap modelMap) {
        String id = AuthorizationUtil.getMyUser().getId();
        Expert expert = expertManager.viewExpert(id);
        modelMap.put("myUser",AuthorizationUtil.getMyUser());
        modelMap.put("expert",expert);
        modelMap.put("provinces",cityManager.getProvinces());
        return "/character/expertForm";
    }
    /*删除关键字*/
    @RequestMapping(value = "/deleteKey")
    @ResponseBody
    public Boolean deleteKeyword(HttpServletRequest request){
        String keyId=request.getParameter("keywordId");
        try {
            baseManager.delete(Keywords.class.getName(),keyId);
            return true;
        }catch (Exception e){
            return false;
        }
    }
    /*删除关键字*/
    @RequestMapping(value = "/deleteStyle")
    @ResponseBody
    public Boolean deleteStylelabel(HttpServletRequest request){
        String labelId=request.getParameter("labelId");
        try {
            baseManager.delete(Stylelabel.class.getName(),labelId);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
