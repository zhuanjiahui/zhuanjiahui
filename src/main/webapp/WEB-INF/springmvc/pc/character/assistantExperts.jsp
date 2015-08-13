<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/30
  Time: 11:03
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
    <title>助理专家管理</title>
    <link href="/images/favicon.ico" rel="shortcut icon" />
    <link rel="stylesheet" href="/theme/reset.css">
    <link href="/theme/public-css-style.css" rel="stylesheet">
    <link href="/theme/main.css" rel="stylesheet">
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
                <zjh:status name="industry" dataType="ExpertServe.industry" type="list" checkedValue="" onclick="/pc/requirement/pageList?industry="></zjh:status>

            </ul>
            <ul class="">
                <zjh:status name="type" dataType="Activity.type" type="list" checkedValue="" onclick="/pc/activity/pageList?type="></zjh:status>

            </ul>
        </div>
    </div>
</div>
<!-- content部分 -->
<div class="content clear">
<!-- 导航部分 -->
<div class="nav">
    <ul>
        <li class="nav-1"><a href="/pc/index">首页</a></li>
        <li><a href="#">账号管理</a></li>
        <li><a href="/pc/user/view">个人中心</a></li>
        <li><a href="/pc/requirement/myPublish">我的需求</a></li>
        <li><a href="/pc/activity/myActivity">我的活动</a></li>
        <li><a href="#">消息</a></li>
    </ul>
</div>
<div class="content-sub">
    <div class="content-sub1">
        <div class="content-sub2"><img src="/images/order-bg2.png" alt="背景图文字部分"></div>
    </div>
</div>
<div id="wrap2">
<div class="content-sidebar fl">
    <dl>
        <dt><a href="/pc/assistant/viewPersonal">基本资料</a></dt>
        <dd><a href="/pc/assistant/viewPersonal">个人资料</a></dd>
        <dd><a href="/pc/user/myBalance">资金管理</a></dd>
        <dd><a href="/pc/bindPhone">资金管理</a></dd>
        <dd><a href="/pc/resetPwd">重置密码</a></dd>
    </dl>
    <dl>
        <dt class="order-icon2"><a href="#">账号管理</a></dt>
        <dd><a href="#">订单管理</a></dd>
        <dd><a href="/pc/assistant/myExperts">专家管理</a></dd>
        <dd><a href="/pc/requirement/myPublish">需要管理</a></dd>
        <dd><a href="/pc/activity/myActivity">活动管理</a></dd>
    </dl>
    <dl>
        <dt class="order-icon3"><a href="/pc/favorite/listExpert">我的收藏</a></dt>
        <dd><a href="/pc/favorite/listExpert">收藏专家</a></dd>
    </dl>
    <dl>
        <dt class="no-border"><a href="#">我的消息</a></dt>
        <dd><a href="#">查看评论</a></dd>
    </dl>
</div>
<div class="content-head clear">
    <span class="content-head1">hi,你好,jay123</span>
    <span class="content-head2">上次登录时间：2015.6.30</span>
