<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/22
  Time: 17:51
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
    <title>专家我的收藏</title>
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
            <span class="content-head1">hi,中午好,${myUser.name}</span>
            <span class="content-head2">上次登录时间:<fmt:formatDate value="${myUser.lastLogintime}" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate></span>
        </div>
<div class="content-body">
    <ul class="body-nav">
        <li class="nav-li">收藏专家</li>
    </ul>
    <div class="body-sub">
        <c:forEach items="${pageInfo.list}" var="favoriteExpert">
        <div class="body-con-3">
            <div class="con-l">
                <div class="con-l1"><img src="http://pic.591zjh.com/${favoriteExpert.expert.pictureUrl}_90w" style="border:0"></div>
                <div class="con-l2">
                    <div class="star">
                        <c:forEach items="${favoriteExpert.expert.grade}">
                        </c:forEach>
                            <span class="star-pic"><img src="/images/star-pic.png" style="border:0"></span>
                            <span class="star-pic"><img src="/images/star-pic.png" style="border:0"></span>
                            <span class="star-pic"><img src="/images/star-pic.png" style="border:0"></span>
                            <span class="star-pic"><img src="/images/star-pic.png" style="border:0"></span>
                            <span class="star-pic"><img src="/images/star-pic.png" style="border:0"></span>
                        <span class="grade">5.0分</span>
                    </div>
                    <div class="place">${favoriteExpert.expert.province.name}</div>
                </div>
            </div>
            <div class="con-m">
                <div class="con-m1">
                    <dl>
                        <dt>${favoriteExpert.expert.name}<span><zjh:status name="industry" dataType="ExpertServe.industry" type="normal" checkedValue="${expert.industry}"></zjh:status></span></dt>
                        <dd>${favoriteExpert.expert.memo}</dd>
                        <dd>${favoriteExpert.expert.workTime}年教龄</dd>
                    </dl>
                </div>

                <div class="con-m3">
                    <c:forEach items="${favoriteExpert.expert.styleLabelList}" var="stylelabel">
                        <span>${stylelabel.label}</span>
                    </c:forEach>
                </div>
            </div>
            <div class="con-r">
                <a href="/pc/expert/viewExpert?expertId=${favoriteExpert.expert.id}">查看详情</a>
                <span><a href="#" onclick="delExpert('${favoriteExpert.id}',this)">删除收藏</a></span>
            </div>
        </div>
        </c:forEach>
    </div>
    <!-- 页码部分 -->
    <div class="page-normal">
        <ul class="page-ul">
            <zjh:pageList bean="${pageEntity}" url="/pc/favorite/listExpert">
            </zjh:pageList>
        </ul>
    </div>
</div>
</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</div>
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
<script type="text/javascript">
    function delExpert(id,obj){
        $.ajax({
            url:"/pc/favorite/delExpert",
            type:"get",
            data:{
                expertId:id
            },
            dataType:"json",
            success:function(data){
                if(data){
                    $(obj).parents(".body-con-3").fadeOut(1000);
                }
            }

        })
    }
</script>
</body>
</html>