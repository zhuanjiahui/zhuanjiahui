<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/17
  Time: 10:06
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
    <title>服务内容</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/public-css-style.css">
    <link rel="stylesheet" href="/theme/main.css">
    <script type="text/javascript" src="/scripts/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/scripts/zjh/zjh.js"></script>
    <script type="text/javascript" src="/scripts/ckeditor/ckeditor.js"></script>
    <script>
        CKEDITOR.replace('content');
    </script>



</head>
<body>

<div id="wrap">
<jsp:include page="../header.jsp"></jsp:include>
<!-- 部分 -->
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

            <dt><a href="/pc/expert/viewPersonal">基本资料</a></dt>
            <dd><a href="/pc/expert/viewPersonal">个人资料</a></dd>
            <dd><a href="/pc/expertServe/add">服务内容</a></dd>
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
     <%--   <dl>
            <dt class="no-border"><a href="#">我的消息</a></dt>
        </dl>--%>
    </div>
    <div class="content-head clear">
        <span class="content-head1">hi,中午好,${myUser.name}</span>
        <span class="content-head2">上次登录时间：<fmt:formatDate value="${myUser.lastLogintime}" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate></span>
    </div>

<div class="content-body">
<ul class="body-nav">
    <li class="nav-li">服务内容</li>
<%--    <li class="nav-li h-color">个人资料</li>
    <li class="nav-li">资金管理</li>
    <li class="nav-li">重置密码</li>--%>
