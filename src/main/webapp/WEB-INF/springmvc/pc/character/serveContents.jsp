<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/6
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/theme/reset.css">
<link rel="stylesheet" href="/theme/expert-detail.css">
<script type="text/javascript" src="/scripts/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="/scripts/zjh/zjh-public.js"></script>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <title></title>
</head>
<body>
<div class="wrap">

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
</div>
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

<!-- 顶部介绍 -->
<div class="expertDetailTop">
    <img src="http://pic.591zjh.com/${expert.pictureUrl}" class="expertPhoto"/>
    <ul class="detailsRight">
        <li>
            <ul class="rightLineOne">
                <li class="expertName">${expert.name}</li>
                <li class="expertGender"><zjh:status name="gender" dataType="Expert.gender" type="normal" checkedValue="${expert.gender}"></zjh:status> </li>
                <li class="expertAddress">${expert.province.name}</li>

            </ul>
        </li>
        <li class="rightLineTwo">${expert.memo}</li>
        <li class="rightLineThree">
            <ul>
                <li>服务：<span>培训、服务、开发</span></li>
                <li>行业：<span>
                    <c:forEach items="${expert.expertIndustryList}" var="expertIndustry">
                        <zjh:status name="industry" dataType="ExpertServe.industry" type="normal" checkedValue="${expertIndustry}"></zjh:status>
                    </c:forEach> </span></li>

            </ul>
        </li>
        <li class="rightLineFour">
            <ul class="expertStyle">
                <c:forEach items="${expert.styleLabelList}" var="stylelabel">
                    <li>${stylelabel.label}</li>
                </c:forEach>

            </ul>
        </li>
        <li class="collectExpert"><a href="#" onclick="favoriteExpert('${expert.id}');">收藏专家</a></li>
    </ul>
</div>

<div class="expertDetailBottom">
<!-- 左侧介绍 -->
<div class="expertDetailLeft">
    <p class="expertId">ID：<span>${expert.idNo}</span></p>
    <ul class="starAndNum">
        <li>
            <ul class="star">
                <li><img src="/images/star-pic.png"></li>
                <li><img src="/images/star-pic.png"></li>
                <li><img src="/images/star-pic.png"></li>
                <li><img src="/images/star-pic.png"></li>
                <li><img src="/images/star-pic.png"></li>
                <li style="color:#ff9b00;position:relative;bottom:2px;left:2px;">5.0</li>
            </ul>
        </li>
        <li>&nbsp;&nbsp;(<span>${comments.size()}</span>)条评论</li>
    </ul>
    <p class="workingYears">工作年限：<span>${expert.workTime}</span>年</p>
    <p class="expertIntroduction">${expert.introduce}</p>
    <ul class="businessExperience">
        <li>工作经历</li>
        <c:forEach items="${expert.companyList}" var="company">
            <li>
                <ul>
                    <li><fmt:formatDate value="${company.startDate}" pattern="yyyy-MM-dd"></fmt:formatDate>至
                        <fmt:formatDate value="${company.endDate}" pattern="yyyy-MM-dd"></fmt:formatDate> </li>
                    <li>${company.name}</li>
                    <li>职务：<span>${company.position}</span></li>
                </ul>
            </li>
        </c:forEach>
    </ul>
