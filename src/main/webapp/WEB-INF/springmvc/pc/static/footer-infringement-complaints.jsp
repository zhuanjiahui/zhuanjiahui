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
    <title>投诉侵权</title>
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
                <a href="/pc/static/footer-service-guarantee"><li class="footer-sub-1">服务支持</li></a>
                <a href="/pc/static/footer-service-guarantee"><li class="footer-sub-2-but footer-sub-2">服务保障
                    <div class="right-arrow">></div>
                </li></a>
                <a href="/pc/static/footer-infringement-complaints"><li class="footer-sub-2-but footer-sub-2s">投诉侵权
                    <div class="right-arrow">></div>
                </li></a>
                <a href="/pc/static/footer-feedback"><li class="footer-sub-2-but footer-sub-2">意见反馈
                    <div class="right-arrow">></div>
                </li></a>
            </ul>
            <!-- 右边部分 -->
            <div class="footer-sub-right">
                <h1>侵权投诉</h1>
                <p>任何企业或个人如认为专家汇网站中的内容涉嫌侵犯其知识产权或相关合法权益，均可及时向专家汇提出书面权利通知，并提供身份</p>
                <p>证明、权属证明及详细侵权情况证明。专家汇在收到上述文件后会依法及时采取删除、屏蔽、断开链接等必要措施。具体步骤如下:</p><br><br>
                <p>一、权利通知</p>
                <p> 1、权利通知的内容应包括:</p>
                <pre>   权利人的权属证明；</pre>
                <pre>   明确描述侵权内容；</pre>
                <pre>   明确指明侵权内容的位置，包括网页地址和网页内的位置；</pre>
                <pre>   权利要求。</pre>
                <p>  2、请提供权利人详细的联络方式，个人请提供姓名、身份证或护照复印件、电话、通信地址、邮编等。企业请提供法人资质文件复印件</p>
                <pre>   （加盖公章）、联系人、电话、通信地址、邮编等。</pre>
                <pre>   请注意:如果权利通知的内容失实，权利通知提交者将承担由此造成的全部法律责任。</pre><br><br>
                <p>二、反通知</p>
                <pre>   专家汇根据前述权利通知依法及时采取删除、屏蔽、断开链接等必要措施后，被删除、屏蔽、断开链接的内容提供者可以依法向专家</pre>
                <pre>   汇发出关于其内容不侵权的反通知。反通知发出后，专家汇可以采取恢复措施。前述权利通知发出人无权要求专家汇再行采取删除、</pre>
                <pre>   屏蔽、断开链接等措施。</pre>
                <p>1、反通知的内容应包括:</p>
                <pre>   反通知人的权属证明；</pre>
                <pre>   充分描述不构成侵权的理由；</pre>
                <pre>   明确指明要求恢复的内容、措施及网址；</pre>
                <p>2、请提供反通知人详细的联络方式，个人请提供姓名、身份证或护照复印件、电话、通信地址、邮编等。单位请提供法人资质文件复印</p>
                <pre>   件（加盖公章）、联系人、电话、通信地址、邮编等。</pre>
                <pre>   请注意:如果“反通知”的内容失实，反通知人将承担由此造成的全部法律责任。</pre><br><br><br>

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