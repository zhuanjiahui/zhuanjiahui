<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/28
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <title>核对订单信息</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/public-css-style.css">
    <link rel="stylesheet" href="/theme/main.css">
    <script type="text/javascript" src="/scripts/jquery-1.8.0.min.js"></script>
    <style>
        #address{
            width: 500px;
            border-color: #878787;
            border-style: solid;
            border-top-width: 0px;
            border-right-width: 0px;
            border-bottom-width: 1px;
            border-left-width: 0px;
        }
        #linkname ,#telephone{
            width: 200px;
            border-color: #878787;
            border-style: solid;
            border-top-width: 0px;
            border-right-width: 0px;
            border-bottom-width: 1px;
            border-left-width: 0px;
        }
    </style>
</head>
<body>
<div id="wrap">
<!-- top顶部 -->
<div class="top">
    <div class="top-sub">
        <div class=" top-l fl">
            <% MyUser user= AuthorizationUtil.getMyUser();
                if(user!=null&&user.getUsername()!=null){
                    pageContext.getOut().print("<a class=\"top-l1\" href=\"/pc/user/view\">"+user.getNavName()+"</a>");
                }else {
                    pageContext.getOut().print("<a class=\"top-l1\" href=\"/pc/login\">登录</a>");
                }
            %>
            <i>|</i>
            <a class="top-l2" href="/pc/enroll">免费注册</a>
        </div>
        <div class=" top-r fr">
            <%
                if(user!=null&&user.getUtype()!=null) {
                    if (user.getUtype() == 1) {
                        pageContext.getOut().print("<a href=\"/pc/switchUser\">切换至专家</a><i>|</i>");
                    } else if (user != null && user.getUtype() == 2) {
                        pageContext.getOut().print("<a href=\"/pc/switchUser\">切换至用户</a><i>|</i>");
                    }
                }
            %>
            <a href="/pc/favorite/listExpert">我的收藏</a><i>|</i>
            <a href="/pc/purchaseOrder/myOrders">我的订单</a><i>|</i>
            <a class="top-r1" href="/pc/user/view">个人中心</a>
            <%
                if(user!=null&&user.getUtype()!=null) {
                    pageContext.getOut().print("<i>|</i><a href=\"j_spring_security_logout\">退出</a>");
                }
            %>

        </div>
    </div>
</div>
<!-- header部分 -->
<div class="header clear">
    <div class="logo fl">
        <a href="/pc/index"><img src="/images/logo.png" alt="logo"></a>
    </div>

    <div class="a-header-r">
        <%--   <div class="a-header-r-wapper">
               <div class="a-header-r-rectangle"></div>
               <div class="a-header-r-circular">1</div>
               <div class="a-header-r-wz">1.我的预约</div>
           </div>--%>
        <div class="a-header-r-wapper">
            <div class="a-header-r-rectangle a-header-r-c2"></div>
            <div class="a-header-r-circular a-header-r-c2">1</div>
            <div class="a-header-r-wz a-header-r-wz-c2">1.填写并核对</div>
        </div>
        <div class="a-header-r-wapper">
            <div class="a-header-r-rectangle"></div>
            <div class="a-header-r-circular">2</div>
            <div class="a-header-r-wz">2.成功提交</div>
        </div>
    </div>

