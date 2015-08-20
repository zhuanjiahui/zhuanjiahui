<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <title>个人资料</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/public-css-style.css">
    <link rel="stylesheet" href="/theme/main.css">
    <script type="text/javascript" src="/scripts/zjh/zjh.js"></script>
    <script type="text/javascript" src="/scripts/jquery-1.8.0.min.js"></script>
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
         <%--   <dl>
                <dt class="no-border"><a href="#">我的消息</a></dt>
            </dl>--%>
        </div>
        <div class="content-head clear">
            <span class="content-head1">hi,你好,${myUser.name}</span>
            <span class="content-head2">上次登录时间:<fmt:formatDate value="${myUser.lastLogintime}" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate></span>
        </div>
        <div class="content-body">
            <ul class="body-nav">
                <li class="nav-li h-color"><a href="/pc/user/viewPersonal">个人资料</a> </li>
          <%--      <li class="nav-li"><a href="/pc/user/myBalance">资金管理</a> </li>
                <li class="nav-li"><a href="/pc/resetPwd">重置密码</a> </li>--%>
            </ul>

            <div id="personalView">
                <div class="body-sub">
                    <div class="Personal-information">
                        <img src="/images/duihao.gif">
                        个人资料信息
                    </div>
                    <div class="pi-inf-table">
                        <div class="pi-inf-tr">
                            <div class="pi-inf-td-l">
                                姓名:
                            </div>
                            <div class="pi-inf-td-r">
                                ${expert.name}
                            </div>
                        </div>
                        <div class="pi-inf-tr">
                            <div class="pi-inf-td-l">
                                性别:
                            </div>
                            <div class="pi-inf-td-r">
                                <zjh:status name="gender" dataType="Expert.gender" type="normal" checkedValue="${expert.gender}"></zjh:status>
                            </div>
                        </div>
                        <div class="pi-inf-tr">
                            <div class="pi-inf-td-l">
                                出生年月:
                            </div>
                            <div class="pi-inf-td-r">
                                <fmt:formatDate value="${expert.birthday}" pattern="yyyy-MM"></fmt:formatDate>
                            </div>
                        </div>
                        <div class="pi-inf-tr">
                            <div class="pi-inf-td-l">
                                联系电话:
                            </div>
                            <div class="pi-inf-td-r">
                                ${expert.phone}
                            </div>
                        </div>
                        <div class="pi-inf-tr">
                            <div class="pi-inf-td-l">
                                邮箱:
                            </div>
                            <div class="pi-inf-td-r">
                                ${expert.email}
                            </div>
                        </div>
                        <div class="pi-inf-tr">
                            <div class="pi-inf-td-l">
                                常驻地:
                            </div>
                            <div class="pi-inf-td-r">
                                ${expert.province.name}
                            </div>
                        </div>

                        <div class="pi-inf-tr">
                            <div class="pi-inf-td-l">
                                个人简介:
                            </div>
                            <div class="pi-inf-td-r">
                                ${expert.memo}
                            </div>
                        </div>
                    </div>
                    <div class="pi-imgs">
                        <img src="http://pic.591zjh.com/${expert.pictureUrl}">
                    </div>

                    <div class="pi-line"></div>

                    <div class="Personal-information">
                        <img src="/images/duihao.gif">
                        公司信息
                    </div>
                </div>
                <div class="pi-inf-table">
                    <div class="pi-inf-tr">
                        <div class="pi-inf-td-l">
                            公司名称:
                        </div>
                        <div class="pi-inf-td-r">
                            ${expert.companyName}
                        </div>
                    </div>

                    <div class="pi-inf-tr">
                        <div class="pi-inf-td-l">
                            公司地址:
                        </div>
                        <div class="pi-inf-td-r">
                            ${expert.companyAddress}
                        </div>
                    </div>
                    <div class="pi-inf-tr">
                        <div class="pi-inf-td-l">
                            所属行业:
                        </div>
                        <div class="pi-inf-td-r">
                            <zjh:status name="industry" dataType="ExpertServe.industry" type="normal" checkedValue="${expert.industry}"></zjh:status>
                        </div>
                    </div>
                    <div class="pi-inf-tr">
                        <div class="pi-inf-td-l">
                            公司简介:
                        </div>
                        <div class="pi-inf-td-r">
                            ${expert.companyMemo}
                        </div>
                    </div>

                </div>
                <div><button class="pi-but2" type="button"><a href="/pc/user/editPersonal">编辑</a> </button></div>
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



















