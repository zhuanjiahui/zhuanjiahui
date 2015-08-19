<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/22
  Time: 11:39
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
    <title>助理个人中心</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/public-css-style.css">
    <link rel="stylesheet" href="/theme/main.css">
    <script type="text/javascript" src="/scripts/jquery-1.8.0.min.js"></script>
    <script src="/scripts/uploadify/jquery.uploadify.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jCrop/jquery.Jcrop.js"></script>
    <script type="text/javascript" src="/scripts/zjh/zjh-public.js"></script>
    <script type="text/javascript" src="/scripts/My97DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        .imgareaselect-border1 {background: url(/images/border-anim-v.gif) repeat-y left top;}
        .imgareaselect-border2 {background: url(/images/border-anim-h.gif) repeat-x left top;}
        .imgareaselect-border3 {background: url(/images/border-anim-v.gif) repeat-y right top;}
        .imgareaselect-border4 {background: url(/images/border-anim-h.gif) repeat-x left bottom;}
        .imgareaselect-border1, .imgareaselect-border2,.imgareaselect-border3, .imgareaselect-border4 {opacity: 0.5;filter: alpha(opacity=50);}
        .imgareaselect-handle {background-color: #fff;border: solid 1px #000;opacity: 0.5;filter: alpha(opacity=50);}
        .imgareaselect-outer {background-color: #000;opacity: 0.5;filter: alpha(opacity=50);}

        .pictureCut{display: none; position:fixed;top:50%;left:50%;width:600px;height:400px;margin-top:-200px;margin-left:-300px;background:rgba(0,0,0,.77); z-index:10;border-radius:8px;box-shadow:inset 0 0 2px white;-moz-box-shadow:inset 0 0 2px white;-webkit-box-shadow:inset 0 0 2px white;padding:0 10px;}
        .prePicBox{position:absolute;top:33px;left:33px;border:8px solid rgba(255,255,255,.33);width:280px;height:280px;overflow:hidden;}
        .prePicBox img{width:100%;}
        .viewPicBox{position:absolute;top:33px;left:363px;}
        .viewPicTxt{color:white;font-size:15px;margin:0;}
        .small{width:96px;height:96px;margin-top:15px;overflow:hidden;}
        .small img{width:80px;height:80px;border:8px solid rgba(255,255,255,.33);}
        .big{width:150px;height:150px;margin-top:15px;overflow:hidden;}
        .big img{width:134px;height:134px;border:8px solid rgba(255,255,255,.33);}
        .line{height:3px;width:580px;border-bottom:1px solid rgba(255,255,255,.66);position:absolute;bottom:66px;}
        .picCutBt{position:absolute;bottom:15px;right:33px;}
        .picCutBt li{display:inline-block;margin:0 5px;}
        .picCutBt li button{width:120px;height:40px;border:none;border-radius:3px;font-size:15px;letter-spacing:3px;color:white;}
        .submit{background:#EC6618;cursor:pointer;}
        .submit:hover{background:#dd3d06;}
        .cancel{background:#26C2FF;}
        .cancel:hover{background:#0992c7;}

    </style>


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
<div class="content clear">
    <!-- 导航部分 -->
    <div class="nav">
        <ul>
            <li class="nav-1"><a href="/pc/index">首页</a></li>
            <li><a href="/pc/schedule/view">账号管理</a></li>
            <li><a href="/pc/assistant/viewPersonal">个人中心</a></li>
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

                <dt><a href="/pc/user/view">基本资料</a></dt>
                <dd><a href="/pc/user/view">个人资料</a></dd>
                <c:if test="${myUser.utype==2}">
                    <dd><a href="/pc/expertServe/add">服务内容</a></dd>
                </c:if>
                <dd><a href="/pc/user/myBalance">资金管理</a></dd>
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
            <dl>
                <dt class="no-border"><a href="#">我的消息</a></dt>
            </dl>
        </div>
        <div class="content-head clear">
            <span class="content-head1">hi,你好,${myUser.name}</span>
            <span class="content-head2">上次登录时间:${myUser.lastLogintime}</span>
        </div>
        <div class="content-body">
            <ul class="body-nav">
                <li class="nav-li h-color">个人资料</li>
                <li class="nav-li">资金管理</li>
                <li class="nav-li">重置密码</li>
            </ul>
            <div class="body-sub">
                <div class="Personal-information">
                    <img src="/images/duihao.gif">
                    完善个人资料信息
                </div>
                <form name="assistant" action="/pc/assistant/savePerson" method="post">

                <div class="pi-inf-table">
                    <input id="picUrl" name="pictureUrl" type="hidden" value="${assistant.pictureUrl}">
                    <div class="pi-inf-tr">
                        <div class="pi-inf-td-l">
                            姓名:
                        </div>
                        <div class="pi-inf-td-r">
                            <input name="name" class="pi-input-css" type="text" value="${assistant.name}"/>
                        </div>
                    </div>
                    <div class="pi-inf-tr">
                        <div class="pi-inf-td-l">
                            性别:
                        </div>
                        <div class="pi-inf-td-r">
                           <zjh:status name="gender" dataType="Expert.gender" type="radio" checkedValue="${assistant.gender}"></zjh:status>
                        </div>
                    </div>
                    <div class="pi-inf-tr">
                        <div class="pi-inf-td-l">
                            出生年月:
                        </div>
                        <div class="pi-inf-td-r">
                            <input name="birthdayDate" class="Wdate" type="text"  value="<fmt:formatDate value="${assistant.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate>" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                        </div>
                    </div>
                    <div class="pi-inf-tr">
                        <div class="pi-inf-td-l">
                            联系电话:
                        </div>
                        <div class="pi-inf-td-r">
                            <input name="phone" class="pi-input-css" type="text" value="${assistant.phone}"/>
                        </div>
                    </div>
                    <div class="pi-inf-tr">
                        <div class="pi-inf-td-l">
                            邮箱:
                        </div>
                        <div class="pi-inf-td-r">
                            <input name="email" class="pi-input-css" type="text" value="${assistant.email}"/>
                        </div>
                    </div>
                    <div class="pi-inf-tr">
                        <div class="pi-inf-td-l">
                            常住地:
                        </div>
                        <div class="pi-inf-td-r">
                            <select class="pi-box-four" name="provinceId">
                                <option value="">请选择</option>
                                <c:forEach items="${provinces}" var="province">
                                    <option value="${province.id}">${province.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="pi-inf-tr">
                        <div class="pi-inf-td-l">
                            描述:
                        </div>
                        <div class="pi-inf-td-r">
                            <input name="memo" class="pi-input-css pi-gerenmiaoshu" type="text" value="${assistant.memo}" placeholder="一句话描述自己"/>
                        </div>
                    </div>
                </div>
                <div class="pi-imgs">
                    <img id="head" src="http://pic.591zjh.com/${assistant.pictureUrl}">
                </div>
                <div class="pi-wz"><input id="expertPicUpload" type="file"></div>


                <div class="pi-line1"></div>

                <div><button class="pi-but2" type="submit">保存</button></div>
            </form>
            </div>
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
</div>
<div class="pictureCut">
    <div class="prePicBox">
        <img id="photo" src="/images/le-img.png" />
    </div>
    <div class="viewPicBox">
        <p class="viewPicTxt">预览：</p>
        <div class="preview big">
            <img id="small" src="/images/le-img.png" />
        </div>
        <div class="preview small">
            <img id="sma2" src="/images/le-img.png" />
        </div>
    </div>
    <div class="line"></div>
    <ul class="picCutBt">
        <li><button class="submit" onclick="sureButton();">提交</button></li>
        <li><button class="cancel" onclick="cancelButton();">取消</button></li>
    </ul>

</div>
<%--图像浮层--%>
<%--<div id="floatDiv">
    <div id="bg"></div>
    <div id="big">
        <img id="photo" src="">
    </div>
    <div id="sma">
        <img src="">
    </div>
    <button id="sure" onclick="sureButton();">确定</button>
    <button id="cancel" onclick="cancelButton();">取消</button>

</div>--%>
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
<script type="text/javascript">
    var x, y, w, h,url,jcrop_api;
    $(function () {
        $("#expertPicUpload").uploadify({
            swf: '/scripts/uploadify/uploadify.swf?m=' + Math.random(),
            uploader: '/pc/user/uploadPic',
            /*
             fileTypeExts: '*.jpg;*.jpeg;*.gif;*.png',
             */
            //浏览按钮的宽度
            width: '150',
            //浏览按钮的高度
            height: '32',
            multi: false,
            buttonText: '<a class="uploadPhotoBt">上传头像</a>',
            onUploadSuccess: function (file, data, response) {
                url=eval(data);
                $(".pictureCut").css("display","block");
                $("#photo").attr("src","http://pic.591zjh.com/"+url);
                $("#small").attr("src","http://pic.591zjh.com/"+url);
                var  boundx, boundy;
                $('#photo').Jcrop({
                    onChange: updatePreview,
                    onSelect: updatePreview,
                    aspectRatio: 1,
                    setSelect: [ 0, 0, this.width, this.height/2.5 ]
                },function(){
                    var bounds = this.getBounds();
                    boundx = bounds[0];
                    boundy = bounds[1];
                    jcrop_api = this;
                });

                function updatePreview(c){
                    console.log(boundx+"_"+boundy);
                    if (parseInt(c.w) > 0){
                        var rx = 134 / c.w;
                        var ry = 134 / c.h;
                        $('#small').css({
                            width: Math.round(rx * boundx) + 'px',
                            height: Math.round(ry * boundy) + 'px',
                            marginLeft: '-' + Math.round(rx * c.x) + 'px',
                            marginTop: '-' + Math.round(ry * c.y) + 'px'
                        });
                    }
                    /*      x= c.x*Math.round(boundx / 280);
                     y= c.y*Math.round(boundy / 280);
                     w= c.w*Math.round(boundx / 280);
                     h= c.h*Math.round(boundy / 280);
                     console.log(x+"_"+y+"_"+w+"_"+h);*/
                    x= c.x;
                    y= c.y;
                    w= c.w;
                    h= c.h;
                };

            }
        })
    })

    function sureButton(){
        $("#picUrl").val(url+"@"+x+"-"+y+"-"+w+"-"+h+"a");
        $("#head").attr("src","http://pic.591zjh.com/"+url+"@"+x+"-"+y+"-"+w+"-"+h+"a");
        jcrop_api.destroy();
        $(".pictureCut").hide();

    }
    function cancelButton(){
        jcrop_api.destroy();
        $(".pictureCut").hide();
    }
</script>
</body>
</html>