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
    <title>交易流程</title>
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
                <h1>交易流程</h1>
                <div class="join-section">
                    <h2>（一）修改订单</h2>
                    <dl>
                        <dt>1. 已支付的订单专家要换个时间怎么办？</dt>
                        <dd>在点击“专家确认“前拥有修改订单日期机会，点击订单右下角位置修改进入到日期弹出框，橙色代表原有订单，您可以根据需求选择日期进行修改，保存后点击“专家确认“则订单生效，生效后无法修改。</dd>
                    </dl>
                    <dl>
                        <dt>2. 修改后订单原来的日期有什么变化，用户订单会也会改变吗？</dt>
                        <dd>修改后订单原来的日期会变为灰色不可约不可设定状态，修改完成点击“专家确认“后用户订单同样会改变。</dd>
                    </dl>
                    <h2>（二）专家确认</h2>
                    <dl>
                        <dt>1.	我没有点击“专家确认“，有什么影响？</dt>
                        <dd>如果您为在接到订单通知24小时之内点击“专家确认“，系统会认为您默认取消订单，订单自动取消，专家汇将对用户进行退款。</dd>
                    </dl>
                    <h2>（三）全付与预付</h2>
                    <dl>
                        <dt>1.	全付与预付有什么区别？</dt>
                        <dd>全付是指用户一次性将费用打入，确保了您的资金安全，避免后续不结款等问题，平台希望用户将费用一次性结算清楚，所以设定了全额优惠价来促使用户全额付款；</dd>
                        <dd>预付是指用户打入50%预付款，服务后再将余款打入，此方案用户无法享受优惠折扣。</dd>
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