</div>
<div class="content-body">
    <ul class="body-nav">
        <li class="nav-li h-color">专家管理</li>

    </ul>
    <div class="aem-addbut">
        <div class="aem-addbut-left">全部专家（${pageInfo.list.size()}）</div>
        <div class="aem-addbut-right">
            <div class="aem-addbut-img">
                <img src="/images/sc-add.png">
            </div>
            <div class="aem-addbut-wz">添加专家</div>
        </div>
    </div>
    <c:forEach items="${pageInfo.list}" var="expert">

    <div class="aem-table-wapper">
        <div class="aem-td-1">
            <div class="aem-tr-p"><img src="http://pic.591zjh.com/${expert.pictureUrl}"></div>
            <div class="aem-tr-wjx">
                <img src="/images/star-pic.png">
                <img src="/images/star-pic.png">
                <img src="/images/star-pic.png">
                <img src="/images/star-pic.png">
                <img src="/images/star-pic.png">
                5.0分
            </div>
            <div class="aem-tr-wz1">
                ${expert.province.name}
            </div>
        </div>
        <div class="aem-td-2">
            <div class="aem-tr">
                <span>${expert.name}</span>&nbsp;&nbsp;
                ${expert.chief}
            </div>


        </div>
        <div class="aem-td-3">
            专家报价：<span style="color:#ed7027;">${expert.minPrice} - ${maxPrice}</span>元<br><br>
            <span class="aem-td-31">${expert.memo}</span>
        </div>
        <div class="aem-td-4">
            <div class="aem-tr-r1"><a href="/pc/assistant/editExpert?expertId=${expert.id}">编辑专家</a></div>
            <div class="aem-tr-r2"><a href="#" onclick="getScheduleList('${expert.id}');">设置档期</a></div>
            <div class="aem-tr-r3"><a href="#" onclick="deleteExpert('${expert.id}',this)">删除专家</a> </div>
            <div class="aem-tr-r4">评论（100）</div>

        </div>
    </div>
    </c:forEach>

    <!-- 页码部分 -->
    <div class="page-normal">
        <ul class="page-ul">
            <zjh:pageList bean="${pageEntity}" url="/pc/assistant/myExperts"></zjh:pageList>
        </ul>
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
                <div class="footer-ul1-con">（工作时间：08:00 - 23:00）</div>
                <div class="footer-ul1-con biancu">010-51591591</div>
            </li>
        </ul>
        <div class="footerpic">
            <img src="/images/footer-pic.png" alt="底部图片">
        </div>
        <div class="footer-bottom">
            <ul class="footer-ul2 clear">
                <li><a href="#">友情链接：</a></li>
                <li><a href="#">专家汇</a></li>
                <li><a href="#">专家汇</a></li>
                <li><a href="#">专家汇</a></li>
                <li><a href="#">专家汇</a></li>
                <li><a href="#">专家汇</a></li>
                <li><a href="#">专家汇</a></li>
                <li><a href="#">专家汇</a></li>
                <li><a href="#">专家汇</a></li>
                <li><a href="#">更多</a></li>
            </ul>
            <p>&copy;2011-2015&nbsp;&nbsp;专家汇&nbsp;&nbsp;All&nbsp;&nbsp;Rights&nbsp;&nbsp;Reserved&nbsp;&nbsp;北京语博信息科技有限公司&nbsp;&nbsp;&nbsp;&nbsp;京ICP备11001010号-7&nbsp;&nbsp;京公网安备&nbsp;&nbsp;11010702111111</p>
        </div>
    </div>
</div>
</div>
<!--    弹出框部分-->
<!--    增加地址弹出部分-->
<div class="pop-up-bg"></div>
<div class="pop-up-rili-wapper2">
<div class="pop-up-down3-aem"><img src="/images/pop-up-down3.png"></div>
<div class="pop-up-xgdq">修改档期</div>
<div class="ms1-table">
<div class="ms1-table-l">
    <div class="ms1-tr">
        <div class="ms1-td">周一</div>
        <div class="ms1-td">周二</div>
        <div class="ms1-td">周三</div>
        <div class="ms1-td">周四</div>
        <div class="ms1-td">周五</div>
        <div class="ms1-td">周六</div>
        <div class="ms1-td">周日</div>
    </div>

    <div class="ms1-tr-num">


    </div>


</div>
    <div class="ms1-table-r">
        <div class="ms1-tr-r">
            <div class="ms1-td-r-1"><img src="/images/ms-left.png"></div>
            <div class="ms1-td-r-2">${year}年${month}月</div>
            <div class="ms1-td-r-3"><img src="/images/ms-right.png"></div>
        </div>
        <div class="ms1-tr-r">
            <div class="ms1-td-r4">${day}</div>
            <div class="ms1-td-r5">周${weekday}</div>
        </div>
    </div>
