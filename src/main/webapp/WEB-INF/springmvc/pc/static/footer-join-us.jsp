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
    <title>网站条款</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/index.css">
    <script type="text/javascript" src="/scripts/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/scripts/zjh/zjh-public.js"></script>
</head>
<body>
<div id="wrap">
<!-- top顶部 -->
<div class="top">
    <div class="top-sub">
        <div class=" top-l fl">
            <% MyUser user= AuthorizationUtil.getMyUser();
                if(user!=null&&user.getUsername()!=null){
                    pageContext.getOut().print("<a class=\"top-l1\" href=\"/pc/user/view\">"+user.getNavName()+"</a>");
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
                <li><a href="/pc/requirement/pageList?type=train&major=internet">互联网+</a></li>
                <li><a href="/pc/requirement/pageList?type=train&major=strategy">战略管理</a></li>
                <li><a href="/pc/requirement/pageList?type=train&major=manage">管理技能</a></li>
                <li><a href="/pc/requirement/pageList?type=train&major=hrm">人力资源</a></li>
                <li><a href="/pc/requirement/pageList?type=train&major=finance">财务管理</a></li>

            </ul>
            <ul class="">
                <li><a href="/pc/activity/pageList?type=1">专题培训</a></li>
                <li><a href="/pc/activity/pageList?type=2">行业趋势分享</a></li>
                <li><a href="/pc/activity/pageList?type=3">新产品试用</a></li>
                <li><a href="/pc/activity/pageList?type=4">创业分享沙龙</a></li>
                <li><a href="/pc/activity/pageList?type=5">项目路演</a></li>

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
                <a href="/pc/static/footer-event-announcements"><li class="footer-sub-2-but footer-sub-2">活动公告
                    <div class="right-arrow">></div>
                </li></a>
                <a href="/pc/static/footer-website-terms"><li class="footer-sub-2-but footer-sub-2">网站条款
                    <div class="right-arrow">></div>
                </li></a>
                <a href="/pc/static/footer-join-us"><li class="footer-sub-2-but footer-sub-2s">加入我们
                    <div class="right-arrow">></div>
                </li></a>
                <a href="/pc/static/footer-contact-us"><li class="footer-sub-2-but footer-sub-2">联系我们
                    <div class="right-arrow">></div>
                </li></a>
            </ul>
            <!-- 右边部分 -->
            <div class="footer-sub-right">
                <h1>加入我们</h1>
                <div class="join-section">
                    <h2>技术:JAVA高级开发工程师</h2>
                    <dl>
                        <dt>职位描述  岗位职责:</dt>
                        <dd>1、  参与产品需求的分析、系统开发设计和数据库设计等工作； </dd>
                        <dd>2、 熟练掌握Spring、SpringMVC、Mybatis、servlet、Javascript、Jquery、Ajax、Webservice等主流开发技术，熟悉MVC设计模式；</dd>
                        <dd>3、 熟练使用Tomcat、Apache，Nginx等应用和服务器配置；</dd>
                        <dd>4、  协助技术总监做团队任务分解、计划制定。</dd>
                    </dl>
                    <dl>
                        <dt>任职要求: </dt>
                        <dd>1、 具有3年以上Java研发工作经验，1年以上电商类产品开发经验；</dd>
                        <dd>2、  根据团队任务分配承担项目核心代码的编写，配合技术总监进行技术难点攻关；</dd>
                        <dd>3、 对初中级工程师技术培训和日常工作指导；</dd>
                        <dd>4、 熟练掌握Mysql等主流数据库，精通SQL编写和优化；  </dd>
                        <dd>5、 了解UML等建模语言、PowerDesigner等设计常用工具； </dd>
                        <dd>6、  规范化的编程风格；较强的独立工作能力和团队协作精神；有较好的沟通表达能力； </dd>
                        <dd>7、有redis、dubbo、mongodb、Memcache实际开发经验者优先。</dd>
                    </dl>
                </div>
                <div class="join-section">
                    <h2>产品:产品经理</h2>
                    <dl>
                        <dt>职位描述  岗位职责:</dt>
                        <dd>1、 负责对产品功能需求进行系统规划分析，并做分析对比；</dd>
                        <dd>2、 负责产品PC端的规划、策划、思维导图描绘、产品需求的技术难度评审、产品启动准备工作；</dd>
                        <dd>3、 制定产品的细分功能规划，负责产品需求市场调研、竞品分析、产品策划；</dd>
                        <dd>4、 具体策划产品功能、业务流程，设计产品原型，编写相关产品文档；</dd>
                        <dd>5、 负责跟踪协调设计部门完成产品平面设计及前端页面制作，并改进优化提升产品UI和UE体验；</dd>
                        <dd>6、 跟技术和项目部门沟通，实施产品开发，并跟进开发进度和质量；</dd>
                        <dd>7、 产品开发完成，配合测试部门完成上线前的产品全面测试工作，并按时上线发布；</dd>
                        <dd>8、 策划产品上线后的运营推广策略，通过产品设计增加产品的用户量和品牌渗透力；</dd>
                        <dd>9、 跟进产品运营推广结果的各项数据及时完善产品功能和体验，完成产品的迭代更新。</dd>
                    </dl>
                    <dl>
                        <dt>任职要求:</dt>
                        <dd>1、 大专以上学历，市场营销或计算机专业，了解JAVA开发技术优先；</dd>
                        <dd>2、 2年以上电商产品策划经验，对电商网站发展趋势有深入了解，有过移动客户端电商APP产品策划经验优先；</dd>
                        <dd>3、 热爱电商产品，关注电商产品发展和用户体验；能够深入分析和规划电商产品结构、功能和流程；</dd>
                        <dd>4、 具有优秀的团队合作精神、敬业精神，良好的沟通技巧，能和技术、测试高效沟通；</dd>
                        <dd>5、具有很强的事业进取心与自我激励能力，能承受快速发展型企业带来的工作压力。</dd>
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