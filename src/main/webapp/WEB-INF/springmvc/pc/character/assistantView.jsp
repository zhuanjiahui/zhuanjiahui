<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/12
  Time: 19:06
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

    <title>助理详细</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/index.css">
    <link rel="stylesheet" href="/theme/assistant.css">
    <script type="text/javascript" src="/scripts/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/scripts/zjh/zjh-public.js"></script>
</head>
<body>
<div id="wrap">
<jsp:include page="../header.jsp"></jsp:include>
<!-- content部分 -->
<div class="content content-1">
<!-- 导航部分 -->
<div class="nav">
    <ul>
        <li class="nav-1"><a href="/pc/expertServe/pageList">全部专家</a></li>
        <li><a href="/pc/index">首页</a></li>
        <li><a href="/pc/static/platform">平台流程</a></li>
        <li><a href="/pc/static/settled">专家入驻</a></li>
        <li><a href="/pc/requirement/pageList">寻找需求</a></li>
        <li><a href="/pc/activity/pageList">参加活动</a></li>
    </ul>
</div>
<!--助理资料-->
<div class="ad-photp-header">
    <div class="ad-photp-header-s"></div>
</div>
<div class="ad-table">
    <div class="ad-td ad-name">${assistant.name}</div>
    <div class="ad-td ad-phone">联系电话:<span>${assistant.phone}</span></div>
    <div class="ad-td ad-adress">地址:${assistant.province.name}</div>
    <div class="ad-td ad-zhuanjia">专家:${assistant.expertList.size()}位</div>
    <div class="ad-td ad-chengdan">成单量:${assistant.purchaseOrders.size()}</div>
    <div class="ad-td ad-renqi">人气:${assistant.visitCount}</div>
</div>



<div class="ad-xx-w">
    <div class="ad-xx"></div>
    <div class="ad-center">助理推荐</div>
    <div class="ad-xx"></div>
</div>



<div class="ad-xx-w">
    <div class="ad-xx"></div>
    <div class="ad-center">我的专家</div>
    <div class="ad-xx"></div>
</div>
<div class="ad-zllb-wapper1">
<c:forEach items="${pageInfo.list}" var="expert">
<div class="ad-zllb-wapper2">
    <a href="/pc/expert/viewExpert?expertId=${expert.id}">
        <div class="ad-zlxx-t">
            <div class="cover-11"></div>
            <img src="http://pic.591zjh.com/${expert.pictureUrl}" alt="dfs">
        </div>
    </a>
    <div class="ad-zlxx-b">
        <div class="ad-zlxx-b1">
            <div style="margin-left:20px;margin-top:5px;float:left;width:138px;">专家:${expert.name}</div>
        </div>
        <div class="ad-zlxx-b2">
            <div class="ad-zlxx-b2-l">
                <div>
                    <spa>${expert.chief}</spa>
                </div>
                <div style="margin-top:10px;">
                    <span>报价:</span>
                    <span style="color:#00bdff !important;">${expert.minPrice}-${expert.maxPrice}元</span>
                </div>
            </div>
            <div class="ad-zlxx-b2-r">
                <button><a href="/pc/expert/viewExpert?expertId=${expert.id}">查看详情</a></button>
            </div>
        </div>
    </div>
</div>
</c:forEach>

</div>


<div class="clear"></div>

<!-- 页码部分 -->
<div class="page-normal">
    <ul class="page-ul">
       <zjh:pageList bean="${pageEntity}" url="/pc/assistant/view"></zjh:pageList>
    </ul>
</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</div>

<!-- jiathis插件侧边栏 -->
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
</body>
</html>