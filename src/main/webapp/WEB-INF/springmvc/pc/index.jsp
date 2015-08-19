<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <title>首页</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/index.css">
    <script type="text/javascript" src="/scripts/jquery-1.8.0.min.js"></script><!-- 用于轮播 -->
    <script type="text/javascript" src="/scripts/zjh/zjh-index.js"></script>
    <script type="text/javascript" src="/scripts/zjh/zjh-public.js"></script>
    <script type="text/javascript">
        function autoScroll(obj){
            $(obj).find("ul li:first-child a div").css('color','transparent');
            $(obj).find("ul").animate({
                marginTop : "-39px"
            },500,function(){
                $(this).css({marginTop : "0px"}).find("li:first-child").appendTo(this).find("a div").css("color","#666");
            })
        }
        $(function(){
            //动态表格 万云 2015.08.11(改)
            var moveAndScroll1 = setInterval('autoScroll(".maquee1")',3000);
            $('.maquee1').mouseover(function(){
                clearInterval(moveAndScroll1);
            });
            $('.maquee1').mouseout(function(){
                clearInterval(moveAndScroll1);
                moveAndScroll1 = setInterval('autoScroll(".maquee1")',3000);
            });

            var moveAndScroll2 = setInterval('autoScroll(".maquee2")',3000);
            $('.maquee2').mouseover(function(){
                clearInterval(moveAndScroll2);
            });
            $('.maquee2').mouseout(function(){
                clearInterval(moveAndScroll2);
                moveAndScroll2 = setInterval('autoScroll(".maquee2")',3000);
            });
        })
    </script>
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
<div class="wrap0">
<!-- 侧边栏部分 -->
<div class="contentTop">
<div class="leftMenu">
<ul>
<c:forEach items="${majorTypes}" var="major" begin="0" end="7">
<li class="lMenuElem">
    <div class="lMenuElemView">
        <a class="lMenuElemTitle" href="/pc/expertServe/pageList?serveType=train&major=${major.name}">${major.label}</a>
			          			<span class="lMenuElemImp">
                                    <c:forEach items="${major.courseTypes}" var="course" begin="0" end="1">
			            			<a href="/pc/expertServe/pageList?serveType=train&major=${major.name}&courseType=${course.name}">${course.label}</a>
                                    </c:forEach>
    			      			</span>
    </div>
    <ul class = "lMenuElemContent">
        <c:forEach items="${major.courseTypes}" var="course">
            <li><a href="/pc/expertServe/pageList?serveType=train&major=${major.name}&courseType=${course.name}">${course.label}</a></li>
        </c:forEach>
    </ul>
</li>
</c:forEach>
    <c:forEach items="${majorTypes}" var="major" begin="8" end="9">
        <li class="lMenuElem Telescopic">
            <div class="lMenuElemView">
                <a class="lMenuElemTitle" href="/pc/expertServe/pageList?serveType=train&major=${major.name}">${major.label}</a>
			          			<span class="lMenuElemImp">
                                    <c:forEach items="${major.courseTypes}" var="course" begin="0" end="1">
                                        <a href="/pc/expertServe/pageList?serveType=train&major=${major.name}&courseType=${course.name}">${course.label}</a>
                                    </c:forEach>
    			      			</span>
            </div>
            <ul class = "lMenuElemContent">
                <c:forEach items="${major.courseTypes}" var="course">
                    <li><a href="/pc/expertServe/pageList?serveType=train&major=${major.name}&courseType=${course.name}">${course.label}</a></li>
                </c:forEach>
            </ul>
        </li>
    </c:forEach>
</ul>
</div>
<!-- 轮播图部分 -->
<div id="showpic" class="showpic clear">
    <div id="list">
        <img src="/images/1.png" alt="3"/>
        <img src="/images/2.jpg" alt="1"/>
        <img src="/images/3.jpg" alt="2"/>
        <img src="/images/1.png" alt="3"/>
        <img src="/images/2.jpg" alt="3"/>
        <img src="/images/3.jpg" alt="3"/>
    </div>
    <div id="buttons">
        <span index="1" class="on"></span>
        <span index="2"></span>
        <span index="3"></span>
    </div>
    <a href="javascript:;" id="prev" class="arrow">&lt;</a>
    <a href="javascript:;" id="next" class="arrow">&gt;</a>
