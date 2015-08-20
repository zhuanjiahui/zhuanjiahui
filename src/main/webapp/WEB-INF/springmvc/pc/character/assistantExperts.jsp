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
<jsp:include page="../header.jsp"></jsp:include>
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
        <dt><a href="/pc/assistant/viewPersonal">基本资料</a></dt>
        <dd><a href="/pc/assistant/viewPersonal">个人资料</a></dd>
        <dd><a href="/pc/user/myBalance">资金管理</a></dd>
        <dd><a href="/pc/bindPhone">资金管理</a></dd>
        <dd><a href="/pc/resetPwd">重置密码</a></dd>
    </dl>
    <dl>
        <dt class="order-icon2"><a href="/pc/purchaseOrder/myOrders">账号管理</a></dt>
        <dd><a href="/pc/purchaseOrder/myOrders">订单管理</a></dd>
        <dd><a href="/pc/assistant/myExperts">专家管理</a></dd>
        <dd><a href="/pc/requirement/myPublish">需求管理</a></dd>
        <dd><a href="/pc/activity/myActivity">活动管理</a></dd>
    </dl>
    <dl>
        <dt class="order-icon3"><a href="/pc/favorite/listExpert">我的收藏</a></dt>
        <dd><a href="/pc/favorite/listExpert">收藏专家</a></dd>
    </dl>
   <%-- <dl>
        <dt class="no-border"><a href="#">我的消息</a></dt>
        <dd><a href="#">查看评论</a></dd>
    </dl>--%>
</div>
<div class="content-head clear">
    <span class="content-head1">hi,你好,${myUser.name}</span>
    <span class="content-head2">上次登录时间:<fmt:formatDate value="${myUser.lastLogintime}" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate></span>
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
            专家报价:<span style="color:#ed7027;">${expert.minPrice} - ${maxPrice}</span>元<br><br>
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
<jsp:include page="../footer.jsp"></jsp:include>
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
    <span style="color:#00bdff;">蓝色</span>:可约
    <span style="color:#ec6618;">橙色</span>:抢约
    <span style="color:#c5c8c9;">灰色</span>:不可约
    <span style="color:#646464;">黑色</span>:已支付订单
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
        if(confirm("确认解除关系?")){
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
