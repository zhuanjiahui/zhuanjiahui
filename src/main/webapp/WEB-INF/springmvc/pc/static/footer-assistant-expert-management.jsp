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
    <title>助理专家管理</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/index.css">
    <script type="text/javascript" src="/scripts/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/scripts/zjh/zjh-public.js"></script>
</head>
<body>
<div id="wrap">
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
                <h1>专家管理</h1>
                <div class="join-section">
                    <h2>（一）添加专家</h2>
                    <dl>
                        <dt>1. 应该在哪里添加专家？</dt>
                        <dd>请在助理个人中心“专家管理”中添加专家，添加专家必须要获取目标专家账号密码进行验证才能完成添加。（只有通过验证的专家平台上才能搜索到）</dd>
                        <br />
                        <dd><img src="/images/footer-expert.png" alt="专家管理"></dd>
                    </dl>
                    <br />
                    <br />
                    <dl>
                        <dt>2. 我要添加的专家之前并未在平台注册该怎么办？</dt>
                        <dd>您必须取得专家授权委托后代表专家在平台上注册专家账号，账号必须为专家手机号，注册成功后再助理个人中心中添加专家并完成验证。</dd>
                    </dl>
                </div>
                <div class="join-section">
                    <h2>（二）编辑专家</h2>
                    <dl>
                        <dt>1. 编辑专家的内容比较多，可以不填吗？</dt>
                        <dd>专家个人资料与服务内容是必填信息，只有完成必填信息才有可能通过平台验证，没有通过平台验证的专家是无法再平台上搜索到的。</dd>
                    </dl>
                </div>
                <div class="join-section">
                    <h2>（三）设置档期</h2>
                    <dl>
                        <dt>1. 在助理的专家管理中设置的档期与专家自己账户设置的档期会冲突吗？</dt>
                        <dd>专家汇采用数据同步技术，专家账号的当期管理与助理账号的专家管理档期为数据同步，不会出现冲突现象。</dd>
                    </dl>
                </div>
            </div>
        </div>
    </div>
    <!-- 回到顶部 -->
    <a href="javascript:;" id="btn" title="回到顶部"></a>
    </div>
    <!-- footer部分 -->
<jsp:include page="../footer.jsp"></jsp:include>
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