package com.zhuanjiahui.manage.controller;

import com.frame.organization.dao.UserDao;
import com.frame.organization.model.User2;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2015/6/19.
 */
@Controller
@RequestMapping(value="/batch")
public class BatchController {
    @Autowired
    private UserDao userDao;
    @RequestMapping(value="/exl/register.do")
    public void batchRegister(HttpServletResponse response, MultipartRequest multipartRequest) throws Exception {
        //获取文件
        MultipartFile multipartFile = multipartRequest.getFile("registerFile");
        InputStream inputStream = multipartFile.getInputStream();
        //解析excel表格
        HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
        HSSFSheet sheet = workbook.getSheetAt(0);
        HSSFRow row = null;
        //初始化参数
        int rowCount = sheet.getLastRowNum() - sheet.getFirstRowNum();//记录数
        int successCount = 0;//注册成功数量
        int failCount = 0;//注册失败数量
        StringBuilder failUserName=new StringBuilder();//注册失败的手机号序列
        List<Object> users=new ArrayList<Object>(100);
        /* ROW:循环标志位*/
        for (int i = sheet.getFirstRowNum(); i < sheet.getLastRowNum(); i++) {
            row = sheet.getRow(i + 1);
            int firstCellNum = row.getFirstCellNum();//第一列编号
            //验证手机号格式
            Double doubleName = Double.parseDouble(row.getCell(firstCellNum).toString());
            String username = String.valueOf(doubleName.longValue());//手机号
            if (!username.startsWith("1") || username.length() != 11) {
                failCount ++;
                failUserName.append(username+" ");
                continue ;
            }
            User2 user=new User2();
/*            user.setUsername(username);
            user.setName(row.getCell(firstCellNum+1).toString());
            user.setPassword(StringUtil.encodePassword("000000","sha"));
            user.setTheStatus(1);*/

            users.add(user);
        }
        inputStream.close();
        /*userDao.batchSaveAndUpdate(User.class.getName(),users);*/
        return;

    }
    @RequestMapping(value = "/exl.do")
    public String getFile(){
        return "/manage/index";
    }
}
