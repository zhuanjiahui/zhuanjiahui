package com.frame.organization.service.impl;

import com.bcloud.msg.http.HttpSender;
import com.frame.organization.service.SmsProvider;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

/**
 * Created by Administrator on 2015/7/21.
 */
public class ChuangLanProvider implements SmsProvider{
    public static final String URL="http://222.73.117.158/msg/";//接口地址
    public static final String ACCOUNT="zhuanjia";//账户
    public static final String PASSWORD="Tch123456";//密码
    public static final String PRODUCT="";//商品ID
    public static final String EXTNO="";//扩展码
    public static final Boolean NEEDSTATUS=true;//状态吗

    public static final String ENCODE="UTF-8";

    @Override
    public String send(String mobiles, String content) {
        String result = null;
        try {
            result = HttpSender.batchSend(URL, ACCOUNT, PASSWORD, mobiles, content, NEEDSTATUS, PRODUCT, EXTNO);
        } catch (Exception e) {
            e.printStackTrace();
        }
       /* String result="";
        String  postDate="account="+ACCOUNT+"&pswd="+PASSWORD+"&mobiles="+mobiles+"&content="+content
                +"&needStatus=" +NEEDSTATUS+ "&product="+PRODUCT+"&extno="+EXTNO;
        try {
            URL dataUrl = new URL(URL);
            HttpURLConnection con = (HttpURLConnection) dataUrl.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Proxy-Connection", "Keep-Alive");
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            con.setDoOutput(true);
            con.setDoInput(true);
            con.setUseCaches(false);
            OutputStreamWriter out = new OutputStreamWriter(con.getOutputStream(), ENCODE);
            out.write(postDate);
            out.flush();
            out.close();
            InputStream is = con.getInputStream();
            DataInputStream dis = new DataInputStream(is);
            byte[] d = new byte[dis.available()];
            dis.read(d);
            result=new String(d,ENCODE);
            con.disconnect();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;*/
        return result;
    }

    @Override
    public String sendMsg(String mobile, String content, String ext, String stime, String rrid, String msgfmt) {
        return null;
    }
}