</div>
</div>

<!-- 栏目1部分 -->
<div class="column clear" style="margin-top:50px;">
    <div class="column-sub">
        <img src="/images/phone.png" alt="服务" class="imgScale" >
        <br />
        <span>服务</span>
        <p>人工客服为您快速精准匹配专家服务， 并解决您遇到的各类问题。</p>
    </div>
    <div class="column-sub">
        <img src="/images/safe.png" alt="安全" class="imgScale" >
        <br />
        <span>安全</span>
        <p>平台托管费用，专家服务后确认付款，保证资金安全。</p>
    </div>
    <div class="column-sub">
        <img src="/images/baomi.png" alt="保密" class="imgScale" >
        <br />
        <span>保密</span>
        <p>采用阿里云平台，保证专家与用户的隐私</p>
    </div>
    <div class="column-sub">
        <img src="/images/zhuangye.png" alt="专业" class="imgScale" >
        <br />
        <span>专业</span>
        <p>专拥有独立数据测评系统，保证专家专业可信度。</p>
    </div>
</div>
<!-- 栏目2部分 -->
<!-- 栏目2部分 -->
<div class="column2">
    <div class="column2-nav">
        <div class="column2-left">
            <dl>
                <dt><a href="#">热门专家</a></dt>
                <dd><a href="#">中层管理</a></dd>
                <dd><a href="#">互联网</a></dd>
                <dd><a href="#">项目管理</a></dd>
                <dd><a href="#">研发管理</a></dd>
            </dl>
        </div>
        <div class="column2-right fr">
            <a href="/pc/expertServe/pageList">更多&gt;</a>
        </div>
    </div>
    <c:forEach items="${popularExperts}" var="expert">
    <div class="column2-sub">
        <a href="/pc/expert/viewExpert?expertId=${expert.id}">
            <div class="cover">
                <p>简介:${expert.introduce}</p>
            </div>

            <img src="http://pic.591zjh.com/${expert.pictureUrl}" alt="人物简介">
        </a><br />
        <span class="text1">${expert.name}</span><br />
        <span class="text3">${expert.chief}</span><br />
        <span class="text4">${expert.province.name}</span>
    </div>
    </c:forEach>
</div>
<!-- 栏目3部分:一会要把2修改 -->
<div class="column2">
    <div class="column2-nav column3-nav">
        <div class="column2-left column3-left">
            <dl>
                <dt><a href="#">热门助理</a></dt>
                <dd><a href="#">中层管理</a></dd>
                <dd><a href="#">互联网</a></dd>
                <dd><a href="#">项目管理</a></dd>
                <dd><a href="#">研发管理</a></dd>
            </dl>
        </div>
        <div class="column2-right fr">
            <a href="/pc/assistant/pageList">更多&gt;</a>
        </div>
    </div>
    <c:forEach items="${assistants}" var="assistant">
    <div class="column2-sub">
        <a href="#">
            <div class="cover2">
                <p>简介:${assistant.introduce}</p>
            </div>
            <img src="http://pic.591zjh.com/${assistant.pictureUrl}" alt="人物简介">
        </a><br />
        <span class="text1">${assistant.name}</span><br />
        <span class="text4">${assistant.province.name}</span>
    </div>

    </c:forEach>
</div>

