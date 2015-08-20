<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ page import="com.frame.organization.model.MyUser" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/23
  Time: 15:00
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
    <title>需求查询</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/index.css">
    <script src="/scripts/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/scripts/zjh/zjh-public.js"></script>
    <script type="text/javascript" src="/scripts/zjh/zjh-shuaixuan.js"></script>
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
        <%--
            <p class="city"><span>所有分类&nbsp;>&nbsp;</span><span>北京</span><span>切换城市</span></p>
        --%>
        <ul class="screening">
            <ul class="screening-1">
                <li class="screeningTitle">需求类别:</li>
                <li><a href="/pc/requirement/pageList">全部</a> </li>
                <zjh:status name="type" dataType="Requirement.type" type="list" checkedValue="${type}" onclick="/pc/requirement/pageList?type="></zjh:status>
            </ul>
            <ul class="screening-1">
                <li class="screeningTitle">行业类别:</li>
                <li><a href="/pc/requirement/pageList?type=${type}">全部</a> </li>
                <zjh:status name="industry" dataType="ExpertServe.industry" type="list" checkedValue="${industry}" onclick="/pc/requirement/pageList?type=${type}&industry="></zjh:status>
            </ul>
            <c:if test="${type=='train'||type=='consult'}">
                <ul class="screening-1">
                    <li class="screeningTitle">专业类型:</li>
                    <li><a href="/pc/requirement/pageList?type=${type}&industry=${industry}">全部</a> </li>
                    <zjh:status name="major" dataType="ExpertServe.major" type="list" checkedValue="${major}" onclick="/pc/requirement/pageList?type=${type}&industry=${industry}&major="></zjh:status>
                </ul>
                <c:if test="${!empty courseTypes&&type=='train'}">
                    <ul class="screening-1">

                        <li class="screeningTitle">课程类型:</li>
                        <li><a href="/pc/expertServe/pageList?industry=${industry}&major=${major}&type=train">全部</a> </li>
                        <c:forEach items="${courseTypes}" var="course">
                            <c:if test="${course.name==courseType}">
                                <li><a   class="screeningChioce" href="/pc/requirement/pageList?industry=${industry}&major=${major}&courseType=${course.name}&type=train">${course.label}</a> </li>
                            </c:if>
                            <c:if test="${course.name!=courseType}">
                                <li><a href="/pc/requirement/pageList?industry=${industry}&major=${major}&courseType=${course.name}&type=train">${course.label}</a> </li>
                            </c:if>
                        </c:forEach>
                    </ul>

                </c:if>
            </c:if>
            <c:if test="${type=='development'}">
                <ul class="screening-1">
                    <li class="screeningTitle">擅长类型:</li>
                    <li><a href="/pc/requirement/pageList?type=development&industry=${industry}">全部</a> </li>
                    <zjh:status name="developType" dataType="ExpertServe.developType" type="list" checkedValue="${developType}" onclick="/pc/requirement/pageList?type=development&industry=${industry}&developType="></zjh:status>
                </ul>
            </c:if>
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
                    <li><a href="#" class="sortingMethodChioce">默认排序</a></li>
                    <li><a>人气</a></li>
                </ul>
            </li>
            <%-- <li>
                 <ul class="costRange">
                     <li>费用&nbsp;:</li>
                     <li><input type="text"></li>
                     <li style="padding:0 1px;color:#00bdff">-</li>
                     <li><input type="text"></li>
                 </ul>
             </li>--%>
        </ul>
        <div class="resultsBody">
            <ul>
                <c:forEach items="${pageInfo.list}" var="requirement">
                    <li class="resultsList">
                        <ul class="resultsElemTop">
                            <li class="resultsElemTop-1">发布时间:${requirement.createDatetime}</li>
                            <li class="resultsElemTop-2">开始时间:${requirement.startDatetime}</li>
                        </ul>
                        <ul class="resultsElemMain">
                            <li class="resultsElemMain-1"><a href="/pc/requirement/view?requirementId=${requirement.id}">${requirement.name}</a> </li>
                            <li class="resultsElemMain-2">需求类型:<span style="color:#00bdff"><zjh:status name="type" dataType="Requirement.type" type="normal" checkedValue="${requirement.type}"></zjh:status> </span></li>
                            <li class="resultsElemMain-3"><zjh:status name="industry" dataType="Expertserve.industry" type="normal" checkedValue="${requirement.industry}"></zjh:status></li>
                            <li class="resultsElemMain-4" style="color:#f77530;">预算:￥<span>${requirement.price}</span>元</li>
                            <li class="resultsElemMain-5">地点:<span>${requirement.address}</span></li>
                            <li class="resultsElemMain-5 last"><span>${requirement.expert.name}</span></li>
                        </ul>
                    </li>
                </c:forEach>

            </ul>

            <!-- 页码部分 -->
            <div class="page-normal">
                <ul class="page-ul">
                    <zjh:pageList bean="${pageEntity}" url="/pc/requirement/pageList">
                        <zjh:pageParam name="type" value="${type}"></zjh:pageParam>
                        <zjh:pageParam name="industry" value="${industry}"></zjh:pageParam>
                    </zjh:pageList>
                </ul>
            </div>

        </div>
    </div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</div>



<!-- jiathis插件侧边栏 -->
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
<script>
    $(function(){
        $(".resultsList :even").css("background","#B3CFE7");
    })
</script>
</body>
</html>