<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ page import="com.frame.organization.model.MyUser" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/6
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">

    <title>专家个人中心</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/public-css-style.css">
    <link rel="stylesheet" href="/theme/main.css">


<body>
<div id="wrap">
<jsp:include page="../header.jsp"></jsp:include>
<!-- content部分 -->
<div class="content clear" style="margin-top: 4px;">
    <!-- 导航部分 -->
    <div class="nav">
        <ul>
            <li class="nav-1"><a href="/pc/index">首页</a></li>
            <li><a href="/pc/schedule/view">账号管理</a></li>
            <li><a href="/pc/expert/viewPersonal">个人中心</a></li>
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

                <dt><a href="/pc/expert/viewPersonal">基本资料</a></dt>
                <dd><a href="/pc/expert/viewPersonal">个人资料</a></dd>
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
  <%--          <dl>
                <dt class="no-border"><a href="#">我的消息</a></dt>
            </dl>--%>
        </div>
        <div class="content-head clear">
            <span class="content-head1">hi,你好,${myUser.name}</span>
            <span class="content-head2">上次登录时间：<fmt:formatDate value="${myUser.lastLogintime}" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate></span>
        </div>
        <div class="content-body">
            <ul class="body-nav">
                <li class="nav-li h-color"><a href="/pc/expert/viewPersonal">个人资料</a> </li>
                <%-- <li class="nav-li"><a href="/pc/personal/myBalance">资金管理</a> </li>
                 <li class="nav-li"><a href="/pc/resetPwd">重置密码</a> </li>--%>
            </ul>
            <div class="body-sub">
                <div class="Personal-information">
                    <img src="/images/duihao.gif">
                    完善个人资料信息
                </div>
                <!--万云 2015.08.17 个人信息查看页面重写-->
                <div class="personInfo">
                    <a href="/pc/expert/editPersonal" class="perInfoEdit">编辑</a>
                    <img src="http://pic.591zjh.com/${expert.pictureUrl}" class="perInfoPhoto">
                    <ul>
                        <li><p>姓名：</p><p>${expert.name}</p></li>
                        <li><p>性别：</p><p><zjh:status name="gender" dataType="Expert.gender" type="normal" checkedValue="${expert.gender}"></zjh:status></p></li>
                        <li><p>出生日期：</p><p><fmt:formatDate value="${expert.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate></p></li>
                    </ul>
                    <ul>
                        <li><p>所在公司：</p><p>${expert.companyName}</p></li>
                        <li><p>公司地址：</p><p>${expert.companyAddress}</p></li>
                        <li><p>现任职务：</p><p>${expert.preposition}</p></li>
                        <li><p>最高职务：</p><p>${expert.chief}</p></li>
                        <li><p>工作年限：</p><p> ${expert.workTime}</p></li>
                        <li>
                            <p>风格标签：</p>
                            <p>
                                <c:forEach items="${expert.styleLabelList}" var="styleLable">
                                    ${styleLable.label}&nbsp;
                                </c:forEach>
                            </p>
                        </li>
                        <li>
                            <p>行业：</p>
                            <p>
                                <c:forEach items="${expert.expertIndustryList}" var="expertIndustry">
                                    <zjh:status name="industry" dataType="ExpertServe.industry" type="normal" checkedValue="${expertIndustry.industry}"></zjh:status>&nbsp;
                                </c:forEach>
                            </p>
                        </li>
                        <li>
                            <p>关键字：</p>
                            <p>
                                <c:forEach items="${expert.keywordsList}" var="keyword">
                                    ${keyword.words}
                                </c:forEach>
                            </p>
                        </li>
                    </ul>
                    <ul>
                        <li><p>联系电话：</p><p>${expert.phone}</p></li>
                        <li><p>邮箱：</p><p>${expert.email}</p></li>
                        <li><p>常驻地：</p><p>${expert.province.name}</p></li>
                        <li><p>个人描述：</p><p>${expert.memo}</p></li>
                        <li><div>个人简介：</div><div>${expert.introduce}
                        </div></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</div>
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
</body>
</html>