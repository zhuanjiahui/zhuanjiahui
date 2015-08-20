<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/3
  Time: 12:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <title>活动查询</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/index.css">
    <script type="text/javascript" src="/scripts/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/scripts/zjh/zjh-shuaixuan.js"></script>
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
<%--
    <p class="city"><span>所有分类&nbsp;>&nbsp;</span><span>北京</span><span>切换城市</span></p>
--%>
    <ul class="screening">

        <ul class="screening-2">
            <li class="screeningTitle">类别:</li>
            <li><a href="/pc/activity/pageList">全部</a></li>
            <zjh:status name="type" dataType="Activity.type" type="list" checkedValue="${type}" onclick="/pc/activity/pageList?type="></zjh:status>
        </ul>

        <ul class="screening-2">
            <li class="screeningTitle">行业类别:</li>
            <li><a href="/pc/activity/pageList?type=${type}">全部</a> </li>
            <zjh:status name="industry" dataType="ExpertServe.industry" type="list" checkedValue="${industry}" onclick="/pc/activity/pageList?type=${type}&industry="></zjh:status>
        </ul>
    </ul>
</div>

<div class="screeningResultsAndRight">
<!-- 右侧栏 -->
<div class="bodyRight">
    <ul class="expertRecommendation">
        <li style="margin:15px 0;color:#00bdff;font-size:15px;font-weight:bold;text-indent:5px;">专家推荐</li>
        <c:forEach items="${homeExperts}" var="expert">
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
            <li  class="screeningChioce">默认排序</li>
            <li>人气</li>
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
<!-- 活动查询包裹 -->
<div class="wrap-aq">
<!-- 活动栏目1部分 -->
<c:forEach items="${pageInfo.list}" var="activity" begin="0" end="0">

<div class="query-column1">
    <div class="query-column1-0 fl">
        <div class="query-column1-0-1">
            <a href="/pc/activity/view?activityId=${activity.id}">
                <img src="http://pic.591zjh.com/${activity.activityPicUrl}@_360h_460w" alt="活动查询页专家">
            </a>
        </div>
        <div class="query-column1-0-2">
            <span>发起人:${activity.user.name}</span>
            <span>地&nbsp;&nbsp;点:${activity.province.name}&nbsp;${activity.address}</span>
            <span>时间:<fmt:formatDate value="${activity.activityDate}" pattern="yyyy-MM-dd"></fmt:formatDate> &nbsp;&nbsp;人气:99 </span>
        </div>
    </div>
    <div class="query-column1-1">
        <div class="query-column1-3-1">
            <span class="query-span1">活动主题</span>
            <span class="query-span2"><zjh:status name="type" dataType="Activity.type" type="normal" checkedValue="${activity.type}"></zjh:status></span>
            <p>${activity.introduce}</p>
        </div>
        <div class="query-column1-3-2">
            <span class="query-span3">已报名${activity.realCount}/${activity.userNumber}人</span>
            <span class="query-span4">${activity.price}元</span>
            <a href="#" onclick="joinActivity('${activity.id}')">参加活动</a>
        </div>
    </div>

</div>
</c:forEach>
<c:forEach items="${pageInfo.list}" var="activity" begin="1" end="11">

<!-- 有hover的部分 -->
<div class="query-column2">
    <div class="query-column2-1">
        <a href="/pc/activity/view?activityId=${activity.id}">
            <img src="http://pic.591zjh.com/${activity.activityPicUrl}@_190w" alt="活动查询ad图">
            <!-- hover部分 -->
							<span class="a-span">
								<span class="a-span1">${activity.activityDate}</span>
								<span class="a-span2">地点:${activity.province.name}</span>
								<span class="a-span3">人气:</span>
								<span class="a-span4">费用:${activity.price}元</span>
							</span>
        </a>


        <div class="query-column2-1-1">
            <span class="query2-span1">专家:${activity.user.name}</span>
            <span class="query2-span2">活动类型:<zjh:status name="type" dataType="Activity.type" type="normal" checkedValue="${activity.type}"></zjh:status> </span>
            <span class="query2-span3">${activity.introduce}</span>
            <span class="query2-span4">已报名${activity.realCount}/${activity.userNumber}人</span>
            <a href="#" onclick="joinActivity('${activity.id}')">参加活动</a>
        </div>
    </div>
</div>
</c:forEach>

<!-- 页码部分 -->
<div class="page-normal">
    <ul class="page-ul">
        <zjh:pageList bean="${pageEntity}" url="/pc/activity/pageList">
            <zjh:page-param name="type" value="${type}"></zjh:page-param>
            <zjh:page-param name="industry" value="${industry}"></zjh:page-param>
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
<script type="text/javascript">
    function joinActivity(id){
        $.ajax({
            url:"/pc/purchaseOrder/joinActivity",
            type:"post",
            data:{
                activityId:id
            },
            dataType:"json",
            success:function(data){

                if(data=="repeat"){
                    alert("您已报名,不能重复报名!");
                }else if(data=="full"){
                    alert("活动人员已满!");
                }else{
                    alert("报名成功!");
                }
            }

        })
    }
</script>
</body>
</html>