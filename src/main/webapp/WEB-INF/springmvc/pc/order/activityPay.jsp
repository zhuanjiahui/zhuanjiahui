<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/7
  Time: 13:57
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
    <title>订单详情</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/index.css">
    <script type="text/javascript" src="/scripts/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/scripts/zjh/zjh-public.js"></script>
</head>
<body>
<div id="wrap">
<jsp:include page="../header.jsp"></jsp:include>
<!-- content部分 -->
<div class="content  clear">
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
    <div class="wrap0">

        <!-- user-order-details -->
        <div class="uod-title">
            订单详情
        </div>
        <ul class="uod-ul">

            <%
                MyUser user=AuthorizationUtil.getMyUser();
                if(user.getUtype()==1){
            %>
            <li>
                <div class="uod-ul-1">
                    <span>活动信息</span>
                </div>
                <div class="uod-ul-2">

                        <span>${purchaseOrder.ac.name}</span>
                        <span>支付后显示联系方式</span>

                    <c:if test="${purchaseOrder.payStatus>1}">
                        <span>${purchaseOrder.expert2.name}</span>
                        <span>${purchaseOrder.expert2.phone}</span><span>${purchaseOrder.expert2.email}</span>
                    </c:if>
                    <span>${purchaseOrder.expert2.province.name}</span>
                </div>
            </li>
            <li>
                <div class="uod-ul-1">
                    <span>助理信息</span>
                </div>
                <div class="uod-ul-2"><span>${purchaseOrder.assistant.name}</span>
                    <c:if test="${purchaseOrder.payStatus==1}">
                        <span>支付后显示</span>
                    </c:if>
                    <c:if test="${purchaseOrder.payStatus>1}">
                        <span>${purchaseOrder.assistant.phone}</span><span>${purchaseOrder.assistant.email}</span>
                    </c:if>
                </div>
            </li>
            <%}else if(user.getUtype()>1){%>
            <li>
                <div class="uod-ul-1">
                    <span>联系人信息</span>
                </div>
                <div class="uod-ul-2">
                    <c:if test="${purchaseOrder.payStatus==1}">
                        <span>${purchaseOrder.consumer2.name}</span>
                        <span>支付后显示联系方式</span>
                    </c:if>
                    <c:if test="${purchaseOrder.payStatus>1}">
                        <span>${purchaseOrder.linkman}</span>
                        <span>${purchaseOrder.telephone}</span><span>${purchaseOrder.consumer2.email}</span>
                    </c:if>
                    <span>${purchaseOrder.linkAddress}</span>
                </div>
            </li>
            <li>
                <div class="uod-ul-1">
                    <span>助理信息</span>
                </div>
                <div class="uod-ul-2"><span>${purchaseOrder.assistant.name}</span>
                    <span>${purchaseOrder.assistant.phone}</span><span>${purchaseOrder.assistant.email}</span>
                </div>
            </li>
            <%}%>

            <li>
                <div class="uod-ul-1">
                    <span>订单信息</span>
                    <span class="uod-ul-1-1"><zjh:status name="payStatus" dataType="PurchaseOrder.payStatus" type="normal" checkedValue="${purchaseOrder.payStatus}"></zjh:status> </span>
                </div>
                <div class="uod-ul-3">
                    <span>订单编号:${purchaseOrder.serial}</span>
                    <span>生成时间:<fmt:formatDate value="${purchaseOrder.createDatetime}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate> </span>
                </div>
                <div class="uod-ul-4">
                    <span>订单状态:<zjh:status name="processStatus" dataType="PurchaseOrder.processStatus" type="normal" checkedValue="${purchaseOrder.processStatus}"></zjh:status></span>
                </div>
            </li>
            <li class="uod-position">
                <div class="uod-ul-1">
                    <span>服务信息</span>
                </div>
                <div class="uod-ul-5">
                    <dl>
                        <dt>
                            <img src="http://pic.591zjh.com/${purchaseOrder.expert2.pictureUrl}" alt="订单页专家信息">
                        </dt>
                        <dd class="uod-ul-5-1">${purchaseOrder.expert2.name}</dd>
                        <dd>类别:<zjh:status name="serveType" dataType="ExpertServe.serveType" type="normal" checkedValue="${purchaseOrder.expertServe.serveType}"></zjh:status> </dd>
                        <dd>
                            <span>行业:<zjh:status name="industry" dataType="ExpertServe.industry" type="normal" checkedValue="${purchaseOrder.expertServe.industry}"></zjh:status> </span>
                        </dd>
                        <dd class="uod-ul-5-2">服务:<span>${purchaseOrder.expertServe.name}-${purchaseOrder.expertServe.price}元/天</span>
                            <span>服务时间:<fmt:formatDate value="${purchaseOrder.serveDatetime}" pattern="yyyy-MM-dd"></fmt:formatDate> </span>
                            <span><zjh:status name="dayType" dataType="PurchaseOrder.dayType" type="normal" checkedValue="${purchaseOrder.dayType}"></zjh:status> </span>
                        </dd>

                    </dl>
                </div>
                <div class="uod-ul-6">
						<span>应付金额:
							<i>${purchaseOrder.total}元</i>
						</span>
                </div>
            </li>
            <li>
                <div class="uod-ul-7">
                    <span>订单备注:</span>
                    <span>${purchaseOrder.memo}</span>
                </div>
                <div class="uod-ul-8">
                    <span class="uod-ul-8-1">已支付:
                        <c:if test="${purchaseOrder.payStatus==1}"><i>0元</i></c:if>
                        <c:if test="${purchaseOrder.payStatus==2}"><i>${purchaseOrder.total*0.5}元</i></c:if>
                        <c:if test="${purchaseOrder.payStatus==3}"><i>${purchaseOrder.total}元</i></c:if>
                    </span>
                    <%--
                                        <a class="uod-ul-8-2" href="javascript:history.back();">返 回</a>
                    --%>
                </div>

            </li>
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