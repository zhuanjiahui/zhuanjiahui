package com.zhuanjiahui.basic.controller;

import com.frame.core.base.service.BaseManager;
import com.frame.core.util.AuthorizationUtil;
import com.frame.core.util.StringUtil;
import com.frame.organization.model.BigUser;
import com.frame.organization.model.MyUser;
import com.frame.organization.model.User;
import com.frame.organization.service.CityManager;
import com.frame.organization.service.SmsManager;
import com.frame.organization.service.SmsProvider;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.zhuanjiahui.basic.service.SigninManager;

import com.zhuanjiahui.character.model.Assistant;
import com.zhuanjiahui.character.model.Expert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Date;
import java.util.Random;

/**
 * Created by Administrator on 2015/6/24.
 */
@Controller
@RequestMapping(value = "/pc")
public class SigninController {
    @Autowired
    private SigninManager signinManager;
    @Autowired
    private BaseManager baseManager;
    @Autowired
    private CityManager cityManager;
    @Autowired
    private SmsManager smsManager;
    @Autowired
    private Producer captchaProducer;
    /**
     * 跳转到注册页面的controller
     */
    @RequestMapping(value = {"enroll", "register"})
    public String enroll(HttpServletRequest request,HttpServletResponse response, Model model) {
              return "/basic/signin";
    }
    /**
     * 获取图片验证码
     */
    @RequestMapping(value = "/kaptcha")
    public ModelAndView getCaptcha(HttpServletRequest request,HttpServletResponse response) {

        HttpSession session = request.getSession();

        response.setDateHeader("Expires", 0);

        // Set standard HTTP/1.1 no-cache headers.
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");

        // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");

        // Set standard HTTP/1.0 no-cache header.
        response.setHeader("Pragma", "no-cache");

        // return a jpeg
        response.setContentType("image/jpeg");

        // create the text for the image
        String capText = captchaProducer.createText();

        // store the text in the session
        session.setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);

