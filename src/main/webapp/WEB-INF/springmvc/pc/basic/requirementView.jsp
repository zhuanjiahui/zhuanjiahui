<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/28
  Time: 8:30
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
    <title>需求详细</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/index.css">
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
    <div class="customerPhotoBackground">
        <div class="customerPhoto"></div>
        <div class="customerName">${requirement.expert.name}</div>
    </div>
    <table class="customerNeedInfo">
        <tr>
            <td width="22%" style="font-size:20px;font-weight:bold;">${requirement.name}</td>
            <td width="22%">需求类型:<span><zjh:status name="type" dataType="Requirement.type" type="normal" checkedValue="${requirement.type}"></zjh:status> </span></td>
            <td width="31%">期望目标:<span>${requirement.memo}</span></td>
            <td width="25%">联系人:<span>${requirement.linkman}</span></td>
        </tr>
        <tr>
                <td>启动时间:<span><fmt:formatDate value="${requirement.startDatetime}" pattern="yyyy-MM-dd"></fmt:formatDate> </span></td>
                <td>行业:<span><zjh:status name="industry" dataType="ExpertServe.industry" type="normal" checkedValue="${requirement.industry}"></zjh:status> </span></td>
                <td>预算金额:￥<span>${requirement.price}</span>元</td>
                <td>联系电话:<span>${requirement.telephone}</span></td>
        </tr>
        <tr>
            <td>地点:<span>${requirement.province.name}${requirement.address}</span></td>
            <td>类似项目:<span>${requirement.itemsName}${requirement.itemsUrl}</span></td>
            <td></td>
        </tr>
    </table>
    <ul class="needDetail">
        <li>需求描述:</li>
        <li style="width:666px;">${requirement.introduce}</li>
        <li></li>
    </ul>
    <p class="popularityValue">人气:<span>90</span></p>
    <div class="screeningResultsAndRight-1">
        <!-- 右侧栏 -->
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
        <!-- 评论区 -->
        <div class="commentArea">
            <ul class="commentAreaTop">
                <li>全部(<span>${requirement.requirementDiscussList.size()}</span>)</li>
<%--
                <li>点赞&nbsp;+&nbsp;<span>11</span></li>
--%>
                <li class="last">我要评论<li>
            </ul>
            <c:forEach items="${requirement.requirementDiscussList}" var="requirementDiscuss">
            <ul class="commentElem">
                <li>
                    <img src="http://pic.591zjh.com/${requirementDiscuss.consumer2.pictureUrl}_90w" class="commentElemPhoto"/>
                    <img src="/images/smile-icon.png" class="commentElemFeeling"/>
                    <p class="commentElemText">${requirementDiscuss.content}</p>
                    <p class="commentElemTime"><fmt:formatDate value="${requirementDiscuss.createDatetime}" pattern="yyyy-MM-dd"></fmt:formatDate> </p>
                    <p class="commenElemName">${requirementDiscuss.consumer2.name}</p>
                </li>
            </ul>
            </c:forEach>
            <!-- 页码部分 -->
            <div class="page-normal">
                <ul class="page-ul">
                </ul>
            </div>
            <!-- 讨论板 -->
            <div class="commentBoard">
                <form id="discuss" name="requirementDiscuss" method="post">
                <input type="hidden" name="requirementId" value="${requirement.id}">
                <textarea id="commentBox" name="content" size="256" placeholder="在此发表您的评论..."></textarea>
                <div class="submitComment">
                    <a href="#commentBox" class="editContinue"><img src="/images/edit.png"></a>
                    <span class="submitText" onclick="submitForm()">提交评论</span>
                </div>
                </form>
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
    function submitForm(){
        $.ajax({
            url:"/pc/requirement/saveDiscuss",
            type:"post",
            data:$("#discuss").serialize(),
            dataType:"json",
            success:function(data){
                if(data){
                    location.reload();
                }
            }

        })
    }
</script>
</body>
</html>