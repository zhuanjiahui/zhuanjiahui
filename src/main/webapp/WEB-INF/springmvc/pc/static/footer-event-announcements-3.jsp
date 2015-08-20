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
    <title>活动公共</title>
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
                <a href="/pc/static/footer-know-us"><li class="footer-sub-2-but footer-sub-2">了解我们
                    <div class="right-arrow">></div>
                </li></a>
                <a href="/pc/static/footer-successful-case"><li class="footer-sub-2-but footer-sub-2">成功案例
                    <div class="right-arrow">></div>
                </li></a>
                <a href="/pc/static/footer-event-announcements"><li class="footer-sub-2-but footer-sub-2s">活动公告
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
                <h1>活动公告</h1>
                <p>专家汇走进金创孵化园</p>
                <p>活动举办时间:7月2号（星期六）下午13:30</p>
                <p>活动主题:【专家汇O2O篇】专家汇走进金创孵化园 </p>
                <p>活动地点:金创孵化园</p>
                <p>主办单位:专家汇</p>
                <p>活动规模:100</p>
                <p>活动嘉宾:互联网行业资深专家及传统企业高管</p>
                <p>活动内容:</p>
                <p>本次活动以传统企业互联网转型，专家汇诚邀互联网行内资深人士与到场嘉宾分享互联网思维和传统企业转型经验，为各位传统企业高</p>
                <p>管以后互联网转型及发展提供参考借鉴</p>
                <p>邀请嘉宾: 差旅报销CEO肖宁、神州数码雷鸣、为知笔记副总裁刘晓攀、多盟王云鹏、御银股份副董事长高永坚、北京圣世通信CEO张</p>
                <p>越胜、联信智源高宇英、天天投崔鹏、云子袁晓飞、专家汇联合创始人邓博。</p>
                <p style="margin:20px 0 20px 0">活动日程:</p>
                <table border="1px" class="event-table">
                    <tr>
                        <td class="event-td">时间</td>
                        <td class="event-td">内容</td>
                    </tr>
                    <tr>
                        <td class="event-td">13:30 - 14:00</td>
                        <td class="event-td">签到，自由交流</td>
                    </tr>
                    <tr>
                        <td class="event-td">14:00 - 14:10</td>
                        <td class="event-td">专家汇CEO夏语</td>
                    </tr>
                    <tr>
                        <td class="event-td">14:10 - 14:30</td>
                        <td class="event-td">专家汇联合创始人邓博</td>
                    </tr>
                    <tr>
                        <td class="event-td">14:30 - 14:50</td>
                        <td class="event-td">北京圣世通信张越胜</td>
                    </tr>
                    <tr>
                        <td class="event-td">14:50 - 15:10</td>
                        <td class="event-td">天天投崔鹏</td>
                    </tr>
                    <tr>
                        <td class="event-td">15:10 - 15:30</td>
                        <td class="event-td">云子袁晓飞</td>
                    </tr>
                    <tr>
                        <td class="event-td">15:30 - 15:40</td>
                        <td class="event-td">下午茶</td>
                    </tr>
                    <tr>
                        <td class="event-td">15:40 - 16:00</td>
                        <td class="event-td">神州数码雷鸣</td>
                    </tr>
                    <tr>
                        <td class="event-td">16:00 - 16:20</td>
                        <td class="event-td">为知笔记刘晓攀</td>
                    </tr>
                    <tr>
                        <td class="event-td">16:20 - 16:40</td>
                        <td class="event-td">御银股份高永坚</td>
                    </tr>
                    <tr>
                        <td class="event-td">16:40 - 17:00</td>
                        <td class="event-td">游金创孵化园</td>
                    </tr>
                </table>
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