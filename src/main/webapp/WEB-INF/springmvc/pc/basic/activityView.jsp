<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/21
  Time: 14:46
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
    <title>活动详情</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/index.css">
    <script src="/scripts/jquery-1.8.0.min.js"></script>
    <script src="/scripts/api"></script>
    <script src="/scripts/zjh/MarkerTool_min.js"></script>
    <script src="/scripts/zjh/CityList_min.js"></script>
    <script type="text/javascript" src="/scripts/zjh/zjh-public.js"></script>
    <!-- 地图API -->
    <script>
        $(function(){
            show();
        });
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
<!-- banner图部分 -->
<div class="bannerpic clear">
    <img src="http://pic.591zjh.com/${activity.activityPicUrl}@_1200w_377h" alt="banner图"/>
</div>
<div class="wrap">
    <!-- 活动栏目1部分 -->
    <div class="huodong1-column clear">
        <div class="huodong1-column1">
            <div class="column1-1">
                <div class="column1-1-title">
                    <span class="title-l"><a href="#">${activity.name}</a></span>
                    <span class="title-r"><zjh:status name="type" dataType="Activity.type" type="normal" checkedValue="${activity.type}"></zjh:status> </span>
                </div>
                <p>${activity.introduce}</p>
            </div>
            <div class="column1-2">
                <div class="column1-2-1">
                    ${activity.realCount}/${activity.userNumber} 人
                </div>
                <div class="column1-2-2">
                    人气:${activity.visitCount}
                </div>
                <div class="column1-2-3">
                    出席专家
                </div>
            </div>
            <div class="column1-3">
                <div>报名费用:${activity.price}元</div>
                <div>
                    <a href="#" onclick="joinActivity('${activity.id}')">立即报名</a>
                </div>
            </div>
        </div>
        <div class="huodong1-column2">
            <div class="column2-2">
                <span class="column2-2-1">时间</span>
                <p>${activity.activityDate}</p>
            </div>
            <div class="column2-2">
                <span class="column2-2-1 column2-2-2">地点</span>
                <p>${activity.province.name}${activity.address}</p>
            </div>
            <!-- 地图接口处 -->
            <!-- <div class="location-api">

            </div> -->
            <div class="location-api" id="drag">
                <div class="content-1">
                    <div id="container"></div>
                    <div id="allmap" style="width:300px;height:170px;"></div>
                    <div>
                        <input type="hidden" id="lat"><input type="hidden" id="lng">
                    </div>
                </div>
            </div>


        </div>
        <div class="huodong1-column3">
            <c:forEach items="${activity.activityGuests}" var="activityGuest">
            <div class="column3-1">
                <img src="http://pic.591zjh.com/${activityGuest.pictureUrl}@_190w_190h" alt="出席专家">
                <span class="column3-1-1">${activityGuest.name}&nbsp;&nbsp;${activityGuest.position}</span>
                <p>${activityGuest.introduce}</p>
            </div>
            </c:forEach>

        </div>
        <div class="huodong1-column4">
            <div class="column4-1">
                <div class="column4-1-1">
                    全部（${activity.activityDiscussList.size()}）
                </div>
                <div class="column4-1-2">
<%--
                    <span class="column4-1-2-1">点赞<i>+11</i></span>
--%>
                <a href="#commentBox"><span class="column4-1-2-1 column4-1-2-2"> 我要讨论</span></a>
                </div>
            </div>
            <c:forEach items="${activity.activityDiscussList}" var="activityDiscuss">
            <div class="column4-2">
                <div class="column4-2-1">
                    <img src="http://pic.591zjh.com/${activityDiscuss.consumer2.pictureUrl}@_90w_90h" alt="bbs人物">
                    <span>${activityDiscuss.consumer2.name}</span>
                </div>
                <div class="column4-2-2">
                    <p class="column4-2-2-1"><br />${activityDiscuss.content}</p>
                    <span class="column4-2-2-2"><fmt:formatDate value="${activityDiscuss.createDatetime}" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate> </span>
                </div>
            </div>
            </c:forEach>

            <!-- 页码部分 -->
            <div class="page-normal">
                <ul class="page-ul">
                 <%--   <zjh:pageList bean="${pageEntity}" url=""></zjh:pageList>--%>
                </ul>
            </div>

            <!-- 讨论板 -->
            <div class="commentBoard">
                <form id="discuss" name="activityDiscuss" action="" method="post">
                    <input name="activityId" type="hidden" value="${activity.id}">
                    <textarea id="commentBox" name="content" placeholder="在此发表您的评论..."></textarea>
                    <div class="submitComment">
                        <a href="#commentBox" class="editContinue"><img src="/images/edit.png"></a>
                        <span class="submitText" onclick="submitForm();">提交评论</span>
                    </div>
                </form>
            </div>

        </div>
        <div class="huodong1-column5">
            <dl>
                <dt><a href="#">常见问题</a></dt>
                <dd><a href="#">1、专家汇平台是否会收取职....</a></dd>
                <dd><a href="#">2、没有我想要学的类别怎么办？</a></dd>
                <dd><a href="#">3、如何搜索专家？</a></dd>
                <dd><a href="#">4、如何保证教师身份的真实性？</a></dd>
                <dd><a href="#">5、预约专家前是否要进行注册？</a></dd>
                <dd><a href="#">6、到预约时间没时间去该怎么办？</a></dd>
                <dd><a href="#">7、什么时候付费？要怎么付费？</a></dd>
                <dd><a href="#">8、风险保证金多久才能提取？</a></dd>
                <dd><a href="#">9、提现要扣手续费吗？扣多少？</a></dd>
                <dd><a href="#">10、提现要扣手续费吗？扣多少？</a></dd>
            </dl>
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
<!-- JiaThis Button END -->
<!-- 地图API -->
<script type="text/javascript">
    var marker, oDrag = document.getElementById("drag");
    var map = new BMap.Map("allmap");
    map.enableScrollWheelZoom(true);
    map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT}));    // 右下比例尺
    map.setDefaultCursor("Crosshair");   //鼠标样式
    // map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT}));  //右上角，仅包含平移和缩放按钮
    var cityList = new BMapLib.CityList({
        container: 'container',
        map: map
    });
    map.addEventListener("click", showInfo);
    function showInfo(e){
        map.clearOverlays();
        marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));  // 创建标注
        map.addOverlay(marker);
        //获取经纬度
        document.getElementById("lng").value = e.point.lng;
        document.getElementById("lat").value = e.point.lat;
    }

    function show(){
        map.setCurrentCity("北京");
        oDrag.style.display = "block";
    }
    function submitForm(){
        $.ajax({
            url:"/pc/activity/saveDiscuss",
            type:"post",
            data:$("#discuss").serialize(),
            dataType:"json",
            success:function(data){
                location.reload();
            }

        })
    }
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
