package com.zhuanjiahui.character.controller;

import com.frame.core.base.service.BaseManager;
import com.frame.core.util.AuthorizationUtil;
import com.frame.core.util.OSSClientService;
import com.frame.core.util.StringUtil;
import com.frame.organization.model.MyUser;
import com.frame.organization.model.Province;
import com.frame.organization.service.CityManager;
import com.zhuanjiahui.character.model.Expert;
import com.zhuanjiahui.character.model.ExpertIndustry;
import com.zhuanjiahui.character.service.ExpertManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/7/17.
 */
@Controller
@RequestMapping(value = "/pc/user")
public class PersonalController {
    @Autowired
    private ExpertManager expertManager;
    @Autowired
    private BaseManager baseManager;
    @Autowired
    private OSSClientService ossClientService;
    @Autowired
    private CityManager cityManager;
    /*查看个人信息*/
    @RequestMapping(value = "/view")
    public String viewPersonal(Model model){
        int utype = AuthorizationUtil.getMyUser().getUtype();
        if(utype==1){
            return "redirect:/pc/user/viewPersonal";
        }else if(utype==2){
            return "redirect:/pc/expert/viewPersonal";
        }else {
            return "redirect:/pc/assistant/viewPersonal";
        }

    }
    /*查看个人信息*/
    @RequestMapping(value = "/viewPersonal")
    public String viewUserPersonal(Model model){
        MyUser user = AuthorizationUtil.getMyUser();
        Expert expert=expertManager.viewExpert(user.getId());
        model.addAttribute("myUser",user);
        model.addAttribute("expert",expert);
        return "/character/personalView";
    }
    /*
   * 保存个人资料*/
    @RequestMapping(value = "/savePersonal")
    public String savePersonalData(HttpServletRequest request, Expert expert, Model model) throws ParseException {
        String id = AuthorizationUtil.getMyUser().getId();
        String provinceId=request.getParameter("provinceId");
        Province province=cityManager.getProvince(provinceId);
        Expert expertTemp = expertManager.viewExpert(id);
        expertTemp.setProvince(province);
        expertTemp.setName(expert.getName());
        expertTemp.setGender(expert.getGender());
        SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyy-MM");
        Date birthday=simpleDateFormat.parse(request.getParameter("birthdayDate"));
        expertTemp.setBirthday(birthday);
        expertTemp.setPictureUrl(expert.getPictureUrl());
        expertTemp.setEmail(expert.getEmail());
        expertTemp.setPhone(expert.getPhone());
        expertTemp.setMemo(expert.getMemo());
        expertTemp.setCompanyName(expert.getCompanyName());
        expertTemp.setCompanyMemo(expert.getCompanyMemo());
        expertTemp.setIndustry(expert.getIndustry());
        expertTemp.setCompanyAddress(expert.getCompanyAddress());
        expertTemp.setIndustry(expert.getIndustry());
        expertTemp.setCheckStatus(2);//个人资料待审核
        baseManager.saveOrUpdate(Expert.class.getName(), expertTemp);
        model.addAttribute("myUser",AuthorizationUtil.getMyUser());
        model.addAttribute("expert", expertTemp);
        return "/character/personalView";
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
        return "/character/personalForm";
    }

    /*上传头像*/
    @RequestMapping(value = "/uploadPic")
    @ResponseBody
    public String uploadHeadPic(MultipartRequest multipartRequest,HttpServletRequest request) throws IOException {
        String expertId = AuthorizationUtil.getMyUser().getId();
        MultipartFile multipartFile = multipartRequest.getFiles("Filedata").get(0);
        String uploadUrl = "head/" +expertId+"/"+ multipartFile.getOriginalFilename();
        InputStream content = multipartFile.getInputStream();
        long size = multipartFile.getSize();
        ossClientService.putObject("zhuanjiahui", uploadUrl, content, size);
        return uploadUrl;

    }
   /* *//*上传头像*//*
    @RequestMapping(value = "/uploadCutPic")
    @ResponseBody
    public String uploadCutPic(HttpServletRequest request) throws IOException {
        String expertId = AuthorizationUtil.getMyUser().getId();
        int pointX=Integer.parseInt(request.getParameter("pointX"));
        int pointY=Integer.parseInt(request.getParameter("pointY"));
        int width=Integer.parseInt(request.getParameter("width"));
        int height=Integer.parseInt(request.getParameter("height"));
        String url=request.getParameter("uri");
        File file=new File(url);
        String fileNme=file.getName();
        String extForm=fileNme.substring(fileNme.lastIndexOf(".")+1);
        return OSSClientService.cropImage(url,"cutimg/"+url,pointX,pointY,width,height,extForm,"png");

    }*/
    @RequestMapping(value = "/myBalance")
    public String myBalance(Model model){
        model.addAttribute("myUser",AuthorizationUtil.getMyUser());
        return "/main/balance";
    }


}
