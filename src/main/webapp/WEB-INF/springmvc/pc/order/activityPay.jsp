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
<!-- top顶部 -->
<div class="top">
    <div class="top-sub">
        <div class=" top-l fl">
            <% MyUser user= AuthorizationUtil.getMyUser();
                if(user!=null&&user.getUsername()!=null){
                    pageContext.getOut().print("<a class=\"top-l1\" href=\"/pc/user/view\">"+user.getNavName()+"</a>");
                }else {
                    pageContext.getOut().print("<a class=\"top-l1\" href=\"/pc/login\">登录</a>");
                }
            %>
            <i>|</i>
            <a class="top-l2" href="/pc/enroll">免费注册</a>
        </div>
        <div class=" top-r fr">
            <%
                if(user!=null&&user.getUtype()!=null) {
                    if (user.getUtype() == 1) {
                        pageContext.getOut().print("<a href=\"/pc/switchUser\">切换至专家</a><i>|</i>");
                    } else if (user != null && user.getUtype() == 2) {
                        pageContext.getOut().print("<a href=\"/pc/switchUser\">切换至用户</a><i>|</i>");
                    }
                }
            %>
            <a href="/pc/favorite/listExpert">我的收藏</a><i>|</i>
            <a href="/pc/purchaseOrder/myOrders">我的订单</a><i>|</i>
            <a class="top-r1" href="/pc/user/view">个人中心</a>
            <%
                if(user!=null&&user.getUtype()!=null) {
                    pageContext.getOut().print("<i>|</i><a href=\"j_spring_security_logout\">退出</a>");
                }
            %>

        </div>
    </div>
</div>
<!-- header部分 -->
<div class="header clear">
    <div class="logo fl">
        <a href="/pc/index"><img src="/images/logo.png" alt="logo"></a>
    </div>
    <div class="text-border fl">
        <img src="/images/text-border.png" alt="text-border">
    </div>

    <!-- TAB切换效果 -->
    <div class="search fl">
        <div class="search-top clear"  id="tab-nav">
            <ul>
                <li class="select">专家</li>
                <li class="">需求</li>
                <li class="">活动</li>
            </ul>
        </div>
        <form action="/pc/expertServe/search" method="post">
            <div class="search-box">
					<span class="box1 fl">
						<input type="text" name="words" value="" placeholder="关键字、课程">
					</span>
					<span class="box2 fl">
						<input type="submit" value="搜 索">
					</span>
            </div>
        </form>
        <div class="search-bottom" id="tab_con">
            <ul class="show">
                <li><a href="/pc/expertServe/pageList?major=manage&courseType=zhcgljn&serveType=train">中层管理技能</a></li>
                <li><a href="/pc/expertServe/pageList?major=internet&courseType=hlwsw&serveType=train">互联网思维</a></li>
                <li><a href="/pc/expertServe/pageList?major=production&courseType=yfgl&serveType=train">研发管路</a></li>
                <li><a href="/pc/expertServe/pageList?major=leadership&courseType=xmgl&serveType=train">项目管理</a></li>
                <li><a href="/pc/expertServe/pageList?major=professionalism&courseType=gxgt&serveType=train">高效沟通</a></li>
            </ul>
            <ul class="">
                <li><a href="/pc/requirement/pageList?type=train&major=internet">互联网+</a></li>
                <li><a href="/pc/requirement/pageList?type=train&major=strategy">战略管理</a></li>
                <li><a href="/pc/requirement/pageList?type=train&major=manage">管理技能</a></li>
                <li><a href="/pc/requirement/pageList?type=train&major=hrm">人力资源</a></li>
                <li><a href="/pc/requirement/pageList?type=train&major=finance">财务管理</a></li>

            </ul>
            <ul class="">
                <li><a href="/pc/activity/pageList?type=1">专题培训</a></li>
                <li><a href="/pc/activity/pageList?type=2">行业趋势分享</a></li>
                <li><a href="/pc/activity/pageList?type=3">新产品试用</a></li>
                <li><a href="/pc/activity/pageList?type=4">创业分享沙龙</a></li>
                <li><a href="/pc/activity/pageList?type=5">项目路演</a></li>

            </ul>
        </div>
    </div>
