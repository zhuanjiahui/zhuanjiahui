<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/14
  Time: 17:47
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
    <title>发布活动</title>

    <link rel="stylesheet" href="/theme/reset.css" type="text/css">
    <link rel="stylesheet" href="/theme/index.css" type="text/css">
    <link rel="stylesheet" href="/theme/public-css-style.css">
    <link rel="stylesheet" href="/theme/main.css">
    <script type="text/javascript" src="/scripts/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/scripts/My97DatePicker/WdatePicker.js"></script>
    <script src="/scripts/uploadify/jquery.uploadify.min.js" type="text/javascript"></script>

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
            <li><a href="/pc/user/viewPersonal">个人中心</a></li>
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
<%--
                <dd><a href="/pc/user/myBalance">资金管理</a></dd>
--%>
                <dd><a href="/pc/resetPwd">重置密码</a></dd>
            </dl>
            <dl>
                <dt class="order-icon2"><a href="/pc/purchaseOrder/myOrders">账号管理</a></dt>
                <dd><a href="/pc/purchaseOrder/myOrders">订单管理</a></dd>
                <c:if test="${myUser.utype==2}">
                    <dd><a href="/pc/schedule/view">档期管理</a></dd>
                </c:if>
                <c:if test="${myUser.utype==3}">
                    <dd><a href="/pc/assistant/myExperts">专家管理</a></dd>
                </c:if>
                <dd><a href="/pc/requirement/myPublish">需求管理</a></dd>
                <dd><a href="/pc/activity/myActivity">活动管理</a></dd>
            </dl>
            <dl>
                <dt class="order-icon3"><a href="/pc/favorite/listExpert">我的收藏</a></dt>
                <dd><a href="/pc/favorite/listExpert">收藏专家</a></dd>
            </dl>
           <%-- <dl>
                <dt class="no-border"><a href="#">我的消息</a></dt>
            </dl>--%>
        </div>
        <div class="content-head clear">
            <span class="content-head1">hi,中午好,${myUser.name}</span>
            <span class="content-head2">上次登录时间:<fmt:formatDate value="${myUser.lastLogintime}" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate> </span>
        </div>
    <div class="content-body">
        <ul class="body-nav">
            <li class="nav-li h-color">发布活动</li>
            <li class="nav-li"><a href="/pc/activity/myActivity">我的活动</a> </li>
        </ul>

        <div class="body-sub">
            <form id="activity" name="activity" action="/pc/activity/save" method="post">
                <div class="launch-event">
                    <img src="/images/duihao.gif">
                    添写活动信息
                </div>

                <div class="le-table">
                    <input type="hidden" name="id" value="${id}">
                    <div class="le-tr">
                        <div class="le-td-l">活动主题:</div>
                        <div class="le-td-r"><input class="w1" name="name" type="text" value=""/></div>
                    </div>
                    <div class="le-tr">
                        <div class="le-td-l">类型:</div>
                        <div class="le-td-r">
                            <zjh:status name="type" dataType="Activity.type" type="select"></zjh:status>
                        </div>
                        <div class="le-td-l">行业:</div>
                        <div class="le-td-r">
                            <zjh:status name="industry" dataType="ExpertServe.industry" type="select"></zjh:status>

                        </div>
                    </div>
                    <div class="le-tr">
                        <div class="le-td-l">费用:</div>
                        <div class="le-td-r">
                            <input class="xl" name="price" type="text" value=""/>
                        </div>
                        <div class="le-td-l">人数:</div>
                        <div class="le-td-r">
                            <input class="xl" name="userNumber" type="text" value=""/>
                        </div>
                    </div>
                    <div class="le-tr">
                        <div class="le-td-l">开始时间:</div>
                        <div class="le-td-r">
                            <input required type="text" class="Wdate" id="startDatetime" name="startDatetime" style="width:200px;height: 35px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})">
                        </div>
                    </div>
                    <div class="le-tr">
                        <div class="le-td-l">结束时间:</div>
                        <div class="le-td-r">
                            <input required type="text" class="Wdate" id="endDatetime" name="endDatetime" style="width:200px;height: 35px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})">
                        </div>
                    </div>
                    <div class="le-tr">
                        <div class="le-td-l">地址:</div>
                        <div class="le-td-r">
                            <select id="province" class="xl-sheng" onchange="changeCity();">
                                <option value="">请选择</option>
                                <c:forEach items="${provinces}" var="province">
                                    <option value="${province.id}">${province.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="le-tr">
                        <div class="le-td-l">详细地址:</div>
                        <div class="le-td-r"><input class="l-address" name="address" type="text" value=""/></div>
                    </div>
                    <div class="le-tr">
                        <div class="le-td-l">联系人:</div>
                        <div class="le-td-r"><input class="the-contact" name="linkman" type="text" value=""/></div>
                    </div>
                    <div class="le-tr">
                        <div class="le-td-l">联系电话:</div>
                        <div class="le-td-r"><input class="the-contact" name="telephone" type="text" value=""/></div>
                    </div>
                    <div class="le-tr le-tr-h1">
                        <div class="le-td-l">活动介绍:</div>
                        <div class="le-td-r"><textarea class="ac-int" name="introduce"  value=""></textarea></div>
                    </div>
                    <div class="le-tr le-tr-h2">
                        <div class="le-td-l">活动海报:</div>
                        <div class="le-td-r le-img" id="pic"><img src="http://pic.591zjh.com/default/activity/banner.jpg@_700w"></div>
                    </div>
                    <div class="le-tr">
                        <div class="le-td-l"></div>
                        <div class="le-td-r le-sctp">
                            <input id="fileBtn"  type="file">
                            <input type="hidden" name="activityPicUrl" id="activityPic" value="default/activity/banner.jpg">
                        </div>
                    </div>
                    <div class="le-tr le-xx">
                    </div>
                </div>
            </form>
            <form id="guest" name="activityGuest" method="post">

                 <div id="guestList">
                     <input id="guestHead" type="hidden" name="pictureUrl" value="">
                     <input type="hidden" name="activityId" value="${id}">
                     <div class="le-table2">
                         <div class="le-tr2">
                             <div class="le-td-l2">嘉宾姓名:</div>
                             <div class="le-td-r2"><input name="name" type="text" value=""/></div>
                         </div>
                         <div class="le-tr2">
                             <div class="le-td-l2">公司名称:</div>
                             <div class="le-td-r2"><input  type="text" name="companyName" value=""/></div>
                         </div>
                         <div class="le-tr2">
                             <div class="le-td-l2">现任职务:</div>
                             <div class="le-td-r2"><input type="text" name="position" value=""/></div>
                         </div>
                         <div class="le-tr2">
                             <div class="le-td-l2">嘉宾描述:</div>
                             <div class="le-td-r2"><textarea class="ac-int2" name="introduce"  value=""></textarea></div>
                         </div>
                         <div class="sc-p">
                             <div><img src="/images/le-img.png"></div>
                             <div class="le-wz"><input type="file" id="fileBtn2"></div>
                         </div>
                     </div>
                     <div class="le-xx2">
                     </div>
                 </div>
                 <div class="le-but-add" onclick="submitGuestForm()">添加</div>
            </form>
            <div class="guests">

            </div>
            <div class="le-but-bc"><a href="javascript:void(0);" onclick="submitForm();">发布</a> </div>



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
    $(function () {
        $("#fileBtn").uploadify({
            swf: '/scripts/uploadify/uploadify.swf?m=' + Math.random(),
            uploader: '/pc/activity/uploadPic',
            fileTypeExts: '*.jpg;*.jpge;*.gif;*.png',
            //浏览按钮的宽度
            width: '130',
            //浏览按钮的高度
            height: '32',
            multi: false,
            buttonText: '<a class="le-wz">上传海报</a>',
            onUploadSuccess: function (file, data, response) {
                var url=eval(data);
                $("#pic img").attr("src","http://pic.591zjh.com/"+url);
                $("#activityPic").val(url);
            }
        })

        $("#fileBtn2").uploadify({
            swf: '/scripts/uploadify/uploadify.swf?m=' + Math.random(),
            uploader: '/pc/activity/uploadGuestPic',
            fileTypeExts: '*.jpg;*.jpge;*.gif;*.png',
            //浏览按钮的宽度
            width: '130',
            //浏览按钮的高度
            height: '32',
            multi: false,
            buttonText: '<a class="le-wz">上传头像</a>',
            onUploadSuccess: function (file, data, response) {
                var url=eval(data);
                $(".sc-p img").attr("src","http://pic.591zjh.com/"+url+"@_90w");
                $("#guestHead").val(url);
            }
        })
    })

    submitForm=function(){
        $("#activity").submit();
    }
    function submitGuestForm(){
        $.ajax({
            url:"/pc/activity/saveGuest",
            type:"post",
            data:$("#guest").serialize(),
            dataType:"json",
            success:function(data){
                $("#guest:input").val("");
                $(".sc-p img").attr("src","/images/le-img.png");
                $(".guests").append("<img src='http://pic.591zjh.com/"+data.pictureUrl+"@_90w_90h'>"+data.name);
            }

        })
    }
</script>
</body>
</html>