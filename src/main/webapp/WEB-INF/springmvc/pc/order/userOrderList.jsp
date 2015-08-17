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
<!-- top顶部 -->
    <div class="top">
    <div class="top-sub">
        <div class=" top-l fl">
            <% MyUser user= AuthorizationUtil.getMyUser();
                if(user!=null&&user.getUsername()!=null){
                    pageContext.getOut().print("<a class=\"top-l1\" href=\"/pc/user/view\">"+user.getUsername()+"</a>");
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
    <div class="text-border fl">
        <img src="/images/text-border.png" alt="text-border">
    </div>

    <!-- TAB切换效果 -->
    <div class="search fl">
        <div class="search-top clear"  id="tab-nav">
            <ul>
                <li class="select">专家</li>
                <li class="">需求</li>
                <li class="">活动</li>
            </ul>
        </div>
        <form action="/pc/expertServe/search" method="post">
            <div class="search-box">
					<span class="box1 fl">
						<input type="text" name="words" value="" placeholder="关键字、课程">
					</span>
					<span class="box2 fl">
						<input type="submit" value="搜 索">
					</span>
            </div>
        </form>
        <div class="search-bottom" id="tab_con">
            <ul class="show">
                <li><a href="/pc/expertServe/pageList?major=manage&courseType=zhcgljn&serveType=train">中层管理技能</a></li>
                <li><a href="/pc/expertServe/pageList?major=internet&courseType=hlwsw&serveType=train">互联网思维</a></li>
                <li><a href="/pc/expertServe/pageList?major=production&courseType=yfgl&serveType=train">研发管路</a></li>
                <li><a href="/pc/expertServe/pageList?major=leadership&courseType=xmgl&serveType=train">项目管理</a></li>
                <li><a href="/pc/expertServe/pageList?major=professionalism&courseType=gxgt&serveType=train">高效沟通</a></li>
            </ul>
            <ul class="">
                <zjh:status name="major" dataType="ExpertServe.major" type="list" checkedValue="" onclick="/pc/requirement/pageList?type='train'&major="></zjh:status>

            </ul>
            <ul class="">
                <zjh:status name="type" dataType="Activity.type" type="list" checkedValue="" onclick="/pc/activity/pageList?type="></zjh:status>

            </ul>
        </div>
    </div>
</div>
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
        <li><a href="#">消息</a></li>
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
        <dd><a href="/pc/user/myBalance">资金管理</a></dd>
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
    <dl>
        <dt class="no-border"><a href="#">我的消息</a></dt>
    </dl>
</div>
<div class="content-head clear">
    <span class="content-head1">hi,中午好,jay123</span>
    <span class="content-head2">上次登录时间：2015.6.30</span>
</div>
<div class="content-body">
<ul class="body-nav">
    <li class="nav-li">全部</li>
    <li class="nav-li">待支付</li>
    <li class="nav-li">已支付</li>
    <li class="nav-li">预支付</li>
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
            <li class="pop-up-clickbut"><a href="/pc/purchaseOrder/viewOrder?orderId=${purchaseOrder.id}" target="_blank">查看详情</a></li>
            <c:if test="${purchaseOrder.processStatus<4}">
                 <li><a href="#" onclick="sureOrderProcess('${purchaseOrder.id}',4)">取消订单</a></li>
            </c:if>
            <c:if test="${purchaseOrder.processStatus==5}">
                <zjh:status name="processStatus" dataType="PurchaseOrder.processStatus" type="normal" checkedValue="${purchaseOrder.processStatus}"></zjh:status>
            </c:if>
            <c:if test="${purchaseOrder.processStatus==6}">
                <li><a href="#" onclick="sureOrderProcess('${purchaseOrder.id}',9)">确认订单</a></li>
            </c:if>
            <c:if test="${purchaseOrder.processStatus==9}">
                <li>已完成</li>
            </c:if>
            <c:if test="${purchaseOrder.payStatus==1}">
                <li class="payment-order special"><a href="/pc/purchaseOrder/orderLink?id=${purchaseOrder.id}" target="_blank">支付订单</a></li>
            </c:if>
            <c:if test="${purchaseOrder.payStatus==2}">
                <li class="payment-order special"><a href="/pc/purchaseOrder/sparePay?id=${purchaseOrder.id}" target="_blank">支付余款</a></li>
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
<!-- 回到顶部 -->
<a href="javascript:;" id="btn" title="回到顶部"></a>
<!-- footer部分 -->
<div class="footer">
    <div class="footer-wrap">
        <ul class="footer-ul1">
            <li class="ul1-li1">
                <div class="footer-ul1-title">关于我们</div>
                <div class="footer-ul1-con"><a href="#">公司介绍</a></div>
                <div class="footer-ul1-con"><a href="#">联系我们</a></div>
                <div class="footer-ul1-con"><a href="#">加入我们</a></div>
                <div class="footer-ul1-con"><a href="#">网站条款</a></div>
                <div class="footer-ul1-con"><a href="#">活动公告</a></div>
            </li>
            <li class="ul1-li1">
                <div class="footer-ul1-title">帮助中心</div>
                <div class="footer-ul1-con"><a href="#">平台流程</a></div>
                <div class="footer-ul1-con"><a href="#">专家入驻</a></div>
                <div class="footer-ul1-con"><a href="#">用户帮助</a></div>
                <div class="footer-ul1-con"><a href="#">助理帮助</a></div>
                <div class="footer-ul1-con"><a href="#">专家帮助</a></div>
            </li>
            <li class="ul1-li1">
                <div class="footer-ul1-title">服务支持</div>
                <div class="footer-ul1-con"><a href="#">服务保障</a></div>
                <div class="footer-ul1-con"><a href="#">服务专家</a></div>
                <div class="footer-ul1-con"><a href="#">投诉侵权</a></div>
                <div class="footer-ul1-con"><a href="#">意见反馈</a></div>
            </li>
            <li class="ul1-li3">
                <div class="footer-ul1-title">关注我们</div>
                <div class="footer-ul1-con">
                    <div class="ul1-con-pic">
                        <div class="ul1-con-pic1">
                            <a href="#">
                                <img class="ul1-con-pic1-1" src="images/weixin.png" alt="ul1-con-pic">
                                <img class="ul1-con-pic1-2" src="images/weixinh.png" alt="悬浮出现">
                                <div>微信公共号</div>
                            </a>
                        </div>
                        <div class="ul1-con-pic1">
                            <a href="#">
                                <img class="ul1-con-pic1-1" src="/images/sina.png" alt="ul1-con-pic">
                                <img class="ul1-con-pic1-2" src="/images/sinah.png" alt="悬浮出现">
                                <div>新浪微博</div>
                            </a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="ul1-li4">
                <div class="footer-ul1-title">客服热线</div>
                <div class="footer-ul1-con">（工作时间:08:00 - 23:00）</div>
                <div class="footer-ul1-con biancu">010-51591591</div>
            </li>
        </ul>
        <div class="footerpic">
            <img src="/images/footer-pic.png" alt="底部图片">
        </div>
        <div class="footer-bottom">

            <p>&copy;2011-2015&nbsp;&nbsp;专家汇&nbsp;&nbsp;All&nbsp;&nbsp;Rights&nbsp;&nbsp;Reserved&nbsp;&nbsp;北京语博信息科技有限公司&nbsp;&nbsp;&nbsp;&nbsp;京ICP备11001010号-7&nbsp;&nbsp;京公网安备&nbsp;&nbsp;11010702111111</p>
        </div>
    </div>
</div>
</div>
<!--    弹出框部分-->
<!--    增加地址弹出部分-->
<div class="pop-up-bg"></div>

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
    <div class="pop-up-down3-om2"><img src="/images/pop-up-down3.png"></div>
    <div class="pop-up-ts1"><span style="font-size:20px;">提示</span>：请在接受服务后点击确定按钮，并给予专家评价！</div>
    <div class="pop-up-ts2">确定后账款会打入专家账户中，为维护您的权益请勿在服务结束前点击确定按钮。</div>
    <div class="pop-up-butom">确定</div>
</div>
<script type="text/javascript">
    $(function(){

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