</div>

<div class="ms1-but-sq">收起</div>
<div class="pop-up-ts1">
    <span style="color:#00bdff;">蓝色</span>：可约
    <span style="color:#ec6618;">橙色</span>：抢约
    <span style="color:#c5c8c9;">灰色</span>：不可约
    <span style="color:#646464;">黑色</span>：已支付订单
</div>
<%--<div><button  class="pop-but1">保存</button></div>--%>
<div class="pop-up-line"></div>

</div>

<div class="pop-up-aem-wapper">
    <div class="pop-up-aem-down4"><img src="/images/pop-up-down3.png"></div>
    <div class="pop-up-aem-username">
        <div class="pop-up-aem-username-l"><img src="/images/aem-username.png"></div>
        <div class="pop-up-aem-username-r">
            <input type="text" id="username" value="" placeholder="已绑定用户名、手机、邮箱">
        </div>
    </div>
    <div class="pop-up-aem-password">
        <div class="pop-up-aem-username-l"><img src="/images/aem-password.png"></div>
        <div class="pop-up-aem-username-r">
            <input id="password" type="password" value="" placeholder="密码">
        </div>
    </div>
    <span id="errorMsg" style="color:#ff0000;"></span>
<%--
    <div class="pop-up-zjzc">专家注册</div>
--%>
    <div class="pop-up-zjzc-but" onclick="bindExpert();">立即验证</div>
