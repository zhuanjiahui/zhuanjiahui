package com.frame.organization.controller;

import com.frame.organization.service.SmsProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2015/7/21.
 */
@Controller
public class SmsController {

    @RequestMapping(value="/test.do")
    public void test() throws Exception {

        String mobile="15313060718";
        String content="123456【语博科技】";

    }
}