</div>
<!-- 主介绍区 -->
<div class="appointment">
    <p class="tips">友情提示：预约时请查看专家位置，留给专家路程时间，避免订单流产 </p>
    <div class="calendar" style="position:relative;top:-36px;">
        <div class="ms-table">
            <div class="ms-table-l">
                <div class="ms-tr weekNum">
                    <div class="ms-td">周一</div>
                    <div class="ms-td">周二</div>
                    <div class="ms-td">周三</div>
                    <div class="ms-td">周四</div>
                    <div class="ms-td">周五</div>
                    <div class="ms-td">周六</div>
                    <div class="ms-td">周日</div>
                </div>

                <div class="ms-tr-num">
                    <c:forEach items="${scheduleList}" var="schedule">
                        <%--不可约--%>
                        <c:if test="${schedule.outOfDate==1||schedule.dateStatus==0}">
                            <div class="ms-td colorGray">${schedule.day}</div>
                        </c:if>
                        <%--正常可约--%>
                        <c:if test="${schedule.dateStatus==1&&schedule.outOfDate==0}">
                            <div class="ms-td colorBlue" onclick="sureOrderTime(this,'${schedule.date}');">
                                    ${schedule.day}
                            </div>

                        </c:if>
                        <%--抢约--%>
                        <c:if test="${schedule.dateStatus==2&&schedule.outOfDate==0}">
                            <div class="ms-td colorOrange" onclick="sureOrderTime(this,'${schedule.date}');">
                                    ${schedule.day}

                            </div>
                        </c:if>
                        <%--已约--%>
                        <c:if test="${schedule.dateStatus==3&&schedule.outOfDate==0}">
                            <div class="ms-td">
                                    ${schedule.day}<p>${schedule.address}</p>
                            </div>
                        </c:if>

                    </c:forEach>
                </div>

            </div>
            <div class="ms-table-r">
                <div class="ms-tr-r">
                    <div class="ms-td-r-1"><a href="/pc/expert/viewPreExpert?expertId=${expert.id}&year=${year}&month=${month}&day=${day}"><img src="/images/ms-left.png"> </a></div>
                    <div class="ms-td-r-2">${year}&nbsp;年&nbsp;${month}&nbsp;月</div>
                    <div class="ms-td-r-3"><a href="/pc/expert/viewNextExpert?expertId=${expert.id}&year=${year}&month=${month}&day=${day}"> <img src="/images/ms-right.png"></a></div>
                </div>
                <div class="ms-tr-r">
                    <div class="ms-td-r4">${day}</div>
                    <div class="ms-td-r5">周${weekday}</div>
                </div>
            </div>
        </div>

        <div class="ms-but-sq">收起</div>
    </div>
    <p class="legend"><span style="color:#00bcfd;">蓝色</span><span>：可约</span><span style="color:#fc5e02;">橙色</span><span>：抢约</span><span style="color:gray;">灰色</span><span>：不可约</span></p>
</div>
<div class="preAppointment">
    <div class="but-yuyue">预约</div>
</div>
<ul class="expertDetialType">
    <li class="expertDetialType-but expertDetialType-li2"><a href="/pc/expert/viewExpert?expertId=${expert.id}">服务内容</a></li>
    <%--  <li class="expertDetialType-but expertDetialType-li2">相册</li>
      <li class="expertDetialType-but expertDetialType-li2">介绍视频</li>--%>
    <li class="expertDetialType-but expertDetialType-li1">服务大纲</li>
</ul>
<ul class="expertDetialTypeElem">
    <c:forEach items="${serveContents}" var="serveContent">
        <div id="${serveContent.expertServe.id}">
            <div>${serveContent.expertServe.name}</div>
            <div>${serveContent.content}</div>
        </div>

    </c:forEach>


