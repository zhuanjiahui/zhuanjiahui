package com.zhuanjiahui.character.controller;

import com.frame.core.base.service.BaseManager;
import com.frame.core.taglib.PageEntity;
import com.frame.core.util.AuthorizationUtil;
import com.frame.core.util.DateUtil;
import com.frame.core.util.PageInfo;
import com.frame.core.util.StringUtil;
import com.frame.organization.model.Province;
import com.frame.organization.model.User;
import com.frame.organization.service.CityManager;
import com.zhuanjiahui.basic.controller.BaseController;
import com.zhuanjiahui.basic.model.Keywords;
import com.zhuanjiahui.basic.model.Requirement;
import com.zhuanjiahui.basic.service.SigninManager;
import com.zhuanjiahui.character.model.Assistant;
import com.zhuanjiahui.character.model.Expert;
import com.zhuanjiahui.character.model.ExpertIndustry;
import com.zhuanjiahui.character.model.Linkman;
import com.zhuanjiahui.character.service.AssistantManager;
import com.zhuanjiahui.character.service.ExpertManager;
import com.zhuanjiahui.main.model.Stylelabel;
import com.zhuanjiahui.main.service.ExpertServeManager;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by Administrator on 2015/7/22.
 */
@Controller
@RequestMapping(value = "/pc/assistant")
public class AssistantController extends BaseController{
    @Autowired
    private BaseManager baseManager;
    @Autowired
    private AssistantManager assistantManager;
    @Autowired
    private CityManager cityManager;
    @Autowired
    private ExpertManager expertManager;
    @Autowired
    private SigninManager signinManager;
    @Autowired
    private OrderManager orderManager;
    /*查看个人信息*/
    @RequestMapping(value = "/viewPersonal")
    public String viewPersonal(Model model){
        String id = AuthorizationUtil.getMyUser().getId();
        Assistant assistant =(Assistant) baseManager.getObject(Assistant.class.getName(),id);
        model.addAttribute("myUser",AuthorizationUtil.getMyUser());
        model.addAttribute("assistant",assistant);
        return "/character/assistantDataView";
    }
    /*
     * 保存个人资料*/
    @RequestMapping(value = "/savePerson")
    public String saveAssistantData(HttpServletRequest request, Assistant assistant, Model model) throws ParseException {
        String id = AuthorizationUtil.getMyUser().getId();
        String provinceId=request.getParameter("provinceId");
        Province province=cityManager.getProvince(provinceId);
        Assistant ast =(Assistant) baseManager.getObject(Assistant.class.getName(),id);
        ast.setName(assistant.getName());
        ast.setGender(assistant.getGender());
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM");
        String birthdayDate=request.getParameter("birthdayDate");
        ast.setBirthday(simpleDateFormat.parse(birthdayDate));
        ast.setPhone(assistant.getPhone());
        ast.setEmail(assistant.getEmail());
        ast.setProvince(province);
        ast.setMemo(assistant.getMemo());
        ast.setPictureUrl(assistant.getPictureUrl());
        baseManager.saveOrUpdate(Assistant.class.getName(),ast);
        return "redirect:/pc/assistant/viewPersonal";
    }

