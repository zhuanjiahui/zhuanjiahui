<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/23
  Time: 14:20
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
    <title>用户发布需求</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/public-css-style.css">
    <link rel="stylesheet" href="/theme/main.css">
    <script type="text/javascript" src="/scripts/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/scripts/zjh/zjh-public.js"></script>
    <script type="text/javascript" src="/scripts/My97DatePicker/WdatePicker.js"></script>

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
<%--            <dl>
                <dt class="no-border"><a href="#">我的消息</a></dt>
            </dl>--%>
        </div>
        <div class="content-head clear">
            <span class="content-head1">hi,中午好,${myUser.name}</span>
            <span class="content-head2">上次登录时间:<fmt:formatDate value="${myUser.lastLogintime}" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate></span>
        </div>
        <div class="content-body">
            <ul class="body-nav">
                <li class="nav-li h-color">发布需求</li>
                <li class="nav-li"><a href="/pc/requirement/myPublish">我的需求</a> </li>
            </ul>
            <form name="requirement" action="/pc/requirement/save" method="post" class="releaseDemandPage">
            <div class="body-sub">
                <div class="release-requirements">
                    <img src="/images/duihao.gif">
                    填写需求信息
                </div>
                <div class="rr-table">
                    <div class="rr-tr">
                        <div class="rr-td-l">标题：</div>
                        <div class="rr-td-r"><input type="text" name="name" value="" style="width:400px;"/></div>
                    </div>
                    <div class="rr-tr">
                        <div class="rr-td-l">类型：</div>
                        <div class="rr-td-r">
                            <zjh:status  name="type" dataType="Requirement.type" type="select" checkedValue="" onchange="showCaseDiv(this.value);"></zjh:status>
                        </div>
                        <div class="rr-td-l" style="width:70px;">行业：</div>
                        <div class="rr-td-r">
                            <zjh:status name="industry" dataType="ExpertServe.industry" type="select" checkedValue=""></zjh:status>
                        </div>
                        <div class="rr-td-l" style="width:70px;">省份：</div>
                        <div class="rr-td-r">
                            <select class="pi-box-four" name="provinceId" required="true">
                                <c:forEach items="${provinces}" var="province">
                                    <option value="${province.id}">${province.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="rr-tr" hidden="true" id="major">
                        <div class="rr-td-l">专业：</div>
                        <div class="rr-td-r">
                            <zjh:status name="major" dataType="ExpertServe.major" type="select" checkedValue="" onchange="loadCourse(this.value);"></zjh:status>
                        </div>
                        <div class="rr-td-l">课程：</div>
                        <div class="rr-td-r">
                            <select id="course" name="courseType">
                                <option value="">请选择</option>
                            </select>
                        </div>
                    </div>
                    <div class="rr-tr" hidden="true" id="development">
                        <div class="rr-td-l">擅长类型：</div>
                        <div class="rr-td-r">
                            <zjh:status name="developType" dataType="ExpertServe.developType" type="select" checkedValue=""></zjh:status>
                        </div>

                    </div>

                    <div class="rr-tr">
                        <div class="rr-td-l">预算：</div>
                        <div class="rr-td-r">
                            <input name="price" type="text" value="" style="width:142px;"/>
                        </div>
                        <div class="rr-td-l">实施时间：</div>
                        <div class="rr-td-r">
                            <input required name="startDate" class="Wdate" type="text"  value="" style="height: 35px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                        </div>

                    </div>
                    <div class="rr-tr">
                        <div class="rr-td-l">详细地址：</div>
                        <div class="rr-td-r"><input name="address" type="text" value="" style="width:400px;"/></div>
                    </div>
                    <div class="rr-tr">
                        <div class="rr-td-l">期望目标：</div>
                        <div class="rr-td-r"><input class="the-contact" name="memo" type="text" value="" style="width:250px;"/></div>
                    </div>
                    <div class="rr-tr">
                        <div class="rr-td-l">联系人：</div>
                        <div class="rr-td-r"><input class="the-contact" name="linkman" type="text" value="" style="width:250px;"/></div>
                    </div>
                    <div class="rr-tr">
                        <div class="rr-td-l">联系电话：</div>
                        <div class="rr-td-r"><input class="the-contact" name="telephone" type="text" value="" style="width:250px;"/></div>
                    </div>
                    <div class="rr-tr">
                        <div class="rr-td-l">类似项目：</div>
                        <div class="rr-td-r"><input class="the-contact" name="itemsName" type="text" value="" style="width:250px;"/></div>
                    </div>
                    <div class="rr-tr">
                        <div class="rr-td-l">类似项目url：</div>
                        <div class="rr-td-r"><input class="the-contact" name="itemsUrl" type="text" value="" style="width:250px;"/></div>
                    </div>
                    <div class="rr-tr rr-tr-h1">
                        <div class="rr-td-l">需求介绍：</div>
                        <div class="rr-td-r"><textarea name="introduce" ></textarea></div>
                    </div>
                </div>
            </div>
            <div><button class="pi-but2" type="submit">保存</button></div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</div>



<!-- jiathis插件侧边栏 -->
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
<script>
    function showCaseDiv(serve){
        if(serve=="development"){
            $("#development").show();
            $("#major").hide();
        }else{
            $("#development").hide();
            $("#major").show();
        }
    }
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
</script>
</body>
</html>