</div>
<script type="text/javascript">

    $(function(){

        $(".aem-tr-r2").click(function(){
            $(".pop-up-bg").css('display','block');
            $(".pop-up-rili-wapper2").css('display','block');
        });
        $(".pop-up-down3-aem").click(function(){
            $(".pop-up-bg").css('display','none');
            $(".pop-up-rili-wapper2").css('display','none');
        });
        $(".aem-addbut-right").click(function(){
            $(".pop-up-bg").css('display','block');
            $(".pop-up-aem-wapper").css('display','block');
        });
        $(".pop-up-aem-down4").click(function(){
            $(".pop-up-bg").css('display','none');
            $(".pop-up-aem-wapper").css('display','none');
        });
    });
    $(function(){
        $(".ms1-td").click(function(){
            var state=$(this).find(".ms1-zhuangtai-wapper").css("display");
            $(".ms1-zhuangtai-wapper").css('display','none');
            if(state=="none"){
                $(this).children(":eq(0)").css('display','block');
            }else{
                $(this).children(":eq(0)").css('display','none');
            }
        });

    })
    function bindExpert(){
        $.ajax({
            url:"/pc/assistant/bindExpert",
            type:"post",
            data:{
                username:$("#username").val(),
                password:$("#password").val()
            },
            dataType:"json",
            success:function(data){
                if(data==null){
                    $("#errorMsg").html("用户名和密码不匹配");
                }else{
                    location.href="/pc/assistant/myExperts";
                }
            }
        })
    }
    function deleteExpert(id,obj){
        $.ajax({
            url:"/pc/assistant/deleteExpert",
            type:"get",
            data:{
                expertId:id
            },
            dataType:"json",
            success:function(data){
                if(data){
                    $(obj).parents(".aem-table-wapper").fadeOut(1000);
                }
            }
        })
    }
    function changeStatus(id,status,date){
        console.log(id);

        $.ajax({
            url:"/pc/schedule/change",
            type:"get",
            data:{
                id:id,
                status:status,
                date:date
            },
            dataType:"json",
            success:function(data){
                var dateStatus=eval(data);
                console.log(dateStatus);
                if(dateStatus==0){
                    $(this).parents(".ms1-td").addClass(".ms1-color1");
                }else if(dateStatus==1){
                    $(this).parents(".ms1-td").addClass(".ms1-color2");
                }else if(dateStatus==2){
                    $(this).parents(".ms1-td").addClass(".ms1-color3");
                }
            }
        })
    }
    function getScheduleList(id){
        $.ajax({
            url:"/pc/schedule/expertSchedule",
            type:"get",
            data:{
                expertId:id
            },
            dataType:"json",
            success:function(data){
                $(".ms1-tr-num").empty();
                var schedules=data.scheduleList;
                for(var i=0;i<schedules.length;i++){
                    if(schedules[i].outOfDate==1){
                        $(".ms1-tr-num").append("<div class=\"ms1-td ms1-color1\">"+schedules[i].day+"</div>");
                    }else if(schedules[i].dateStatus==0&&schedules[i].outOfDate==0){
                        $(".ms1-tr-num").append(" <div class=\"ms1-td ms1-color1\">"+schedules[i].day
                        +" <div class=\"ms1-zhuangtai-wapper\">"
                        +"<div class=\"ms1-zhuangtai\">"
                        +"<div class=\"ms1-keyue\"><a href=\"#\" onclick=\"changeStatus('"+schedules[i].id+"',1,'"+schedules[i].date+"');\">可约</a> </div>"
                        +"</div></div></div>");
                    }else if(schedules[i].dateStatus==1&&schedules[i].outOfDate==0){
                        $(".ms1-tr-num").append(" <div class=\"ms1-td ms1-color2\">"+schedules[i].day
                        +"<div class=\"ms1-zhuangtai-wapper\">"
                        +"<div class=\"ms1-zhuangtai\">"
                        +"<div class=\"ms1-bukeyue\"><a href=\"#\" onclick=\"changeStatus('"+schedules[i].id+"',0,'"+schedules[i].date+"');\">不可约</a></div>"
                        +"<div class=\"ms1-yiyue\"><a href=\"#\" onclick=\"changeStatus('"+schedules[i].id+"',3,'"+schedules[i].date+"');\">已约</a></div>"
                        +"</div></div></div>");
                    }else if(schedules[i].dateStatus==2&&schedules[i].outOfDate==0){
                        $(".ms1-tr-num").append("<div class=\"ms1-td ms1-color3\">"+schedules[i].day
                        +"<div class=\"ms1-zhuangtai-wapper\">"
                        +"<div class=\"ms1-zhuangtai\">"
                        +"<div class=\"ms1-keyue\"><a href=\"#\" onclick=\"changeStatus('"+schedules[i].id+"',1,'"+schedules[i].date+"');\">可约</a></div>"
                        +"<div class=\"ms1-bukeyue\"><a href=\"#\" onclick=\"changeStatus('"+schedules[i].id+"',1,'"+schedules[i].date+"');\">不可约</a></div>"
                        +"<div class=\"ms1-yiyue\"><a href=\"#\" onclick=\"changeStatus('"+schedules[i].id+"',3,'"+schedules[i].date+"');\">已约</a></div>"
                        +"</div></div></div>");

                    }else{
                        $(".ms1-tr-num").append("<div class=\"ms1-td\">"+schedules[i].day
                                +"<div class=\"ms1-zhuangtai-wapper\">"
                                +"<div class=\"ms1-zhuangtai\">"
                                +"<div class=\"ms1-keyue\"><a href=\"#\" onclick=\"changeStatus('"+schedules[i].id+"',1,'"+schedules[i].date+"');\">可约</a></div>"
                                +"</div></div></div>");
                    }
                    $(".ms1-td-r-2").html(data.year+"年"+data.month+"月");
                    $(".ms1-td-r4").html(data.day);
                    $(".ms1-td-r5").html("周"+data.weekday);

                }
                $(".ms1-td").click(function(){
                    var state=$(this).find(".ms1-zhuangtai-wapper").css("display");
                    if(state=="none"){
                        $(this).children(":eq(0)").css('display','block');
                    }else{
                        $(this).children(":eq(0)").css('display','none');
                    }
                });
            }
        })

    }
</script>

<!-- jiathis插件侧边栏 -->
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
</body>
</html>