<!-- 栏目5部分 -->
<div class="newActivityAndDemand">

    <div class="newActivity">
        <ul class="newActivityTitle">
            <li>最新活动</li>
            <li class="maqueenlast"><a href="/pc/activity/pageList">更多&gt;</a></li>
        </ul>
        <div class="newActivityContent">
            <ul class="newActivityThead">
                <li>活动主题</li>
                <li>姓名</li>
                <li>地区</li>
                <li>费用</li>
                <li>发布时间</li>
            </ul>
            <div class="maquee1">
                <ul>
                    <c:forEach items="${activities}" var="activity">

                    <li>
                        <a href="/pc/activity/view?activityId=${activity.id}">
                        <div>${activity.name} </div>
                        <div>${activity.user.name}</div>
                        <div>${activity.province.name}</div>
                        <div><span class="maquee1-1">${activity.price}</span>元</div>
                        <div><fmt:formatDate value="${activity.activityDate}" pattern="yyyy-MM-dd"></fmt:formatDate> </div>
                        </a>
                    </li>


                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <!-- 栏目4部分 -->
    <div class="newDemand">
        <ul class="newDemandTitle">
            <li>最新需求</li>
            <li class="maqueenlast"><a href="/pc/requirement/pageList">更多&gt;</a></li>
        </ul>
        <div class="newDemandContent">
            <ul class="newDemandThead">
                <li>需求标题</li>
                <li>姓名</li>
                <li>地区</li>
                <li>预算</li>
                <li>发布时间</li>
            </ul>
            <div class="maquee2">
                <ul>
                    <c:forEach items="${requirements}" var="requirement">
                    <li>
                        <a href="/pc/requirement/view?requirementId=${requirement.id}">

                        <div>${requirement.name}</div>
                        <div>${requirement.expert.name}</div>
                        <div>${requirement.province.name}</div>
                        <div><span class="maquee2-1">${requirement.price}</span>元</div>
                        <div><fmt:formatDate value="${requirement.startDatetime}" pattern="yyyy-MM-dd"></fmt:formatDate></div>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>

</div>

<!-- 栏目6部分 -->
<div class="column6" style="clear:both;">
    <div class="column6-title">
        <span>最新入驻</span>
    </div>
    <div id="outer" class="column6-content clear">
        <ul id="inner" class="column6-content-1">
            <c:forEach items="${experts}" var="expert">
            <li>
                <a href="/pc/expert/viewExpert?expertId=${expert.id}">
                    <dl>
                        <dt>
                            <img src="http://pic.591zjh.com/${expert.pictureUrl}_80w_80h" alt="最新入驻人物">
                        </dt>
                        <dd class="text1">${expert.name}</dd>
                        <dd class="text3">教龄:${expert.workTime}年</dd>
                        <dd class="text4"><span>${expert.province.name}</span></dd>
                    </dl>
                </a>
            </li>
            </c:forEach>
        </ul>
    </div>
    <!-- 按钮用时激活 -->
    <!-- <span id="btnLeft" class="btnLeft"></span>
    <span id="btnRight" class="btnRight"></span> -->
</div>
<!-- 栏目7部分 -->
<div class="column7 clear">
    <div class="column7-title">
        <span>成功案例</span>
    </div>
    <div class="column7-content">
					<span>
						<img src="/images/xiaoning.png" alt="肖宁">
					</span>
        <p>我们参加了专家汇的创业分享沙龙，分享后就有了几个有优质的投资机构主动联系我们了。感谢专家汇！</p><!-- <br /> -->
        <span class="name">肖宁</span>
    </div>
    <div class="column7-content">
					<span>
						<img src="/images/dengbo.png" alt="邓博">
					</span>
        <p>在专家汇组织的活动上与海通证券科技部的王总结交流，有幸成为合作伙伴，让云测成为海通证券移动客户端的测试服务商。</p>
        <span class="name">邓博</span>
    </div>
    <div class="column7-content">
					<span>
						<img src="/images/xiaopeng.png" alt="肖鹏">
					</span>
        <p>专家汇为我们搭建的平台，让我们认识了更多朋友,拓宽视野，丰富知识，也发现更多志同道合的朋友和事业伙伴。</p>
        <span class="name">肖鹏</span>
    </div>
    <div class="column7-content">
					<span>
						<img src="/images/yuanxiaofei.png" alt="袁小飞">
					</span>
        <p>我在专家汇的活动现场与其他嘉宾分享，反响很好，当天就达成1000套“云子”产品的销售订单感谢专家汇分享平台。</p>
        <span class="name">袁小飞</span>
    </div>
</div>
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
</body>
</html>