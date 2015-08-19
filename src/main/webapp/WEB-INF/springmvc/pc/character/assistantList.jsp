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
						<input type="text" name="words" value="" placeholder="请输入专家姓名" class="mainSearchBox">
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
    <div class="guild fl">
        <div class="guild-sub fl">
            <a href="/pc/requirement/publish">
                <img src="/images/xuqiu.png" alt="发布需求">
                <br />
                <span>发布需求</span>
            </a>
        </div>
        <div class="guild-sub">
            <a href="/pc/activity/publish">
                <img src="/images/huodong.png" alt="发布活动">
                <br />
                <span>发布活动</span>
            </a>
        </div>
    </div>
</div>
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
                <div class="footer-ul1-con biancu">010-59505007</div>
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

<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
</body>
</html>