</ul>



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
                <div class="footer-ul1-con">（工作时间：08:00 - 23:00）</div>
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
<div class="pop-up-ed-bg"></div>
<div class="pop-up-ed-wapper">
    <form id="orderForm" action="/pc/purchaseOrder/create" method="post">
        <div class="pop-up-ed-tr">
            <div class="pop-up-ed-td-l1">预约时间：<input id="orderTime" name="orderTime" value="" style="border: 0"></div>
            <div class="pop-up-ed-td-r34">
                <zjh:status name="dayType" dataType="PurchaseOrder.dayType" type="select" checkedValue="3" onchange="sureDayType();"></zjh:status>
            </div>
            <div class="pop-up-ed-td-r1"><img src="/images/pop-up-down3.png"></div>
        </div>
        <div class="pop-up-ed-line"></div>
        <div class="pop-up-ed-tr">
            <%--<div class="pop-up-ed-td-l2">服务类型：</div>
            <div class="pop-up-ed-td-r2">
                <zjh:status name="serveType" dataType="ExpertServe.serveType" type="select" checkedValue="" onchange="loadServe();"></zjh:status>
            </div>--%>
        </div>
        <div id="serves">
            <c:forEach items="${expertServes}" var="expertServe">
                <div class="pop-up-ed-tr">
                    <div class="pop-up-ed-td-l3">服务：</div>

                    <input type=radio name="serveId" class="pop-up-ed-td-r31" value="${expertServe.id}" onclick="sureServe('${expertServe.id}','${expertServe.price}','${expertServe.cheap}','${expertServe.discount}');">
                    <div class="pop-up-ed-td-r32"> <zjh:status name="serveType" dataType="ExpertServe.serveType" type="normal" checkedValue="${expertServe.serveType}"></zjh:status>&nbsp;${expertServe.name} - ${expertServe.price}元/天</div>
                </div>
            </c:forEach>
        </div>
        <div class="pop-up-ed-tr">
            <div class="pop-up-ed-td-r44">应付：<span id="total" style="color:#ec6618;"></span></div>
        </div>
        <div class="pop-up-ed-tr" >
            <div class="pop-up-ed-tdbut"><a href="javascript:void(0)" onclick="$('#orderForm').submit();">提交</a> </div>
        </div>
    </form>
</div>


<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
<script type="text/javascript">
    $(function(){
        $(".but-yuyue").click(function(){
            $(".pop-up-ed-bg").css('display','block');
            $(".pop-up-ed-wapper").css('display','block');
        });
        $(".pop-up-ed-td-r1").click(function(){
            $(".pop-up-ed-bg").css('display','none');
            $(".pop-up-ed-wapper").css('display','none');
        });

    });
    var dayType=3,serveId,servePrice,cheap,discount;

    function sureDayType(o){
        dayType=$("select[name='dayType']").val();
        sureTotal(dayType,servePrice,cheap,discount);
    }
    function sureServe(o,p,c,d){
        serveId=o;
        servePrice=p;
        cheap=c;
        discount=d;
        sureTotal(dayType,servePrice,cheap,discount);
    }

    function sureTotal(day,s,cheap,disc){
        var price=s;

        if(day!=3){
            price=price*disc/10;
        }
        $("#total").html(price+"元");
    }

    function loadServe(expertId,serveType){
        $.ajax({
            url:"/pc/expertServe/JLoad",
            type:"post",
            data:{
                expertId:expertId,
                serveType:serveType
            },
            dataType:"json",
            success:function(data){
                $("#serves").empty();
                for(var i=0;i<data.length;i++){
                    $("#serves").append("<div class=\"pop-up-ed-tr\"><div class=\"pop-up-ed-td-l3\">"+
                            "服务:</div><input type=\"radio\" name=\"serveId\" class=\"pop-up-ed-td-r31\" value=\""+data[i].id+"\" "+
                            "onclick=\"sureServe('"+data[i].id+"',"+data[i].price+","+data[i].cheaf+","+data[i].discount+");\">"+
                            "<div class=\"pop-up-ed-td-r32\">"+data[i].name+" - "+data[i].price+"元/天</div></div>");

                }
            }
        })
    }
    function sureOrderTime(obj,date){
        $(obj).css("background","gray");
        $("#orderTime").val(date);
    }

</script>
<script type="text/javascript">
    function favoriteExpert(id){
        $.ajax({
            url:"/pc/favorite/addExpert",
            type:"get",
            data:{
                expertId:id
            },
            dataType:"json",
            success:function(data){
                if(data){
                    alert("收藏成功！");
                }else{
                    alert("收藏失败！");
                }
            }
        })
    }
    $(function(){
        $(".navmenu").mouseover(function(){
            $(this).children("#only").show();//原文件为ul,改为的#only

        })
        $(".navmenu").mouseout(function(){

            $(this).children("#only").hide();//原文件为ul,改为的#only

        })

    })
</script>
</body>
</html>



