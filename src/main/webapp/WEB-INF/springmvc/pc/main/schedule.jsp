<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/6/30
  Time: 17:51
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
    <title>我的档期</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/public-css-style.css">
    <link rel="stylesheet" href="/theme/main.css">
    <script type="text/javascript" src="/scripts/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/scripts/zjh/zjh-public.js"></script>


</head>
<body>

<div id="wrap">
<jsp:include page="../header.jsp"></jsp:include>
<!-- content部分 -->
<div class="content clear">
    <!-- 导航部分 -->
    <div class="nav">
        <ul>
            <li class="nav-1"><a href="/pc/index">首页</a></li>
            <li><a href="/pc/schedule/view">账号管理</a></li>
            <li><a href="/pc/expert/viewPersonal">个人中心</a></li>
            <li><a href="/pc/requirement/myPublish">我的需求</a></li>
            <li><a href="/pc/activity/myActivity">我的活动</a></li>
<%--
            <li><a href="#">消息</a></li>
--%>
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

                <dt><a href="/pc/user/view">基本资料</a></dt>
                <dd><a href="/pc/user/view">个人资料</a></dd>
                <c:if test="${myUser.utype==2}">
                    <dd><a href="/pc/expertServe/add">服务内容</a></dd>
                </c:if>
<%--
                <dd><a href="/pc/user/myBalance">资金管理</a></dd>
--%>
                <dd><a href="/pc/bindPhone">修改账户</a></dd>
                <dd><a href="/pc/resetPwd">重置密码</a></dd>
            </dl>
            <dl>
                <dt class="order-icon2"><a href="/pc/purchaseOrder/myOrders">账号管理</a></dt>
                <dd><a href="/pc/purchaseOrder/myOrders">订单管理</a></dd>
                <c:if test="${myUser.utype==3}">
                    <dd><a href="/pc/assistant/myExperts">专家管理</a></dd>
                </c:if>
                <c:if test="${myUser.utype==2}">
                    <dd><a href="/pc/schedule/view">档期管理</a></dd>
                </c:if>
                <dd><a href="/pc/requirement/myPublish">需求管理</a></dd>
                <dd><a href="/pc/activity/myActivity">活动管理</a></dd>
            </dl>

            <dl>
                <dt class="order-icon3"><a href="/pc/favorite/listExpert">我的收藏</a></dt>
                <dd><a href="/pc/favorite/listExpert">收藏专家</a></dd>
            </dl>
       <%--     <dl>
                <dt class="no-border"><a href="#">我的消息</a></dt>
            </dl>--%>
        </div>
        <div class="content-head clear">
            <span class="content-head1">hi,中午好,${myUser.name}</span>
            <span class="content-head2">上次登录时间:<fmt:formatDate value="${myUser.lastLogintime}" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate></span>
        </div>

<div class="content-body">
<ul class="body-nav">
    <li class="nav-li h-color">课程日历</li>
</ul>
<div class="body-sub">
<form id="dateForm" action="/pc/schedule/view" method="post">
    <input type="hidden" id="year" name="year" value="${year}">
    <input type="hidden" id="month" name="month" value="${month}">

</form>
<div class="ms-chenge">修改档期</div>
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




    <c:forEach items="${scheduleList}" var="schedule">
        <%--过期--%>
        <c:if test="${schedule.outOfDate==1}">
            <div class="ms1-td ms1-color1">${schedule.day}</div>
        </c:if>
        <%--尚未到期但是不可约--%>
        <c:if test="${schedule.dateStatus==0&&schedule.outOfDate==0}">
            <div class="ms1-td ms1-color1">
                    ${schedule.day}
                <div class="ms1-zhuangtai-wapper">
                    <div class="ms1-zhuangtai">
                        <div class="ms1-keyue"><a href="#" onclick="changeStatus('${schedule.id}',1,'${schedule.date}',this);">可约</a> </div>
                    </div>
                </div>
            </div>
        </c:if>
        <%--正常可约--%>
        <c:if test="${schedule.dateStatus==1&&schedule.outOfDate==0}">
            <div class="ms1-td ms1-color2">
                    ${schedule.day}
                <div class="ms1-zhuangtai-wapper">
                    <div class="ms1-zhuangtai">
                        <div class="ms1-bukeyue"><a href="#" onclick="changeStatus('${schedule.id}',0,'${schedule.date}',this);">不可约</a></div>
                        <div class="ms1-yiyue"><a href="#" onclick="changeStatus('${schedule.id}',3,'${schedule.date}',this);">已约</a></div>
                    </div>
                </div>
            </div>

        </c:if>
        <%--抢约--%>
        <c:if test="${schedule.dateStatus==2&&schedule.outOfDate==0}">
            <div class="ms1-td ms1-color3">
                    ${schedule.day}
                <div class="ms1-zhuangtai-wapper">
                    <div class="ms1-zhuangtai">
                        <div class="ms1-keyue"><a href="#" onclick="changeStatus('${schedule.id}',1,'${schedule.date}',this);">可约</a></div>
                        <div class="ms1-bukeyue"><a href="#" onclick="changeStatus('${schedule.id}',1,'${schedule.date}',this);">不可约</a></div>
                        <div class="ms1-yiyue"><a href="#" onclick="changeStatus('${schedule.id}',3,'${schedule.date}',this);">已约</a></div>
                    </div>
                </div>
            </div>
        </c:if>
        <%--已约--%>
        <c:if test="${schedule.dateStatus==3&&schedule.outOfDate==0}">
            <div class="ms1-td">
                    ${schedule.day}
                <div class="ms1-zhuangtai-wapper">
                    <div class="ms1-zhuangtai">
                        <div class="ms1-keyue"><a href="#" onclick="changeStatus('${schedule.id}',1,'${schedule.date}',this);">可约</a></div>
                    </div>
                </div>
            </div>
        </c:if>
    </c:forEach>

