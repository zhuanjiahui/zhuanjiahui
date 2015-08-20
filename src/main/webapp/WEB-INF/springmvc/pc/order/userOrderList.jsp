<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/6
  Time: 17:36
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
    <title>用户订单管理</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link href="/theme/public-css-style.css" rel="stylesheet">
    <link href="/theme/main.css" rel="stylesheet">
    <script type="text/javascript" src="/scripts/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/scripts/zjh/zjh-public.js"></script>
</head>
<body>
<div id="wrap">
<jsp:include page="../header.jsp"></jsp:include>
<!-- content部分 -->
<div class="content clear">
<!-- 导航部分 -->
<div class="nav">
    <ul>
        <li class="nav-1"><a href="/pc/index">首页</a></li>
        <li><a href="/pc/schedule/view">账号管理</a></li>
        <li><a href="/pc/user/view">个人中心</a></li>
        <li><a href="/pc/requirement/myPublish">我的需求</a></li>
        <li><a href="/pc/activity/myActivity">我的活动</a></li>
<%--
        <li><a href="#">消息</a></li>
--%>
    </ul>
</div>
<div class="content-sub">
    <div class="content-sub1">
        <div class="content-sub2"><img src="/images/order-bg2.png" alt="背景图文字部分"></div>
    </div>
</div>
<div id="wrap2">
<div class="content-sidebar fl">
    <dl>

        <dt><a href="/pc/user/view">基本资料</a></dt>
        <dd><a href="/pc/user/view">个人资料</a></dd>
        <c:if test="${myUser.utype==2}">
            <dd><a href="/pc/expertServe/add">服务内容</a></dd>
        </c:if>
<%--
        <dd><a href="/pc/user/myBalance">资金管理</a></dd>
--%>
        <dd><a href="/pc/bindPhone">修改账户</a></dd>
        <dd><a href="/pc/resetPwd">重置密码</a></dd>
    </dl>
    <dl>
        <dt class="order-icon2"><a href="/pc/purchaseOrder/myOrders">账号管理</a></dt>
        <dd><a href="/pc/purchaseOrder/myOrders">订单管理</a></dd>
        <c:if test="${myUser.utype==3}">
            <dd><a href="/pc/assistant/myExperts">专家管理</a></dd>
        </c:if>
        <c:if test="${myUser.utype==2}">
            <dd><a href="/pc/schedule/view">档期管理</a></dd>
        </c:if>
        <dd><a href="/pc/requirement/myPublish">需求管理</a></dd>
        <dd><a href="/pc/activity/myActivity">活动管理</a></dd>
    </dl>

    <dl>
        <dt class="order-icon3"><a href="/pc/favorite/listExpert">我的收藏</a></dt>
        <dd><a href="/pc/favorite/listExpert">收藏专家</a></dd>
    </dl>
<%--    <dl>
        <dt class="no-border"><a href="#">我的消息</a></dt>
    </dl>--%>
</div>
<div class="content-head clear">
    <span class="content-head1">hi,中午好,${myUser.name}</span>
    <span class="content-head2">上次登录时间：<fmt:formatDate value="${myUser.lastLogintime}" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate></span>
</div>
<div class="content-body">
<ul class="body-nav">
    <li class="nav-li">全部</li>
<%--    <li class="nav-li">待支付</li>
    <li class="nav-li">已支付</li>
    <li class="nav-li">预支付</li>--%>
</ul>
<c:forEach items="${pageInfo.list}" var="purchaseOrder">


