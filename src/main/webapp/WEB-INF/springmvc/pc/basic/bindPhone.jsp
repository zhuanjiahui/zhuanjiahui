<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ page import="com.frame.organization.model.MyUser" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/21
  Time: 9:17
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
    <title>修改密码</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/public-css-style.css">
    <link rel="stylesheet" href="/theme/main.css">
    <script type="text/javascript" src="/scripts/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/scripts/zjh/zjh.js"></script>
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
      <%--      <dl>
                <dt class="no-border"><a href="#">我的消息</a></dt>
            </dl>--%>
        </div>
        <div class="content-head clear">
            <span class="content-head1">hi,中午好,${myUser.name}</span>
            <span class="content-head2">上次登录时间:<fmt:formatDate value="${myUser.lastLogintime}" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate></span>
        </div>
        <div class="content-body">
            <ul class="body-nav">
                <li class="nav-li">绑定手机</li>
             <%--   <li class="nav-li">资金管理</li>
                <li class="nav-li h-color">重置密码</li>--%>
            </ul>
            <div class="body-sub">
                <div class="change-password">
                    <img src="/images/duihao.gif">
                    修改绑定手机
                </div>
                <div class="cinf-table">
                    <%--旧账户--%>
                    <div id="oldPhone" class="cinf-tr">
                        <div class="cinf-td-l">
                            手机号:
                        </div>
                        <div class="cinf-td-r">
                            ${myUser.username}
                        </div>
                        <div class="cinf-td-r yzm">
                            <input type="button" id='verificationCode1' value="获取验证码" >
                        </div>
                        <div class="cinf-tr">
                            <div class="cinf-td-l">
                                验证码:
                            </div>
                            <div class="cinf-td-r">
                                <input id="code1" name="checkCode" class="cinput-css" type="text" value=""/>
                            </div>
                        </div>

                        <div><button class="cbut" onclick="nextStep();">下一步</button></div>
                    </div>
                    <%--新账户--%>
                    <div id="newPhone" hidden="hidden">

                        <form id="bindForm"   method="post">
                        <div class="cinf-tr">
                            <div class="cinf-td-l">
                                新手机号:
                            </div>
                            <div class="cinf-td-r">
                                <input id="username"  type="text" value="" placeholder="手机号"/>
                                <span id="nameMsg"></span>
                            </div>
                            <div class="cinf-td-r yzm">
                                <input type="button" id='verificationCode2' value="获取验证码" >
                            </div>
                        </div>
                        <div class="cinf-tr">
                            <div class="cinf-td-l">
                                验证码:
                            </div>
                            <div class="cinf-td-r">
                                <input id="code2" name="checkCode" class="cinput-css" type="text" value=""/>
                            </div>
                        </div>

                        <div><button class="cbut" onclick="submitForm();">绑定</button></div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</div>



<!-- jiathis插件侧边栏 -->
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
<script type="text/javascript">
    var userNameFlag=false;
    $(function(){
        $("#username").blur(function(){
            var reg=/^1[3578][0-9]{9}$/;
            var username=$("#username").val();
            if(reg.test($("#username").val())) {
                $.ajax({
                    url: "/pc/checkUserName",
                    async: true,//同步发送数据，用户名未验证结束不能进行其他操作
                    type: "get",
                    dataType: "json",
                    data: {
                        username: username
                    },
                    success: function (result) {
                        if (!result) {
                            userNameFlag = false;
                            $("#nameMsg").html("<span style='color: #ff0000'>用户名已存在</span>");
                        } else {
                            userNameFlag = true;
                            $("#nameMsg").html("");
                        }
                    },
                    error: function () {

                    }
                })
            }
        })

        $("#verificationCode1").click(function(){
                time($("#verificationCode1"));
                $.ajax({
                    url:"/pc/validation/send",
                    type:"get",
                    data:{
                        phone:${myUser.username}
                    },
                    dataType:"json",
                    success:function(data){

                    },
                    error:function(){

                    }
                })

        })

        $("#verificationCode2").click(function(){
            if(userNameFlag){
                time($("#verificationCode2"));
                $.ajax({
                    url:"/pc/validation/send",
                    type:"get",
                    data:{
                        phone:$("#username").val()
                    },
                    dataType:"json",
                    success:function(data){

                    },
                    error:function(){

                    }
                })
            }

        })
    })



    function nextStep(){
            $.ajax({
                url:"/pc/validation/checkCode",
                type:"get",
                data:{
                    phone:${myUser.username},
                    validationCode:$("#code1").val()
                },
                dataType:"json",
                success:function(data){
                    if(data){
                        $("#oldPhone").hide();
                        $("#newPhone").show();
                    }else{
                        alert("验证码错误");
                    }

                },
                error:function(){

                }
            })
    }


    function submitForm(){
        $.ajax({
            url:"/pc/bindPhone",
            type:"post",
            data:$("#bindForm").serialize(),
            dataType:"json",
            success:function(data){
                if(data){
                    alert("绑定成功！");
                }else{
                    alert("绑定失败！");
                }
            }
        })
    }

    var wait = 60;//时间
    function time(o, p) {//o为按钮的对象，p为可选，这里是60秒过后，提示文字的改变
        if (wait == 0) {
            o.removeAttr("disabled");
            o.val("获取验证码");//改变按钮中value的值
//        p.html("如果您在1分钟内没有收到验证码，请检查您填写的手机号码是否正确或重新发送");
            wait = 60;
        } else {
            o.attr("disabled", true);//倒计时过程中禁止点击按钮
            o.val(wait + "S后重新获取");//改变按钮中value的值
            wait--;
            setTimeout(function () {
                        time(o, p);//循环调用
                    },
                    1000)
        }
    }
</script>
</body>
</html>

