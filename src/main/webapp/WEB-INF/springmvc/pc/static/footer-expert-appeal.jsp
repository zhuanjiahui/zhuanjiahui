<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <title>专家申诉</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/index.css">
    <script type="text/javascript" src="/scripts/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/scripts/zjh/zjh-public.js"></script>
</head>
<body>
<div id="wrap">
<!-- top顶部 -->
    <jsp:include page="../header.jsp"></jsp:include>
<!-- content部分 -->
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
    <div class="wrap0">

        <!-- footer-sub -->
        <div class="footer-sub">
            <!-- 左公共部分 -->
            <ul class="footer-sub-left">
                <a href="/pc/static/footer-know-us"><li class="footer-sub-1">关于我们</li></a>
                <a href="/pc/static/footer-know-us"><li class="footer-sub-2-but footer-sub-2s">了解我们
                    <div class="right-arrow">></div>
                </li></a>
                <a href="/pc/static/footer-successful-case"><li class="footer-sub-2-but footer-sub-2">成功案例
                    <div class="right-arrow">></div>
                </li></a>
                <a href="/pc/static/footer-event-announcements"><li class="footer-sub-2-but footer-sub-2">活动公告
                    <div class="right-arrow">></div>
                </li></a>
                <a href="/pc/static/footer-website-terms"><li class="footer-sub-2-but footer-sub-2">网站条款
                    <div class="right-arrow">></div>
                </li></a>
                <a href="/pc/static/footer-join-us"><li class="footer-sub-2-but footer-sub-2">加入我们
                    <div class="right-arrow">></div>
                </li></a>
                <a href="/pc/static/footer-contact-us"><li class="footer-sub-2-but footer-sub-2">联系我们
                    <div class="right-arrow">></div>
                </li></a>
            </ul>
            <!-- 右边部分 -->
            <div class="footer-sub-right">
                <h1>专家申诉保障</h1>
                <div class="join-section">
                    <h2>（一）取消订单</h2>
                    <dl>
                        <dt>1. 我什么时候能够取消订单？</dt>
                        <dd>（1）. 用户未支付的订单您可以随时取消，</dd>
                        <dd>（2）. 用户完成支付您未点击“专家确认“前必须告知用户后可以取消订单，</dd>
                        <dd>（3）. 点击“专家确认“后距离约定服务时间有超过十天安全期的情况，在告知用户后可以取消订单。（距约定服务时间小于十天安全期内取消订单系统按违约处理）</dd>
                    </dl>
                    <dl>
                        <dt>2. 我可以在哪里取消订单？</dt>
                        <dd>你可以在订单管理的订单信息点击“取消订单”按钮来取消。订单一旦取消不能恢复，需要填写取消订单的原因，如属于违约情况系统按违约处理。</dd>
                    </dl>
                    <dl>
                        <dt>3、用户如果取消订单我还能得到费用吗？</dt>
                        <dd>如果用户在距离约定服务时间有超过十天安全期的情况取消订单费用将会退还用户，如果没有在安全期内取消订单系统按违约处理，扣除的违约金会打入专家账户作为赔偿。</dd>
                    </dl>
                    <h2>（二）发起申诉</h2>
                    <dl>
                        <dt>1. 遇到不满意的情况我该如何申诉？</dt>
                        <dd>您可以直接拨打我们的客服电话010-59505007来申诉，我们为您解决。</dd>

                    </dl>
                </div>
            </div>
        </div>
    </div>
</div>
    <!-- 回到顶部 -->
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
<script type="text/javascript">
    $(function(){
        $(".footer-sub-2-but").click(function(){
            $(".footer-sub-2-but").removeClass("footer-sub-2s").addClass("footer-sub-2");

            $(this).removeClass("footer-sub-2").addClass("footer-sub-2s");

        });
    });

</script>
<!-- jiathis插件侧边栏 -->
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
</body>
</html>