<div class="body-sub">
    <div class="body-title">
        <span><a href="/pc/purchaseOrder/viewOrder?orderId=${purchaseOrder.id}">订单号：${purchaseOrder.serial}</a></span>&nbsp;&nbsp;<i>|</i><span>${purchaseOrder.serveDatetime}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span></span>&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="special"><zjh:status name="payStatus" dataType="PurchaseOrder.payStatus" type="normal" checkedValue="${purchaseOrder.payStatus}"></zjh:status> </span>
    </div>
    <div class="body-con">
        <dl>
            <dt><img src="http://pic.591zjh.com/${purchaseOrder.expert2.pictureUrl}_80w" alt="订单人物"></dt>
            <dd>
								<span class="list">
									<span>${purchaseOrder.expert2.name}</span>
								</span>
								<span class="list">
									<span>${purchaseOrder.expertServe.name}</span>
								</span>
								<span class="list">
									<span>订单金额：￥${purchaseOrder.total}元</span>
								</span>
            </dd>
            <dd>
								<span class="list">
									<span>类型：<zjh:status name="ptype" dataType="ExpertServe.serveType" type="normal" checkedValue="${purchaseOrder.ptype}"></zjh:status></span>
								</span>
								<span class="list">
                            		<span>${purchaseOrder.expertServe.price}元/天 </span>
								</span>
								<span class="list special">
                					<span><zjh:status name="processStatus" dataType="PurchaseOrder.processStatus" type="normal" checkedValue="${purchaseOrder.processStatus}"></zjh:status> </span>
								</span>
            </dd>
            <dd>
								<span class="list">
                                    <span>服务时间：<fmt:formatDate value="${purchaseOrder.serveDatetime}" pattern="yyyy-MM-dd" ></fmt:formatDate> </span>
							    </span>
							    <span class="list">
                            		<span><zjh:status name="dayType" dataType="PurchaseOrder.dayType" type="normal" checkedValue="${purchaseOrder.dayType}"></zjh:status> </span>
								</span>
								<span class="list">
                					<span>${purchaseOrder.linkAddress} </span>
								</span>
            </dd>

        </dl>
        <ol>
            <li class="pop-up-clickbut"><a href="/pc/purchaseOrder/viewOrder?orderId=${purchaseOrder.id}">查看详情</a></li>
            <c:if test="${purchaseOrder.processStatus<4}">
                 <li><a href="#" onclick="sureOrderProcess('${purchaseOrder.id}',4)">取消订单</a></li>
            </c:if>
            <c:if test="${purchaseOrder.processStatus==5}">
                <zjh:status name="processStatus" dataType="PurchaseOrder.processStatus" type="normal" checkedValue="${purchaseOrder.processStatus}"></zjh:status>
            </c:if>
            <c:if test="${purchaseOrder.processStatus==6}">
                <li><a href="#" onclick="sureOrderProcess('${purchaseOrder.id}',9)">确认订单</a></li>
            </c:if>
            <c:if test="${purchaseOrder.payStatus==1}">
                <li class="payment-order special"><a href="/pc/purchaseOrder/orderLink?id=${purchaseOrder.id}">支付订单</a></li>
            </c:if>
            <c:if test="${purchaseOrder.payStatus==2}">
                <li class="payment-order special"><a href="/pc/purchaseOrder/sparePay">支付余款</a></li>
            </c:if>
        </ol>
    </div>
</div>
</c:forEach>
<!-- 页码部分 -->
<div class="page-normal">
    <ul class="page-ul">
        <zjh:pageList bean="${pageEntity}" url="/pc/purchaseOrder/userOrders"></zjh:pageList>

    </ul>
</div>
</div>
</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</div>
<!--    弹出框部分-->
<!--    增加地址弹出部分-->
<div class="pop-up-bg"></div>
<div class="pop-up-rili-wapper">
<div class="pop-up-down3"><img src="images/pop-up-down3.png"></div>

<div class="ms1-table">
<div class="ms1-table-l">
<div class="ms1-tr">
    <div class="ms1-td">周一</div>
    <div class="ms1-td">周二</div>
    <div class="ms1-td">周三</div>
    <div class="ms1-td">周四</div>
    <div class="ms1-td">周五</div>
    <div class="ms1-td">周六</div>
    <div class="ms1-td">周日</div>
</div>

<div class="ms1-tr-num">
    <div class="ms1-td ms1-color1">29
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td ms1-color1">30
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td ms1-color1">01
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td ms1-color1">02
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td ms1-color1">03
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td ms1-color1">04
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td ms1-color1">05
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
</div>

<div class="ms1-tr-num">
    <div class="ms1-td ms1-color2">06
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td ms1-color3">07
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td">08
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
        <div class="ms1-dian"><img src="images/ms-dian.png"></div>

    </div>
    <div class="ms1-td">09
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td">10
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td">11
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td">12
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
</div>

<div class="ms1-tr-num">
    <div class="ms1-td">13
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td">14
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td">15
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td">16
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td">17
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td">18
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td">19
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
</div>