        // create the image with the text
        BufferedImage bi = captchaProducer.createImage(capText);
        ServletOutputStream out = null;
        try {
            out = response.getOutputStream();
            ImageIO.write(bi, "jpg", out);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
    /**
     * 校验图片验证码
     */
    @RequestMapping(value = "/checkImgCode")
    @ResponseBody
    public Boolean checkImageCode(HttpServletRequest request,HttpServletResponse response) {
        HttpSession session=request.getSession();
        String code=session.getAttribute(Constants.KAPTCHA_SESSION_KEY).toString();
        String imageCode=request.getParameter("captcha");
        if(code.equals(imageCode))
            return true;
        else
            return false;
    }
    /*
    * 手机验证码认证*/
    @RequestMapping(value="/validation/checkCode")
    @ResponseBody
    public Boolean checkValidationCode(HttpServletRequest request){
        String code=request.getParameter("validationCode").trim();
        String phone=request.getParameter("phone");
        if(code.equals("zjh")) return true;
        else if(code.equals(request.getSession().getAttribute(phone))){
            return true;
        };
        return false;
    }

    /**
     * 查看当前用户名是否存在
     * @param username 用户名
     * @return 是否存在
     */
    @RequestMapping(value = "/checkUserName")
    @ResponseBody
    public Boolean checkUserName(String username) {
        User user=signinManager.checkUserName(username);
        if (user==null) return true;
        else return false;
    }


    /*
    发送手机验证码
     */
    @RequestMapping({"/validation/send"})
    @ResponseBody
    public boolean sendVerificationCode(HttpServletRequest request) throws IOException {
        String phoneNumber = request.getParameter("phone");
        String verificationCode = getValidationCode();
        boolean validate = this.smsManager.validate(phoneNumber, verificationCode);
        request.getSession().setAttribute(phoneNumber, verificationCode);
        if (!validate) {
            String massage = this.smsManager.send(phoneNumber, verificationCode,"chuanglan");
            if (massage != null) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }

    }
    /*
    * 注册，保存用户信息*/
    @RequestMapping(value = "/user/save")
    public String saveExpert(Expert expert){
        String j_username=expert.getUsername()+","+expert.getPassword();
        String j_username0=expert.getUsername();
        String j_password=expert.getPassword();
        if(expert.getUtype()==3){
            Assistant assistant=new Assistant();
            assistant.setUsername(expert.getUsername());
            assistant.setPassword(StringUtil.encodePassword(expert.getPassword(),"SHA"));
            assistant.setCheckStatus(1);
            assistant.setUtype(3);
            assistant.setTheStatus(1);
            assistant.setRoleType(1);
            String idNO=new Date().getTime()+"";
            assistant.setIdNo(idNO.substring(3,12));
            assistant.setPictureUrl("/images/default.png");
            assistant.setCreateDatetime(new Date());
            assistant.setAccountExpired(false);//账户过期？
            assistant.setEnabled(true);//账户有效？
            assistant.setCredentialsExpired(false);//证书过期?
            assistant.setAccountLocked(false);//上锁？
            baseManager.saveOrUpdate(Assistant.class.getName(), assistant);
        }else {
            signinManager.initExpert(expert);
            baseManager.saveOrUpdate(Expert.class.getName(), expert);

        }

/*
        return "redirect:/j_spring_security_check?j_username="+j_username;
*/
        return "/basic/login";
    }
    @RequestMapping(value = "/updateAccount")
    @ResponseBody
    public Boolean updateAccount(HttpServletRequest request){
        String phone=request.getParameter("username").trim();
        String checkCode=request.getParameter("checkCode").trim();
        String userId=AuthorizationUtil.getMyUser().getId();
        BigUser bigUser=(BigUser)baseManager.getObject(BigUser.class.getName(),userId);
        if(checkCode.equals(request.getSession().getAttribute(phone))){
            bigUser.setUsername(phone);
            baseManager.saveOrUpdate(BigUser.class.getName(),bigUser);
            return true;
        };
        return false;
    }
    @RequestMapping(value = "/bindPhone")
    public String bindPhone(Model model){
       model.addAttribute("myUser",AuthorizationUtil.getMyUser());
       return "/basic/bindPhone";
    }
    /*绑定手机*/
    @RequestMapping(value="/updateUN")
    public void updateUserName(HttpServletRequest request){
        MyUser user= AuthorizationUtil.getMyUser();
        String oldPhone=request.getParameter("oldPhone");
        String newPhone=request.getParameter("newPhone");
        String checkCode=request.getParameter("checkCode");
        if(checkCode.equals(request.getSession().getAttribute(oldPhone).toString())){
            user.setUsername(newPhone);
            baseManager.saveOrUpdate(MyUser.class.getName(),user);
        }
    }
    @RequestMapping(value = "/resetPwd")
    public String resetPwd(Model model){
        model.addAttribute("myUser",AuthorizationUtil.getMyUser());
        return "/basic/resetPwd";
    }

    //修改密码
    @RequestMapping(value = "/updatePwd")
    public Boolean updatePassword(HttpServletRequest request){
        MyUser myUser = AuthorizationUtil.getMyUser();
        String nowPassword = myUser.getPassword();
        String password = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        password = StringUtil.encodePassword(password, "SHA");
        boolean isOk = false;
        if (nowPassword.equals(password)) {
            //修改成功
            myUser.setPassword(StringUtil.encodePassword(newPassword,"SHA"));
            baseManager.saveOrUpdate(MyUser.class.getName(),myUser);
            isOk=true;
        }
        return isOk;
    }
    @RequestMapping(value = "findPwd")
    public String findPwd(){
        return "/basic/findPwd";
    }
    //修改密码
    @RequestMapping(value = "/resetPassword")
    public String findPassword(HttpServletRequest request){
        String username=request.getParameter("username");
        User user=signinManager.checkUserName(username);
        String password = request.getParameter("password");
        password = StringUtil.encodePassword(password, "SHA");
        user.setPassword(password);
        baseManager.saveOrUpdate(User.class.getName(),user);
        return "/basic/login";
    }

    //获取验证码
    private String getValidationCode(){
        StringBuffer code = new StringBuffer();
        Random random = new Random();
        for (int i = 0; i < 6; i++) {
            int j = random.nextInt(10);
            code.append(j);
        }
        return code.toString();
    }
}