</div>
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

            <% if(user.getUtype()==1){
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
<!-- 回到顶部 -->
<a href="javascript:;" id="btn" title="回到顶部"></a>
<!-- footer部分 -->
<div class="footer">
    <div class="footer-wrap">
        <ul class="footer-ul1">
            <li class="ul1-li1">
                <div class="footer-ul1-title">关于我们</div>
                <div class="footer-ul1-con"><a href="/pc/static/footer-know-us">了解我们</a></div>
                <div class="footer-ul1-con"><a href="/pc/static/footer-successful-case">成功案例</a></div>
                <div class="footer-ul1-con"><a href="/pc/static/footer-event-announcements">活动公告</a></div>
                <div class="footer-ul1-con"><a href="/pc/static/footer-website-terms">网站条款</a></div>
                <div class="footer-ul1-con"><a href="/pc/static/footer-join-us">加入我们</a></div>
                <div class="footer-ul1-con"><a href="/pc/static/footer-contact-us">联系我们</a></div>

            </li>
            <li class="ul1-li1">
                <div class="footer-ul1-title">帮助中心</div>
                <div class="footer-ul1-con"><a href="/pc/static/footer-platform-process">平台流程</a></div>
                <div class="footer-ul1-con"><a href="/pc/static/footer-expert-settled">专家入驻</a></div>
                <div class="footer-ul1-con"><a href="/pc/static/footer-user-help">用户帮助</a></div>
                <div class="footer-ul1-con"><a href="/pc/static/footer-assistant-help">助理帮助</a></div>
                <div class="footer-ul1-con"><a href="/pc/static/footer-expert-help">专家帮助</a></div>
            </li>
            <li class="ul1-li1">
                <div class="footer-ul1-title">服务支持</div>
                <div class="footer-ul1-con"><a href="/pc/static/footer-service-guarantee">服务保障</a></div>
                <div class="footer-ul1-con"><a href="/pc/static/footer-infringement-complaints">投诉侵权</a></div>
                <div class="footer-ul1-con"><a href="/pc/static/footer-feedback">意见反馈</a></div>
            </li>
            <li class="ul1-li3">
                <div class="footer-ul1-title">关注我们</div>
                <div class="footer-ul1-con">
                    <div class="ul1-con-pic">
                        <div class="ul1-con-pic1">
                            <a href="#">
                                <img class="ul1-con-pic1-1" src="/images/weixin.png" alt="ul1-con-pic">
                                <img class="ul1-con-pic1-2" src="/images/weixinh.png" alt="悬浮出现">
                                <div>微信公共号</div>
                            </a>
                        </div>
                        <div class="ul1-con-pic1">
                            <a href="#">
                                <img class="ul1-con-pic1-1" src="/images/sina.png" alt="ul1-con-pic">
                                <img class="ul1-con-pic1-2" src="/images/sinah.png" alt="悬浮出现">
                                <div>新浪微博</div>
                            </a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="ul1-li4">
                <div class="footer-ul1-title">客服热线</div>
                <div class="footer-ul1-con">（工作时间:08:00 - 23:00）</div>
                <div class="footer-ul1-con biancu">010-51591591</div>
            </li>
        </ul>
        <div class="footerpic">
            <img src="/images/footer-pic.png" alt="底部图片">
        </div>
        <div class="footer-bottom">

            <p>&copy;2011-2015&nbsp;&nbsp;专家汇&nbsp;&nbsp;All&nbsp;&nbsp;Rights&nbsp;&nbsp;Reserved&nbsp;&nbsp;北京语博信息科技有限公司&nbsp;&nbsp;&nbsp;&nbsp;京ICP备11001010号-7&nbsp;&nbsp;京公网安备&nbsp;&nbsp;11010702111111</p>
        </div>
    </div>
</div>
</div>

<!-- jiathis插件侧边栏 -->
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
</body>
</html>