<div class="ms1-tr-num">
    <div class="ms1-td">20
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td">21
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td">22
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td">23
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td">24
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td">25
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td">26
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
</div>

<div class="ms1-tr-num">
    <div class="ms1-td">27
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td">28
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td">29
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td">30
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td ms1-color1">01
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td ms1-color1">02
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
    <div class="ms1-td ms1-color1">03
        <div class="ms1-zhuangtai-wapper">
            <div class="ms1-zhuangtai">
                <div class="ms1-keyue">可约</div>
                <div class="ms1-bukeyue">不可约</div>
                <div class="ms1-yiyue">以约</div>
            </div>
        </div>
    </div>
</div>

</div>
<div class="ms1-table-r">
    <div class="ms1-tr-r">
        <div class="ms1-td-r-1"><img src="images/ms-left.png"></div>
        <div class="ms1-td-r-2">2015年7月</div>
        <div class="ms1-td-r-3"><img src="images/ms-right.png"></div>
    </div>
    <div class="ms1-tr-r">
        <div class="ms1-td-r4">06</div>
        <div class="ms1-td-r5">周一</div>
    </div>
</div>
</div>
<div class="pop-but-sq">收起</div>
<div class="pop-up-ts1"><span style="color:#c5c8c9;">灰色</span>：不可修改（已确定订单）</div>
<div class="pop-up-ts2"><span style="color:#ed7027;">橙色</span>：原订单日期
    <span style="color:#1bb9f2;">蓝色</span>：新订单日期</div>
<div><button  class="pop-but1">保存</button></div>

</div>
<div class="ms1-zhuangtai-wapper">
    <div class="ms1-zhuangtai">
        <div class="ms1-keyue">可约</div>
        <div class="ms1-bukeyue">不可约</div>
        <div class="ms1-yiyue">以约</div>
    </div>
</div>

<div class="pop-up-bg"></div>
<div class="pop-up-om-wapper1">
    <div class="pop-up-down3-om"><img src="images/pop-up-down3.png"></div>
    <div class="pop-up-zfye">支付余额</div>
    <div class="pop-up-om-line"></div>
    <div class="pop-up-om-but1">支付余额</div>
    <div class="pop-up-om-but2">线下支付</div>
    <div class="pop-up-om-fotter">提示：本平台不涉及线下支付业务</div>
</div>
<div class="pop-up-om-wapper2">
    <div class="pop-up-down3-om2"><img src="images/pop-up-down3.png"></div>
    <div class="pop-up-ts1"><span style="font-size:20px;">提示</span>：请在接受服务后点击确定按钮，并给予专家评价！</div>
    <div class="pop-up-ts2">确定后账款会打入专家账户中，为维护您的权益请勿在服务结束前点击确定按钮。</div>
    <div class="pop-up-butom">确定</div>
</div>
<script type="text/javascript">
    $(function(){
        $(".pop-up-clickbut").click(function(){
            $(".pop-up-bg").css('display','block');
            $(".pop-up-rili-wapper").css('display','block');
        });
        $(".pop-up-down3").click(function(){
            $(".pop-up-bg").css('display','none');
            $(".pop-up-rili-wapper").css('display','none');
        });
//            支付订单
        $(".payment-order").click(function(){
            $(".pop-up-bg").css('display','block');
            $(".pop-up-om-wapper1").css('display','block');
        });
        $(".pop-up-down3-om").click(function(){
            $(".pop-up-bg").css('display','none');
            $(".pop-up-om-wapper1").css('display','none');
        });
//            确认支付
        $(".confirm-the-payment").click(function(){
            $(".pop-up-bg").css('display','block');
            $(".pop-up-om-wapper2").css('display','block');
        });
        $(".pop-up-down3-om2").click(function(){
            $(".pop-up-bg").css('display','none');
            $(".pop-up-om-wapper2").css('display','none');
        });
    });
    $(function(){
        $(".ms1-td").click(function(){
            var state=$(this).find(".ms1-zhuangtai-wapper").css("display");
            $(".ms1-zhuangtai-wapper").css('display','none');
            if(state=="none"){

                $(this).children(":eq(0)").css('display','block');
            }else{
                $(this).children(":eq(0)").css('display','none');
            }
        });

    })
</script>

<!-- jiathis插件侧边栏 -->
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
</body>
</html>
