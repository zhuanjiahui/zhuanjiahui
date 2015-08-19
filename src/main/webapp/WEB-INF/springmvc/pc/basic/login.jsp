<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/11/13
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <title>登录-专家会</title>

    <link rel="stylesheet" href="/theme/reset.css" type="text/css">
    <link rel="stylesheet" href="/theme/index.css" type="text/css">
    <link rel="stylesheet" href="/theme/login.css">
    <script type="text/javascript" src="/scripts/jquery-1.8.0.min.js"></script>
</head>
<body>


<div id="wrap"></div>
<!-- header部分 -->
<div class="header clear">
        <div class="logo fl">
            <a href="/pc/index"><img src="/images/logo.png" alt="logo"></a>
        </div>
        <div class="header-right fr">
            <span>hi，欢迎来的专家汇</span>
            <i>|</i>
            <a href="/pc/enroll">免费注册</a>
            <i>|</i>
            <a href="/pc/index">返回首页</a>
            <span>400-910-910</span>
        </div>
    </div>

<div class="line"></div>

<!-- content部分 -->
<div class="content clear">
        <c:if test="${!empty redirect}">
            <form method="post" id="loginForm"
                  action="<c:url value='/j_spring_security_check?redirect=${redirect}'/>"
        </c:if>
        <c:if test="${empty redirect}">
        <form method="post" id="loginForm" action="<c:url value='/j_spring_security_check'/>"
        </c:if>
              onsubmit="return loginSubmit();">
          <%--  <input type="hidden" name="dispatcher" value=""/>
            <input type="hidden" name="requestType" value="pc"/>
--%>
            <input type="hidden" name="j_username"/>
            <%--<input type="hidden" id="j_yey" name="j_yey" value="${j_yey}" <c:if
                    test="${name!=null}"> disabled="disabled" </c:if>/>--%>

            <div class="box1">
                <span></span>
                <input type="text" class="form-control" id="j_username0" name="j_username0"
                       value="${enrollUsername}"/>
            </div>
            <div class="box1 box2"><!-- 有公共样式，在box1基础上修改 -->
                <span></span>
                <input type="password" class="form-control" id="j_password" name="j_password"
                       value="${j_password}"/>
            </div>
             <c:if test="${!empty message}">
                 <div style="color: red">${message}</div>
             </c:if>
            <div class="box3">
                <div class="box3-l">
                    <input type="checkbox" value="">
                    <span class="text-l">记住账号</span>
                </div>
                <div class="box3-r">
                    <span class="text-r"><a href="/pc/findPwd">忘记密码</a> </span>
                </div>
            </div>
            <input id="login" class="login-btn" type="submit" value="立即登录">

            <div class="box3">
                <div class="box3-l">
                    <span class="text-l4">账号登录</span>
                    <!-- 插件存放处 -->

                </div>
                <div class="box3-r">
                    <span class="text-r4"><a href="/pc/enroll">免费注册</a> </span>
                </div>
            </div>
        </form>
    </div>


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
<script type="text/javascript">

    /*初始聚焦form,如果username的cookie存在，获取cookie*/
    function init() {
/*
        var j_yey = document.getElementById("j_yey");
*/
        var j_username0 = document.getElementById("j_username0");
        var j_password = document.getElementById("j_password");
        if (${exist==null}) {
/*
            j_yey.value = getCookie("j_yey") == null ? j_yey.value : getCookie("j_yey");
*/
            j_username0.value = getCookie("j_username0") == null ? j_username0.value : getCookie("j_username0");
        }
        /*if (j_yey.value == "") {
            j_yey.focus();
        } else*/
        if (j_username0.value == "") {
            j_username0.focus();
        } else {
            j_password.focus();
        }
    }
    /*设置浏览器cookie: 名称 值 过期时间 路径 域 脚本可访问？*/
    function setCookie(name, value, expires, path, domain, secure) {
        document.cookie = name + "=" + escape(value)
                + ((expires) ? "; expires=" + expires.toGMTString() : "")
                + ((path) ? "; path=" + path : "")
                + ((domain) ? "; domain=" + domain : "")
                + ((secure) ? "; secure" : "");
    }
    /*获取cookie*/
    function getCookie(name) {
        var prefix = name + "=";
        var start = document.cookie.indexOf(prefix);
        if (start == -1) {
            return null;
        }
        var end = document.cookie.indexOf(";", start + prefix.length);
        if (end == -1) {
            end = document.cookie.length;
        }
        var value = document.cookie.substring(start + prefix.length, end);
        return unescape(value);
    }
    /*设置cookie*/
    function saveUsername(form) {
        var expires = new Date();
        expires.setTime(expires.getTime() + 24 * 30 * 60 * 60 * 1000); // sets it for approx 30 days.
/*
        setCookie("j_yey", document.getElementById('j_yey').value, expires, " / ");
*/
        setCookie("j_username0", form.elements['j_username0'].value, expires, " / ");
        var location = this.location.href.toString().substring(7);
        location = location.substring(location.indexOf('/'))
        setCookie("location", location, expires, " / ");
    }
    /*用户名密码为空，不能提交表单*/
    function validateForm(form) {

        saveUsername(form);

        if (form.elements['j_username0'].value == "") {
            alert('用户名不能为空');
            return false;
        }
        if (form.elements['j_password'].value == "") {
            alert('密码不能为空');
            return false;
        }
/*     form.elements['j_username'].value = form.elements['j_username0'].value + "," + form.elements['j_yey'].value + "," + form.elements['j_password'].value;
 */
        form.elements['j_username'].value = form.elements['j_username0'].value + ","  + form.elements['j_password'].value;
        return true;
    }
    /*用户名和密码非空才能提交表单,并且存储机构和用户名至cookie*/
    function loginSubmit() {
        var form = document.getElementById('loginForm');
        if (validateForm(form)) {
            document.getElementById('login').value = '登录中......';
            saveUsername(form);
            return true;
        } else {
            return false;
        }
    }
</script>
<!-- jiathis插件侧边栏 -->
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
</body>
</html>