</div>
<!--主体部分 -->
<div class="main-wapper">
    <div class="main-wapper2">
        <div class="check-information">
            填写并核对订单信息
        </div>
        <form name="yeepay" action="/pc/sparePay" method="post">
            <input type="hidden" name="gateWay" id="gateWay" value="2">
            <input type="hidden" name="orderId"  value="${purchaseOrder.id}">

            <div class="main-wapper3">
                <div class="a-inf-1">
                    <div class="a-inf-content-1">
                        <div class="a-inf-content-wz1">联系人信息</div>

                    </div>
                    <div  class="a-inf-content-2">
                        <div class="a-inf-content-wz2">联系人</div>
                        <div class="a-inf-content-wz3">
                            ${purchaseOrder.linkman}&nbsp;&nbsp;&nbsp;&nbsp;
                            ${purchaseOrder.telephone}
                        </div>
                    </div>
                </div>
                <div class="a-inf-1">
                    <div class="a-inf-content-1">
                        <div class="a-inf-content-wz1">地址信息</div>
                    </div>
                    <div  class="a-inf-content-2">
                        <div class="a-inf-content-wz2">地址</div>
                        <div class="a-inf-content-wz3">

                            ${linkAddress.province.name}&nbsp;&nbsp; ${linkAddress.address}
                        </div>
                    </div>
                </div>
                <div class="a-inf-1">
                    <div class="a-inf-content-1">
                        <div class="a-inf-content-wz1">支付方式</div>
                    </div>
                    <div class="a-inf-content-2">
                        <div class="a-inf-content-wzbut a-inf-content-wz4"><a href="#">支付宝</a> </div>
                        <div class="a-inf-content-wzbut a-inf-content-wz5"><span onclick="$('#gateWay').val(2)">网银支付</span></div>
                    </div>
                </div>
                <div class="a-order">
                    <div class="a-order-l1">
                        订单信息
                    </div>
                    <div class="a-order-l2">
                        <div class="a-order-l2-1">
                            <img src="http://pic.591zjh.com/${purchaseOrder.expert2.pictureUrl}">
                        </div>
                        <div class="a-order-l2-2">
                            <div class="a-order-l2-2-1">${purchaseOrder.expert2.name}</div>
                            <div class="a-order-l2-2-4">
                                服务:${purchaseOrder.expertServe.name}-${purchaseOrder.expertServe.price}元/天 服务时间:<fmt:formatDate value="${purchaseOrder.serveDatetime}" pattern="yyyy-MM-dd"></fmt:formatDate>
                                <span style="color:#ec6618;"><zjh:status name="dayType" dataType="PurchaseOrder.dayType" type="normal" checkedValue="${purchaseOrder.dayType}"></zjh:status></span><br>
                            </div>
                        </div>
                        <div class="a-order-l2-3">
                            <div class="a-order-l2-3wz">
                                <span>应付金额:</span><span id="total" style="color:#ec6618;">${purchaseOrder.total*0.5}</span>元<br/>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="a-order-xx"></div>
                <div class="a-order-sx"></div>
                <div class="a-order-beizhu">
                    <div class="a-order-beizhu-l">
                        订单备注:${purchaseOrder.memo}
                    </div>

                </div>
                <div><button class="a-order-but-zf" type="submit">支付</button></div>
            </div>
        </form>
    </div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>
</div>





<script type="text/javascript">
    $(function(){
        $(".a-inf-content-but1").click(function(){
            $(".pop-up-bg").css('display','block');
            $(".pop-up-wapper2").css('display','block');
        });

        $(".a-order-but-zf").click(function(){
            $(".pop-up-bg").css('display','block');
            $(".pop-up-wapper3").css('display','block');
        });


        $(".a-inf-content-but2").click(function(){
            $(".pop-up-bg").css('display','block');
            $(".pop-up-wapper").css('display','block');
        });
        $(".pop-up-down").click(function(){
            $(".pop-up-bg").css('display','none');
            $(".pop-up-wapper").css('display','none');
            $(".pop-up-wapper2").css('display','none');
        });
        $(".pop-up-down2").click(function(){
            $(".pop-up-bg").css('display','none');
            $(".pop-up-wapper3").css('display','none');
            $(".pop-up-wapper2").css('display','none');
        });


        $(".a-inf-content-wzbut").click(function(){
            $(".a-inf-content-wzbut").removeClass("a-inf-content-wz5");
            $(".a-inf-content-wzbut").addClass("a-inf-content-wz4");
            $(this).addClass("a-inf-content-wz5");

        });
    });


</script>

<!-- jiathis插件侧边栏 -->
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
</body>
</html>