    /*
   * 编辑个人资料*/
    @RequestMapping(value = "/editPersonal")
    public String editPersonalData(ModelMap modelMap) {
        String id = AuthorizationUtil.getMyUser().getId();
        Assistant assistant =(Assistant) baseManager.getObject(Assistant.class.getName(),id);
        modelMap.put("myUser",AuthorizationUtil.getMyUser());
        modelMap.put("assistant",assistant);
        modelMap.put("provinces",cityManager.getProvinces());
        return "/character/assistantForm";
    }
    @RequestMapping(value = "/pageList")
    public String pageAssistants(HttpServletRequest request,ModelMap modelMap){
        PageEntity pageEntity=this.getPageEntity(request);
        LinkedHashMap<String,Object> queryParams=new LinkedHashMap<>();
        String orderBy=request.getParameter("orderBy");
        PageInfo pageInfo=assistantManager.pageAssistants(pageEntity, queryParams, orderBy);
        List<Object> listPageExperts=expertManager.getHomeExpert(4);
        modelMap.put("listPageExperts",listPageExperts);
        modelMap.put("pageEntity",pageEntity);
        modelMap.put("pageInfo",pageInfo);
        return "/character/assistantList";

    }
    /*助理详情页*/
    @RequestMapping(value="/view")
    public String viewAssistant(HttpServletRequest request,Model model){
        PageEntity pageEntity=this.getPageEntity(request);
        String assistantId=request.getParameter("assistantId");
        Assistant assistant=(Assistant)baseManager.getObject(Assistant.class.getName(),assistantId);
        model.addAttribute("assistantId",assistant);
        model.addAttribute("pageInfo",assistantManager.myExperts(pageEntity,assistantId));
        model.addAttribute("pageEntity",pageEntity);
        return "/character/assistantView";
    }
    /*我的专家*/
    @RequestMapping(value = "/myExperts")
    public String myExperts(HttpServletRequest request,ModelMap modelMap){
        PageEntity pageEntity=this.getPageEntity(request);
        String userId=AuthorizationUtil.getMyUser().getId();
        PageInfo pageInfo=assistantManager.myExperts(pageEntity,userId);
        modelMap.put("pageInfo",pageInfo);
        modelMap.put("pageEntity",pageEntity);
        return "/character/assistantExperts";
    }
    @RequestMapping(value = "/bindExpert")
    @ResponseBody
    public Expert bindExpert(HttpServletRequest request){
        String assistantId=AuthorizationUtil.getMyUser().getId();
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        Expert expert=expertManager.getExpertByNamePsw(username, StringUtil.encodePassword(password,"SHA"));
        Assistant assistant=(Assistant)baseManager.getObject(Assistant.class.getName(),assistantId);
        if (expert==null){
            User user=signinManager.checkUserName(username);
            if(user!=null){
                return null;//用户名和密码不正确
            }
            expert=new Expert();
            expert.setUsername(username);
            expert.setPassword(StringUtil.encodePassword(password,"SHA"));
            expert.setTheStatus(1);
            expert.setUtype(2);
            expert.setCheckStatus(1);
            expert.setRoleType(1);
            String idNO=new Date().getTime()+"";
            expert.setIdNo(idNO.substring(3, 12));
            expert.setPictureUrl("/images/default.png");
            expert.setCreateDatetime(new Date());
            expert.setAccountExpired(false);//账户过期？
            expert.setEnabled(true);//账户有效？
            expert.setCredentialsExpired(false);//证书过期?
            expert.setAccountLocked(false);//上锁？
        }
        expert.setAssistant(assistant);
        baseManager.saveOrUpdate(Expert.class.getName(),expert);
        return expert;
    }
    /*编辑专家*/
    @RequestMapping(value = "/editExpert")
    public String editExpert(HttpServletRequest request,ModelMap modelMap){
        String expertId = request.getParameter("expertId");
        Expert expert = expertManager.viewExpert(expertId);
        modelMap.put("myUser",AuthorizationUtil.getMyUser());
        modelMap.put("expert",expert);
        modelMap.put("provinces",cityManager.getProvinces());
        return "/character/expertForm2";
    }
    /*删除专家*/
    @RequestMapping(value = "/deleteExpert")
    @ResponseBody
    public Boolean deleteExpert(HttpServletRequest request){
        try{
            String expertId=request.getParameter("expertId");
            Expert expert=expertManager.viewExpert(expertId);
            expert.setAssistant(null);
            baseManager.saveOrUpdate(Expert.class.getName(),expert);
            return true;
        }catch (NullPointerException n){
            return false;
        }

    }
    /*
    * 保存专家资料*/
    @RequestMapping(value = "/saveExpert")
    public String saveExpertData(HttpServletRequest request, Expert expert, Model model) throws ParseException {
        String id = request.getParameter("expertId");
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
            for(String label:styleLabels.split("\\s")){
                Stylelabel style=new Stylelabel();
                style.setExpert(expertTemp);
                style.setLabel(label);
                styleLableList.add(style);
            }
            baseManager.batchSaveOrUpdate("save",Stylelabel.class.getName(),styleLableList);
        }
        model.addAttribute("expert", expertTemp);
        return "redirect:/pc/assistant/myExperts";
    }

}
