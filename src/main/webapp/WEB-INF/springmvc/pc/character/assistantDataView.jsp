<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/22
  Time: 11:39
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
    <title>助理个人中心</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/public-css-style.css">
    <link rel="stylesheet" href="/theme/main.css">
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
            <li><a href="/pc/assistant/viewPersonal">个人中心</a></li>
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
    <%--        <dl>
                <dt class="no-border"><a href="#">我的消息</a></dt>
            </dl>--%>
        </div>
        <div class="content-head clear">
            <span class="content-head1">hi,你好,${myUser.name}</span>
            <span class="content-head2">上次登录时间:<fmt:formatDate value="${myUser.lastLogintime}" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate></span>
        </div>
        <div class="content-body">
            <ul class="body-nav">
                <li class="nav-li h-color">个人资料</li>

            </ul>
            <div class="body-sub">
                <div class="Personal-information">
                    <img src="/images/duihao.gif">
                    完善个人资料信息
                </div>
                <form name="assistant" action="/pc/assistant/savePerson" method="post">
                    <div class="pi-inf-table">
                        <div class="pi-inf-tr">
                            <div class="pi-inf-td-l">
                                姓名：
                            </div>
                            <div class="pi-inf-td-r">
                                ${assistant.name}
                            </div>
                        </div>
                        <div class="pi-inf-tr">
                            <div class="pi-inf-td-l">
                                性别：
                            </div>
                            <div class="pi-inf-td-r" style="font-size:13px!important;">
                                <zjh:status name="gender" dataType="Expert.gender" type="normal" checkedValue="${assistant.gender}"></zjh:status>
                            </div>
                        </div>
                        <div class="pi-inf-tr">
                            <div class="pi-inf-td-l">
                                出生年月：
                            </div>
                            <div class="pi-inf-td-r">
                               <fmt:formatDate value="${assistant.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate>
                            </div>
                        </div>
                        <div class="pi-inf-tr">
                            <div class="pi-inf-td-l">
                                联系电话：
                            </div>
                            <div class="pi-inf-td-r">
                                ${assistant.phone}
                            </div>
                        </div>
                        <div class="pi-inf-tr">
                            <div class="pi-inf-td-l">
                                邮箱：
                            </div>
                            <div class="pi-inf-td-r">
                                ${assistant.email}
                            </div>
                        </div>
                        <div class="pi-inf-tr">
                            <div class="pi-inf-td-l">
                                常驻地：
                            </div>
                            <div class="pi-inf-td-r">
                               ${assistant.province.name}
                            </div>
                        </div>
                        <div class="pi-inf-tr">
                            <div class="pi-inf-td-l">
                                描述：
                            </div>
                            <div class="pi-inf-td-r">
                                ${assistant.memo}
                            </div>
                        </div>
                    </div>
                    <div class="pi-imgs">
                        <img src="http://pic.591zjh.com/${assistant.pictureUrl}">
                    </div>

                    <div class="pi-line1"></div>

                    <div><button class="pi-but2" type="submit"><a href="/pc/assistant/editPersonal">编辑</a> </button></div>
                </form>
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