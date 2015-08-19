<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/28
  Time: 15:22
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
    <title>我的预约</title>
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
                    pageContext.getOut().print("<a class=\"top-l1\" href=\"/pc/user/view\">"+user.getUsername()+"</a>");
                }else {
                    pageContext.getOut().print("<a class=\"top-l1\" href=\"/pc/login\">登录</a>");
                }
            %>
            <i>|</i>
            <a class="top-l2" href="/pc/enroll">免费注册</a>
        </div>
        <div class=" top-r fr">
            <a href="#">切换角色</a><i>|</i>
            <a href="/pc/favorite/listExpert">我的收藏</a><i>|</i>
            <a href="/pc/purchaseOrder/myOrders">我的订单</a><i>|</i>
            <a class="top-r1" href="/pc/user/view">个人中心</a><i>|</i>
            <a href="j_spring_security_logout">退出</a>

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
                <zjh:status name="major" dataType="ExpertServe.major" type="list" checkedValue="" onclick="/pc/requirement/pageList?type='train'&major="></zjh:status>

            </ul>
            <ul class="">
                <zjh:status name="type" dataType="Activity.type" type="list" checkedValue="" onclick="/pc/activity/pageList?type="></zjh:status>

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
    <div class="wrap-mr">
        <!-- 购物车部分 -->
        <div class="mr-title">
            <div class="mr-title-l">
                <span>全部预约</span>&nbsp;&nbsp;<span>(${purchaseGuide.purchaseOrderList.size()})</span>
            </div>
            <div class="mr-a-header-r">
                <div class="mr-a-header-r-wapper">
                    <div class="mr-a-header-r-rectangle mr-a-header-r-c2"></div>
                    <div class="mr-a-header-r-circular mr-a-header-r-c2">1</div>
                    <div class="mr-a-header-r-wz mr-a-header-r-wz-c2">1.我的预约</div>
                </div>
                <div class="mr-a-header-r-wapper">
                    <div class="mr-a-header-r-rectangle "></div>
                    <div class="mr-a-header-r-circular ">2</div>
                    <div class="mr-a-header-r-wz ">2.填写并核对</div>
                </div>
                <div class="mr-a-header-r-wapper">
                    <div class="mr-a-header-r-rectangle"></div>
                    <div class="mr-a-header-r-circular">3</div>
                    <div class="mr-a-header-r-wz">3.成功提交</div>
                </div>
            </div>
        </div>

        <ul class="guide">
            <c:forEach items="${purchaseGuide.purchaseOrderList}" var="purchaseOrder">

            <li class="mr1 mr2"><span>${purchaseOrder.serveDatetime}</span>&nbsp;&nbsp;&nbsp;&nbsp;</li>
            <li>
                <div class="mr-con-1">
                    <img src="http://pic.591zjh.com/head/icfi675s0000k8qw/20120713233445_LRXj2_thumb_600_0.jpg@!personal-list" alt="我的订单中人物">
                </div>
                <div class="mr-con-2">
                    <div class="mr-con-2-0">
                        <div class="mr-con-2-0-1">
                            <span>${purchaseOrder.expert.name}</span>
                        </div>
                        <div class="mr-con-2-0-2">类别:<zjh:status name="serveType" dataType="ExpertServe.serveType" type="normal" checkedValue="${purchaseOrder.ptype}"></zjh:status> </div>

                    </div>
                    <div class="mr-con-2-1">
                        <div class="mr-con-2-1-1">
                            <span>服务:</span>
                            <span>${purchaseOrder.expertServe.name} - ${purchaseOrder.total}元/天</span>
                            <span>服务时间:</span>
                            <span>${purchaseOrder.serveDatetime}</span>
                            <span><zjh:status name="dayType" dataType="PurchaseOrder.dayType" type="normal" checkedValue="${purchaseOrder.dayType}"></zjh:status> </span>
                        </div>
                    </div>
                </div>
                <div class="mr-con-3">
						<span class="mr-con-3-1">
							<a href="#" onclick="removeServe('${purchaseOrder.expertServe.id}',this)">删除</a>
						</span>
                </div>
            </li>
            </c:forEach>

        </ul>
        <div class="mr-con4">
            <div class="mr-con4-1">
                <span class="mr-con4-1-1">应付金额:${purchaseGuide.total}元 | <a href="/pc/expertServe/pageList">继续逛逛</a></span>
                <a href="/pc/purchaseGuide/sure">结算</a>
            </div>
        </div>
        <div class="mr-con5">
            <div class="mr-con5-nav">
                <div class="mr-con5-nav-left">
                    推荐专家
                </div>
                <div class="mr-con5-nav-right">
                    <a href="/pc/expertServe/pageList">更多&gt;</a>
                </div>
            </div>
            <c:forEach items="${experts}" var="expert">
                <div class="mr-con5-sub">
                    <a href="/pc/expert/viewExpert">
                        <div class="cover">
                            <p>简介:${expert.introduce}</p>
                        </div>
                        <img src="http://pic.591zjh.com/${expert.pictureUrl}@!personal-list" alt="人物简介">
                    </a><br />
                    <span class="text1">${expert.name}</span><br />
                    <span class="text3">${expert.chief}</span><br />
                    <span class="text4">${expert.province.name}</span>
                </div>
            </c:forEach>

        </div>
    </div>
    <div class="clear"></div>
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

<!-- jiathis插件侧边栏 -->
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
<script type="text/javascript">
    function removeServe(serveId,obj){
        $.ajax({
            url:"/pc/purchaseGuide/delete",
            type:"get",
            data:{
                serveId:serveId
            },
            dataType:"json",
            success:function(data){
                if(data){
                    $(obj).parents(".guide").fadeOut(2000);
                    location.reload();
                }
            }

        })
    }
</script>
</body>
</html>