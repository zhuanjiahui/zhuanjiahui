package com.zhuanjiahui.order.controller;

import com.alibaba.fastjson.JSONObject;
import com.frame.core.base.service.BaseManager;
import com.frame.core.util.StringUtil;
import com.frame.core.util.alipay.config.AlipayConfig;
import com.frame.core.util.alipay.util.AlipayNotify;
import com.frame.core.util.alipay.util.AlipaySubmit;
import com.frame.core.util.yeepay.AESUtil;
import com.frame.core.util.yeepay.ZGTService;
import com.frame.organization.model.Province;
import com.frame.organization.service.CityManager;
import com.zhuanjiahui.order.model.PurchaseOrder;
import com.zhuanjiahui.order.model.PurchaseOrderPayment;
import com.zhuanjiahui.order.service.OrderManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by Administrator on 2015/6/30.
 */
@Controller
@RequestMapping(value = "/pc")
public class OrderPaymentController {
    @Autowired
    private BaseManager baseManager;
    @Autowired
    private OrderManager orderManager;
    @Autowired
    private CityManager cityManager;
    /*
    * 支付入口，生成支付页面
    * 订单分批支付的情况：因为订单号是不可重复的，所以这里用支付记录号作为订单号
    * */
    @RequestMapping(value = "/page")
    public void orderPayPage(HttpServletRequest request,HttpServletResponse response){
        String orderId = request.getParameter("orderId");
        //获取支付记录id和金额作为订单号和总费用
        Map<String, String> params = new HashMap<String, String>();
        params.put("out_trade_no", "");//订单支付记录号
        params.put("total_fee", "");//总费用
        params.put("subject", "");//订单名称（专家-课程）
        response.setContentType("text/html");
        try {
            PrintWriter writer = new PrintWriter(response.getOutputStream());
            writer.println(this.getPayForm(params));
            writer.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /*
    * 接受支付宝响应的业务逻辑*/
    @RequestMapping(value = "/payment")
    public void recordPayment(HttpServletRequest request,HttpServletResponse response){
        //获取支付宝POST过来反馈信息,签名
        Map<String, String> params = new HashMap<String, String>();
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
            //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
            params.put(name, valueStr);
        }//???????
        //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
        //商户订单号
        String out_trade_no = new String(request.getParameter("out_trade_no"));
        //支付宝交易号
        String trade_no = new String(request.getParameter("trade_no"));
        //交易状态
        String trade_status = new String(request.getParameter("trade_status"));
        //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
        try {
            ServletOutputStream out = response.getOutputStream();
            if (AlipayNotify.verify(params)) {//验证成功
                //////////////////////////////////////////////////////////////////////////////////////////
                //请在这里加上商户的业务逻辑程序代码
                //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
                if (trade_status.equals("TRADE_FINISHED")) {
                    //判断该笔订单是否在商户网站中已经做过处理
                    //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                    //如果有做过处理，不执行商户的业务程序
                    //.....................专家汇业务逻辑。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。
                    //注意：
                    //该种交易状态只在两种情况下出现
                    //1、开通了普通即时到账，买家付款成功后。
                    //2、开通了高级即时到账，从该笔交易成功时间算起，过了签约时的可退款时限（如：三个月以内可退款、一年以内可退款等）后。
                } else if (trade_status.equals("TRADE_SUCCESS")) {
                    //判断该笔订单是否在商户网站中已经做过处理
                    //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                    //如果有做过处理，不执行商户的业务程序
                    //.....................专家汇业务逻辑。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。
                    //注意：
                    //该种交易状态只在一种情况下出现——开通了高级即时到账，买家付款成功后。
                }

                //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
                out.println("success");    //请不要修改或删除
                //////////////////////////////////////////////////////////////////////////////////////////
            } else {//验证失败
                out.println("fail");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /*
    * 构造Alipay请求参数*/
    public String getPayForm(Map<String, String> params) {
        String payment_type = "1";
        String domain = "http://beijing.yuepaila.com";//外网域名或IP
        //必填，不能修改
        //服务器异步通知页面路径
        String notify_url = AlipayConfig.notify_url;
        //需http://格式的完整路径，不能加?id=123这类自定义参数
        //页面跳转同步通知页面路径
        String return_url = domain + "/pc/consumerMenu/pay/recordPaymentSync";
        //需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/
        //卖家支付宝帐户
        String seller_email = AlipayConfig.accountName;
        //必填
        //商户订单号
        String out_trade_no = params.get("out_trade_no");
        //商户网站订单系统中唯一订单号，必填
        //订单名称
        String subject = params.get("subject");
        //必填
        //付款金额
        String total_fee = params.get("total_fee");
        //必填
        String body = subject;
        //商品展示地址
        String show_url = "";
        //需以http://开头的完整路径，例如：http://www.商户网址.com/myorder.html		//防钓鱼时间戳
        String anti_phishing_key = "";
        //若要使用请调用类文件submit中的query_timestamp函数		//客户端的IP地址
        String exter_invoke_ip = "";
        //非局域网的外网IP地址，如：221.0.0.1
        //////////////////////////////////////////////////////////////////////////////////
        //把请求参数打包成数组
        Map<String, String> sParaTemp = new HashMap<String, String>();
        sParaTemp.put("service", "create_direct_pay_by_user");//服务接口
        sParaTemp.put("partner", AlipayConfig.partner);//卖家账户
        sParaTemp.put("_input_charset", AlipayConfig.input_charset);//编码
        sParaTemp.put("payment_type", payment_type);
        sParaTemp.put("notify_url", notify_url);
        sParaTemp.put("seller_email", seller_email);
        sParaTemp.put("out_trade_no", out_trade_no);
        sParaTemp.put("subject", subject);
        sParaTemp.put("total_fee", total_fee);//TODO 0.01
        sParaTemp.put("body", body);
        sParaTemp.put("show_url", show_url);
        sParaTemp.put("anti_phishing_key", anti_phishing_key);
        sParaTemp.put("exter_invoke_ip", exter_invoke_ip);
        String sHtmlText = AlipaySubmit.buildRequest(sParaTemp, "post", "确认");
        return sHtmlText;
    }
    /*
    * 根据订单号、支付金额、生成易宝支付页面,首次支付入口*/
    @RequestMapping(value = "/yeepay")
    public String getYeepayForm(HttpServletRequest request,HttpServletResponse response){
        String orderId=request.getParameter("orderId");
        String linkman=request.getParameter("linkname");
        String telephone=request.getParameter("telephone");
        String linkAddress=request.getParameter("address");
        String memo=request.getParameter("memo");
        String provinceId=request.getParameter("provinceId");
        Province province=cityManager.getProvince(provinceId);
        int payType=Integer.parseInt(request.getParameter("payType"));
        int gateWay=Integer.parseInt(request.getParameter("gateWay"));
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyyMMddhhmmss");
        String serial=simpleDateFormat.format(new Date());
        PurchaseOrder purchaseOrder=(PurchaseOrder)baseManager.getObject(PurchaseOrder.class.getName(),orderId);
        purchaseOrder.setLinkman(linkman);
        purchaseOrder.setTelephone(telephone);
        purchaseOrder.setLinkAddress(linkAddress);
        purchaseOrder.setPayType(payType);//预付订单 全额付款订单
        purchaseOrder.setPayStatus(1);//未支付
        purchaseOrder.setMemo(memo);
        purchaseOrder.setProvince(province);
        baseManager.saveOrUpdate(PurchaseOrder.class.getName(),purchaseOrder);
        PurchaseOrderPayment purchaseOrderPayment=new PurchaseOrderPayment();
        purchaseOrderPayment.setCreateDatetime(new Date());
        purchaseOrderPayment.setGateway(gateWay);//支付方式
        purchaseOrderPayment.setPayStatus(0);//支付完成前状态  未完成
        purchaseOrderPayment.setPurchaseOrder(purchaseOrder);
        purchaseOrderPayment.setPayType(payType);//支付类型  预付 全额  余款
        purchaseOrderPayment.setSerial(serial+ StringUtil.random(6,2));
        if(payType==1){
            purchaseOrderPayment.setPayed(purchaseOrder.getTotal().multiply(new BigDecimal(0.5)));
        }else {
            purchaseOrderPayment.setPayed(purchaseOrder.getTotal().multiply(new BigDecimal(purchaseOrder.getExpertServe().getDiscount()/20)));
        }
        baseManager.saveOrUpdate(PurchaseOrderPayment.class.getName(),purchaseOrderPayment);
        String amount=purchaseOrderPayment.getPayed().toString();
        String callbackurl ="http://locolhost:8080/pc/payBack";
        Map<String,String> map=new HashMap<String,String>();
        map.put("requestid",purchaseOrderPayment.getId());
        map.put("amount","0.01");
        map.put("productname",purchaseOrder.getExpert().getName()+"_"+purchaseOrder.getExpertServe().getName());
        map.put("callbackurl",callbackurl);
        if(gateWay==2){
            map.put("payproducttype","SALES");
        }else if(gateWay==3){
            map.put("payproducttype","ONEKEY");
        }
        map=ZGTService.paymentRequest(map);
        String payUrl=map.get("payurl");
        return "redirect:"+payUrl;

    }
    /*
   * 预付款订单，余款支付*/
    @RequestMapping(value = "/sparePay")
    public String sparePay(HttpServletRequest request,HttpServletResponse response){
        String orderId=request.getParameter("orderId");
        int gateWay=Integer.parseInt(request.getParameter("gateWay"));
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyyMMddhhmmss");
        String serial=simpleDateFormat.format(new Date());
        PurchaseOrder purchaseOrder=(PurchaseOrder)baseManager.getObject(PurchaseOrder.class.getName(),orderId);
        PurchaseOrderPayment purchaseOrderPayment=new PurchaseOrderPayment();
        purchaseOrderPayment.setCreateDatetime(new Date());
        purchaseOrderPayment.setGateway(gateWay);//支付方式
        purchaseOrderPayment.setPayStatus(0);//支付未成功
        purchaseOrderPayment.setPurchaseOrder(purchaseOrder);
        purchaseOrderPayment.setPayType(3);//余款支付
        purchaseOrderPayment.setSerial(serial+ StringUtil.random(6,2));
        purchaseOrderPayment.setPayed(purchaseOrder.getTotal().multiply(new BigDecimal(0.5)));//支付金额
        baseManager.saveOrUpdate(PurchaseOrderPayment.class.getName(),purchaseOrderPayment);

        String amount=purchaseOrderPayment.getPayed().toString();
        String callbackurl ="http://www.591zjh.com/pc/payBack";
        Map map=new HashMap<String,String>();
        map.put("requestid",purchaseOrderPayment.getId());
        map.put("amount","0.01");
        map.put("productname",purchaseOrder.getExpert().getName()+"_"+purchaseOrder.getExpertServe().getName());
        map.put("callbackurl",callbackurl);
        if(gateWay==2){
            map.put("payproducttype","SALES");
        }else if(gateWay==3){
            map.put("payproducttype","ONEKEY");
        }
        //调用支付接口
        Map m=ZGTService.paymentRequest(map);
        String payUrl=m.get("payurl").toString();
        return "redirect:"+payUrl;

    }
    /*支付成功后跳转至该入口，返回参数data*/
    @RequestMapping(value = "/payBack")
    public String yeepayCallBack(HttpServletRequest request){
        String data=request.getParameter("data");
/*
        String data="85687A6598BC2FEA9D727E70582F999827E5880717CEC00E87233A2A92E97C6106742DE6CF515CBF7577863950B24CDCFF3D24516DB3CC23C5BA6F3D2576CB6890B200C394406B7BA47CB0347A82D05E7BE8697C4735BAF0E63574A1337F03B480A7740862938E70236E736F567D80BE898D5DD5519059F6E40BE9D850482B5B2EA25364A024555AC07C06E26AF9EFDD9CA39919B4A8978E6C28A9408AB434FF27D9A7C2C2B920CB86694F3F56DEEF252FE501038A6A31E5ABA4E704C2650F09B6D9C20AE4ABE8AF6B7C78B3C1530AC073BF1F96CC7F84F0BB9BB5F8C7694FC4E7DF1F67CBB39B2C99410448A124D573";
*/
        String decryptData= AESUtil.decrypt(data,ZGTService.getKeyValue().substring(0,16));
        Map<String ,String> map= (Map)JSONObject.parse(decryptData);
        if(Integer.parseInt(map.get("code"))==1){
            String paymentId=map.get("requestId");
            //支付成功后修改订单、支付记录和档期状态
            orderManager.successPay(paymentId);
        }else {

        }
        return "/pc/purchaseOrder/myOrders";
    }
}