</ul>
    <div class="body-sub" style="position:relative;">
        <div class="service-content">
            <img src="/images/duihao.gif">
            填写服务内容
        </div>
        <div <%--class="box"--%>>
            <%--<div class="add">
                <div class="addImg"></div>
                <p class="addTxt">添加服务<p>
            </div>--%>
            <div class="btMenu">
                <div <%--class="bt op1"--%> onclick="showPanel('train');">培训</div>
                <div <%--class="bt op2"--%> onclick="showPanel('consult');">咨询</div>
                <div <%--class="bt op3"--%> onclick="showPanel('development');">开发</div>
            </div>
        </div>
        <c:forEach items="${expertServeList}" var="expertServe">
        <div class="body-con-4" style="margin-top: -1px;">
            <dl>
                <dd>
                    <span class="list">${expertServe.name}</span>
					<span class="list">服务类型：<span><zjh:status name="serveType" dataType="ExpertServe.serveType" type="normal" checkedValue="${expertServe.serveType}"></zjh:status></span></span>
                    <span class="list">工作年限：${expertServe.workTime}</span>
                    <span class="list">半天折扣：${expertServe.discount}</span>
                    <span class="list">全额优惠：${expertServe.cheap}</span>
                    <span class="list special3">预算：${expertServe.price}元</span>
                </dd>
            </dl>
          <%--  <ol>
               <a href="/pc/expertServe/update?serveId=${expertServe.id}">修改</a></li>
            </ol>--%>
        </div>
        </c:forEach>
        <div class="sc-table">
            <form id="trainForm" name="expertServe" action="" method="post">
            <div id="train" hidden="hidden" style="display: block;">
                <div class="sc-tr">
                    <div class="sc-td-l">
                        <span>行业：</span>
                        <zjh:status name="industry" dataType="ExpertServe.industry" type="select" checkedValue=""></zjh:status>
                    </div>
                    <div class="sc-td-l">
                        <span>专业：</span>
                        <zjh:status name="major" dataType="ExpertServe.major" type="select" checkedValue="" onchange="loadCourse(this.value);"></zjh:status>
                    </div>
                    <div class="sc-td-l">
                        <span>课程：</span>
                        <select id="course" name="courseType" style="width:85px;">
                            <option value="">请选择</option>
                        </select>
                    </div>
                </div>

                <div class="sc-tr">

                    <input name="serveType" value="train" type="hidden">
                    <div class="sc-td-r"><span>服务标题：</span><input type="text" name="name" style="width:240px;"></div>
                    <div class="sc-td-l">
                        <span>培训年限：</span>
                        <select name="workTime" style="width:56px;">

                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>

                        </select>
                    </div>
                </div>
                <div class="sc-tr">

                    <div class="sc-td-l"><span>服务报价：</span><input  type="text" name="price" style="width:80px;"></div>
                    <div class="sc-td-l">
                        <span>半天折扣：</span>
                        <select name="discount"  required="true">
                            <option value="10">请选择</option>
                            <option value="5">五折</option>
                            <option value="6">六折</option>
                            <option value="7">七折</option>
                            <option value="8">八折</option>
                            <option value="9">九折</option>
                            <option value="10">十折</option>
                        </select>
                    </div>
                    <div class="sc-td-l">
                        <span>全额优惠：</span>
                        <select name="cheap"  required="true">
                            <option value="20">请选择</option>
                            <option value="15">七五折</option>
                            <option value="16">八折</option>
                            <option value="17">八五折</option>
                            <option value="18">九折</option>
                            <option value="19">九五折</option>
                            <option value="20">十折</option>
                        </select>
                    </div>
                </div>
                <div class="sc-tr">

                    <div class="sc-td-l"><span>服务过的客户：</span><input type="text" name="servedConsumer" style="width:445px;"></div>
                    <br/>
                </div>
                <div class="editorBox"><textarea id="content" class="ckeditor" name="content">

                </textarea></div>


                <div class="sc-xx"></div>
            <div><button class="sc-but1" onclick="submitForm('train');">添加课程</button></div>
            </div>
            </form>
            <%--咨询--%>
            <form id="consultForm" name="expertServe" action="" method="post" style="display: block;">


            <div id="consult" hidden="hidden" style="display: block;">
                <div class="sc-tr">
                    <div class="sc-td-l sc-td-l-zxnx">
                        咨询年限：
                    </div>
                    <div class="sc-td-r">
                        <select name="workTime">

                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>

                        </select>
                    </div>
                    <div class="sc-td-l sc-td-l-pxnx">
                        半天折扣：
                    </div>
                    <div class="sc-td-r">
                        <select name="discount"  required="true">
                            <option value="10">请选择</option>
                            <option value="5">五折</option>
                            <option value="6">六折</option>
                            <option value="7">七折</option>
                            <option value="8">八折</option>
                            <option value="9">九折</option>
                            <option value="10">十折</option>
                        </select>
                    </div>
                    <div class="sc-td-l sc-td-l-pxnx">
                        全额优惠：
                    </div>
                    <div class="sc-td-r">
                        <select name="cheap"  required="true">
                            <option value="10">请选择</option>
                            <option value="7">七折</option>
                            <option value="8">八折</option>
                            <option value="9">九折</option>
                            <option value="10">十折</option>
                        </select>
                    </div>
                    <div class="sc-td-r">
                       <input type="hidden" name="serveType" value="consult">
                    </div>

                </div>
                <div class="sc-tr">
                    <div class="sc-td-l">咨询专业：</div>
                    <div class="sc-td-r">
                       <zjh:status name="major" dataType="ExpertServe.major" type="select" checkedValue=""></zjh:status>
                    </div>
                    <div class="sc-td-l sc-td-l-hy">行业：</div>
                    <div class="sc-td-r">
                        <zjh:status name="industry" dataType="ExpertServe.industry" type="select" checkedValue=""></zjh:status>

                    </div>
                </div>
                <div class="sc-tr">
                    <div class="sc-td-l">报价：</div>
                    <div class="sc-td-r" style="font-size:13px;">
                        <input type="text" name="price" style="width:114px;">元/天
                    </div>
                    <div class="sc-td-l" style="margin-left: 25px;">客户名称：</div>
                    <div class="sc-td-r">
                        <input name="servedConsumer" style="width:165px;" type="text" size="255">
                    </div>
                </div>
                <div class="sc-xx"></div>
                <div><button class="sc-but1" onclick="submitForm('consult')">添加咨询</button></div>
            </div>
            </form>
            <%--开发--%>
            <form id="developmentForm" name="expertServe" action="" method="post" style="display: block;">

            <div id="development" hidden="hidden" style="display: block;">
                <div class="sc-tr">

                    <div class="sc-td-r">
                        <input type="hidden" name="serveType" value="development">
                    </div>
                    <div class="sc-td-l sc-td-l-kfnx">
                        开发年限：
                    </div>
                    <div class="sc-td-r">
                        <select name="workTime">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                        </select>
                    </div>
                    <div class="sc-td-l sc-td-l-pxnx">
                        半天折扣：
                    </div>
                    <div class="sc-td-r">
                        <select name="discount"  required="true">
                            <option value="10">请选择</option>
                            <option value="5">五折</option>
                            <option value="6">六折</option>
                            <option value="7">七折</option>
                            <option value="8">八折</option>
                            <option value="9">九折</option>
                            <option value="10">十折</option>
                        </select>
                    </div>
                    <div class="sc-td-l sc-td-l-pxnx">
                        全额优惠：
                    </div>
                    <div class="sc-td-r">
                        <select name="cheap" required="true">
                            <option value="10">请选择</option>
                            <option value="7">七折</option>
                            <option value="8">八折</option>
                            <option value="9">九折</option>
                            <option value="10">十折</option>
                        </select>
                    </div>
                </div>
                <div class="sc-tr">
                    <div class="sc-td-l">行业：</div>
                    <div class="sc-td-r">
                        <zjh:status name="industry" dataType="ExpertServe.industry" type="select" checkedValue=""></zjh:status>
                    </div>
                    <div class="sc-td-l">擅长类型：</div>
                    <div class="sc-td-r">
                        <zjh:status name="developType" dataType="ExpertServe.developType" type="select" checkedValue=""></zjh:status>
                    </div>
                </div>
                <div class="sc-tr">
                    <div class="sc-td-l">报价：</div>
                    <div class="sc-td-r" style="font-size: 13px;">
                        <input style="width:120px;" type="text" name="price">元/天
                    </div>
                    <div class="sc-td-l" style="margin-left: 20px;">项目名称：</div>
                    <div class="sc-td-r">
                        <input name="servedConsumer" style="width:165px;" type="text">
                    </div>
                </div>
                <div class="sc-tr">

                </div>
                <div class="sc-xx"></div>
                <div><button class="sc-but1" onclick="submitForm('development');">添加开发</button></div>
            </div>
            </form>

        </div>
    </div>