</div>


</div>
<div class="ms1-table-r">
    <div class="ms1-tr-r">
        <div class="ms1-td-r-1" onclick="preMonth()"><img src="/images/ms-left.png"></div>
        <div class="ms1-td-r-2">${year}年${month}月</div>
        <div class="ms1-td-r-3" onclick="nextMonth()"><img src="/images/ms-right.png"></div>
    </div>
    <div class="ms1-tr-r">
        <div class="ms1-td-r4">${day}</div>
        <div class="ms1-td-r5">周${weekday}</div>
    </div>
</div>
</div>
<div class="ms1-notes">
    <span><i class="i1">蓝色:</i>可约</span>
    <span><i class="i2">橙色:</i>抢约</span>
    <span><i class="i3">灰色:</i>不可约</span>
    <span><i class="i4">黑色:</i>已支付订单</span>
</div>
<div class="ms1-but-sq">收起</div>

<div class="ms1-xx"></div>

<c:forEach items="${purchaseOrderList}" var="purchaseOrder">


<div class="ms1-xingxi">
    <span class="ms1-wz-1">${purchaseOrder.consumer.name}</span>
    <span class="ms1-wz-2">服务类型</span>
    <span class="ms1-wz-3">:<zjh:status name="ptype" dataType="ExpertServe.serveType" type="normal" checkedValue="${purchaseOrder.ptype}"></zjh:status> </span>
    <span class="ms1-wz-4"><zjh:status name="industry" dataType="PurchaseOrder.industry" type="normal" checkedValue="${purchaseOrder.industry}"></zjh:status> </span>
    <span class="ms1-wz-5">时间:</span>
    <span class="ms1-wz-6"><fmt:formatDate value="${purchaseOrder.serveDatetime}" pattern="yyyy-MM-dd"></fmt:formatDate> </span>
    <span class="ms1-wz-7">地点:</span>
    <span class="ms1-wz-8">${purchaseOrder.province.name}</span>
    <span class="ms1-wz-9">订单:</span>
    <span class="ms1-wz-10"><zjh:status name="payStatus" dataType="PurchaseOrder.payStatus" type="normal" checkedValue="${purchaseOrder.payStatus}"></zjh:status> </span>
</div>
</c:forEach>
</div>
</div>
</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</div>



<script type="text/javascript">
    function nextMonth() {
        setDate(1);
    }
    function preMonth() {
        setDate(-1);
    }
    function setDate(amount) {
        var year = parseInt($("#year").val());
        var month = parseInt($("#month").val());
        amount = parseInt(amount);
        if (month + amount > 12) {
            year += 1;
            month = 1;
        }
        else if (month + amount < 1) {
            year -= 1;
            month = 12;
        }
        else {
            month += amount;
        }
        $("#year").val(year);
        $("#month").val(month);
        $("#dateForm").submit();
    }

    $(function(){
        $(".ms1-td").click(function(){
            var state=$(this).find(".ms1-zhuangtai-wapper").css("display");
            if(state=="none"){
                $(this).children(":eq(0)").css('display','block');
            }else{
                $(this).children(":eq(0)").css('display','none');
            }
        });

    })
    function changeStatus(id,status,date,obj){
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
                location.reload();
                /*if(dateStatus==0){
                    $(obj).parents(".ms1-td").removeClass("ms1-td").addClass("ms1-td ms1-color1");
                }else if(dateStatus==1){
                    $(obj).parents(".ms1-td").removeClass("ms1-td").addClass("ms1-td ms1-color2");
                }else if(dateStatus==2){
                    $(obj).parents(".ms1-td").removeClass("ms1-td").addClass("ms1-td ms1-color3");
                }*/
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
