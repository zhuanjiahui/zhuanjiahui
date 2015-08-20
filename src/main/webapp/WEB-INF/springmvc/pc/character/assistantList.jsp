<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/24
  Time: 14:49
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
    <title>助理查询</title>
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
<div class="content">
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

<!-- 筛选条件 -->
<div class="multiConditionScreening">
    <ul class="screening">
        <ul class="screening-3">
            <li class="screeningTitle">服务地区:</li>
            <li>全部</li>

            <li>更多</li>
        </ul>
    </ul>
</div>

<div class="screeningResultsAndRight">
<!-- 右侧栏 -->
<div class="bodyRight">
    <ul class="expertRecommendation">
        <li style="margin:15px 0;color:#00bdff;font-size:15px;font-weight:bold;text-indent:5px;">专家推荐</li>
        <c:forEach items="${listPageExperts}" var="expert">
        <li>
            <ul>
                <img src="http://pic.591zjh.com/${expert.pictureUrl}">
                <ul class="text">
                    <li>${expert.name}</li>
                    <li>工作${expert.workTime}年</li>
                    <li>${expert.chief}</li>
                    <li class="last">${expert.province.name}</li>
                </ul>
            </ul>
        </li>
       </c:forEach>

    </ul>
    <ul class="commonProblem">
        <li style="margin:5px 0;color:#333;font-size:15px;text-indent:5px;border-bottom:1px solid #e8e8e8;height:40px;line-height:40px;">常见问题</li>
        <li style="margin-top:20px;">1、专家汇平台是否会收取职...</li>
        <li>1、专家汇平台是否会收取职...</li>
        <li>1、专家汇平台是否会收取职...</li>
        <li>1、专家汇平台是否会收取职...</li>
        <li>1、专家汇平台是否会收取职...</li>
        <li>1、专家汇平台是否会收取职...</li>
        <li>1、专家汇平台是否会收取职...</li>
        <li>1、专家汇平台是否会收取职...</li>
        <li>1、专家汇平台是否会收取职...</li>
        <li>10、专家汇平台是否会收取职...</li>
    </ul>
</div>

<!-- 筛选结果 -->
<ul class="resultsTop">
    <li>
        <ul class="sortingMethod">
            <li>默认排序</li>
            <li>人气<img src="/images/aq-paixu.png"></li>
            <li>评论<img src="/images/aq-paixu.png"></li>
        </ul>
    </li>
</ul>
<div class="resultsBody">
    <c:forEach items="${pageInfo.list}" var="assistant">
    <div class="aq-zllb-wapper">
        <div class="aq-zllb-wapper-l">
            <div class="aq-zllb-wapper-l1">
                <div class="aq-zllb-wapper-l4"><a href="/pc/assistant/view?assistantId=${assistant.id}"><img src="http://pic.591zjh.com/${assistant.pictureUrl}"></a></div>
                <div class="aq-zllb-wapper-l5">
                    <div class="aq-zllb-wapper-l6">${assistant.name}</div>

                    <div class="aq-zllb-wapper-l8">地点:<span style="color:#00bdff;">${assistant.province.name}</span></div>
                </div>
            </div>
            <div class="aq-zllb-wapper-l2">
                人气指数:
                <img src="/images/star-pic.png">
                <img src="/images/star-pic.png">
                <img src="/images/star-pic.png">
                <img src="/images/star-pic.png">
                <img src="/images/star-pic.png">
            </div>
            <div class="aq-zllb-wapper-l3">人气${assistant.visitCount}&nbsp;共${assistant.expertList.size()}位专家</div>
        </div>

        <div class="aq-zllb-wapper-r">
            <c:forEach items="${assistant.expertList}" var="expert" begin="0" end="2">
            <div class="aq-zllb-wapper-r1">
                <div class="aq-zllb-img"><img src="http://pic.591zjh.com/${expert.pictureUrl}"></div>
                &nbsp;${expert.name}&nbsp;
            </div>
            </c:forEach>

        </div>
    </div>
    </c:forEach>

    <!-- 页码部分 -->
    <div class="page-normal">
        <ul class="page-ul">
           <zjh:pageList bean="${pageEntity}" url="/pc/assistant/pageList"></zjh:pageList>
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
</body>
</html>