</div>
</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</div>
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
<script>
    /*var _width = ($('.box').width() - $('.box>div').width()) - 11 + "px";

    *//*var animateList=[
        function(){ $('.op1').delay(10).animate({marginLeft:_width,opacity:1},88,queueList);  },
        function(){ $('.op2').delay(10).animate({marginLeft:_width,opacity:1},88,queueList);  },
        function(){ $('.op3').delay(10).animate({marginLeft:_width,opacity:1},88,queueList);  }
    ];*//*

    *//*$(document).queue('_queueList',animateList);
    var queueList=function(){
        $(document).dequeue('_queueList');
    };*//*


    $('.add').click(function(){
        queueList();
    });*/
    function loadCourse(maj){
        $.ajax({
            url:"/pc/expertServe/loadCourses",
            type:"get",
            data:{
                major:maj
            },
            dataType:"json",
            success:function(data){
                $("#course").empty();
                for(var i=0;i<data.length;i++){
                    $("#course").append("<option value='"+data[i].name+"'>"+data[i].label+"</option>");
                }
            }
        })
    }
/*    $(function(){
        $(".body-con-4 :even").css("background","#B3CFE7");
    })*/
</script>
<script type="text/javascript">
    function submitForm(serveType){
        var formId,serveName;
        if(serveType=="train"){
            formId="#trainForm";
            serveName="培训";
            for(content in CKEDITOR.instances){
                CKEDITOR.instances[content].updateElement();
            }
        }else if(serveType=="consult"){
            formId="#consultForm";
            serveName="咨询";
        }else if(serveType=="development"){
            formId="#developmentForm";
            serveName="开发";
        }
        jQuery.ajax({
            type: 'post',
            async: false,
            url: "/pc/expertServe/save",
            data:$(formId).serialize(),
            dataType: 'json',
            success: function (data) {
                $(".body-sub").append("<div class=\"body-con-4\"><dl><dd>"+
                        "<span class=\"list\">${expertServe.name}</span>"+
                        "<span class=\"list\">服务类型:"+serveName+"</span>"+
                        "<span class=\"list\">工作年限：${expertServe.workTime}</span>"+
                        "<span class=\"list\">半天折扣：${expertServe.discount}</span>"+
                        "<span class=\"list\">全额优惠：${expertServe.cheap}</span>"+
                        "<span class=\"list special3\">预算：￥${expertServe.price}元</span>"+
                        "</dd></dl></div>");

            }
        });
    }
<%--    function showPanel(serveType){
        if(serveType=="train"){
            $("#train").fadeIn("fast");
            $("#consult").fadeOut("fast");
            $("#development").fadeOut("fast");
        }else if(serveType=="consult"){
            $("#consult").fadeIn("fast");
            $("#train").fadeOut("fast");
            $("#development").fadeOut("fast");
        }else if(serveType=="development"){
            $("#consult").fadeOut("fast");
            $("#train").fadeOut("fast");
            $("#development").fadeIn("fast");
        }
    }
</script>--%>


</body>
</html>
