
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <title>找回密码</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/register.css">
    <script src="/scripts/jquery-1.8.3.min.js"></script>
    <script src="/scripts/validate/jquery.validate.js"></script>
    <script src="/scripts/zjh/register.js"></script>
</head>
<body>
<div id="wrap">
    <!-- header部分 -->
    <div class="header clear">
        <div class="logo fl">
            <a href="/pc/index"><img src="/images/logo.png" alt="logo"></a>
        </div>
        <div class="header-right fr">
            <span>hi，欢迎来的专家汇</span>
            <i>|</i>
            <a href="/pc/login">立即登录</a>
            <i>|</i>
            <a href="/pc/index">返回首页</a>
            <span>400-910-910</span>
        </div>
    </div>
</div>
<div class="line"></div>
<!-- content部分 -->
<div class="content">
    <form id="reg-form" name="expert" action="/pc/resetPassword" method="post" autocomplete='off'>

        <div class="box fl">
            <label>手机号</label>
				<span class="box-sub" style="position:relative;">
					<input id="username" type="text" value="" placeholder="手机号" maxlength="50" name="username" style="border:none;">
					<input type="button" id='verificationCode' value="获取验证码" >
				</span>
            <span id="nameMsg"></span>
        </div>
        <div class="box fl">
            <label>验证码</label>
				<span class="box-sub">
					<input id="captcha" class="new-input" type="text" value="" placeholder="输入验证码" maxlength="6" name="captcha">
				</span>
            <br />
            <img src="/pc/captcha" id="kaptchaImage" class=""/>
            <a href="#" onclick="changeCode()">看不清?换一张</a>
            <span></span>
        </div>
        <div class="box fl">
            <label>校验码</label>
				<span class="box-sub">
					<input id="checkCode" class="new-input" type="text" value="" placeholder="输入校验码" maxlength="6" name="verificationCode">
				</span>
            <span></span>
        </div>
        <div class="box fl">
            <label>新密码</label>
				<span class="box-sub">
					<input class="new-input" type="password" value="" placeholder="输入密码" maxlength="12" name="password" id="password">
				</span>
            <span></span>
        </div>
        <div class="box fl">
            <label>确认密码</label>
				<span class="box-sub">
					<input class="new-input" type="password" value="" placeholder="确认密码" maxlength="12" name='rePassword'>
				</span>
            <span></span>
        </div>

        <div class="box-bottom fl">
            <div class="bottom-sub">
                <input class="bottom-btn" type="submit" value="重置密码">
            </div>
        </div>
    </form>
</div>
<a href="javascript:;" id="btn" title="回到顶部"></a>
<!-- footer部分 -->
<div class="footer" style="width: 100%;background: #efefef;">
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
</body>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
<script type="text/javascript">
    var userNameFlag=false;
    var checkCodeFlag=false;
    var imageCodeFlag=false;
    $(function(){
        $("#username").blur(function(){
            //获取校验图片
            $('#kaptchaImage').hide().attr('src', '/pc/kaptcha?' + Math.floor(Math.random()*100) ).fadeIn();
            event.cancelBubble=true;

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
                        if (result) {
                            userNameFlag = false;
                            $("#nameMsg").html("<span style='color: #ff0000'>用户名不存在</span>");
                        } else {
                            userNameFlag = true;
                            $("#nameMsg").html("");
                        }
                    }
                })
            }
        })
        $("#username").focus(function(){
            $("#nameMsg").html("");
        })
        $("#checkCode").blur(function(){
            $.ajax({
                url:"/pc/validation/checkCode",
                type:"get",
                data:{
                    phone:$("#username").val(),
                    validationCode:$("#checkCode").val()
                },
                dataType:"json",
                success:function(data){
                    if(data){
                        checkCodeFlag=true;
                    }
                },
                error:function(){

                }
            })
        })
        $("#captcha").blur(function(){
            $.ajax({
                url:"/pc/checkImgCode",
                type:"post",
                data:{
                    captcha:$("#captcha").val()
                },
                dataType:"json",
                success:function(data){
                    if(data){
                        imageCodeFlag=true;
                    }
                }
            })
        })
        $("#verificationCode").click(function(){
            if(userNameFlag&&imageCodeFlag){
                time($("#verificationCode"));
                $.ajax({
                    url:"/pc/validation/send",
                    type:"get",
                    data:{
                        phone:$("#username").val()
                    },
                    dataType:"json",
                    success:function(data){

                    }
                })
            }
        })
        $('#registerBt').click(function(){
            if(userNameFlag&&checkCodeFlag){
                $('#reg-form').submit();
            }
        });
    })


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
    //获取图片验证码
    $(function(){
        $('#kaptchaImage').hide().attr('src', '/pc/kaptcha?' + Math.floor(Math.random()*100) ).fadeIn();
        event.cancelBubble=true;
    });
    function changeCode() {
        $('#kaptchaImage').hide().attr('src', '/pc/kaptcha?' + Math.floor(Math.random()*100) ).fadeIn();
        event.cancelBubble=true;
    }
</script>
</html>