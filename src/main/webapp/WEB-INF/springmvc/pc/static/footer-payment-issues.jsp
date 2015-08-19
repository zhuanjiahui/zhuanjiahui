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
    <title>支付问题</title>
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
						<input type="text" name="words" value="" placeholder="关键字、课程">
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
                <a href="/pc/static/footer-platform-process"><li class="footer-sub-1">帮助中心</li></a>
                <a href="/pc/static/footer-platform-process"><li class="footer-sub-2-but footer-sub-2">平台流程
                    <div class="right-arrow">></div>
                </li></a>
                <a href="/pc/static/footer-expert-settled"><li class="footer-sub-2-but footer-sub-2">专家入驻
                    <div class="right-arrow">></div>
                </li></a>
                <a href="/pc/static/footer-user-help"><li class="footer-sub-2-but footer-sub-2">用户帮助
                    <div class="right-arrow">></div>
                </li></a>
                <a href="/pc/static/footer-assistant-help"><li class="footer-sub-2-but footer-sub-2">助理帮助
                    <div class="right-arrow">></div>
                </li></a>
                <a href="/pc/static/footer-expert-help"><li class="footer-sub-2-but footer-sub-2s">专家帮助
                    <div class="right-arrow">></div>
                </li></a>
            </ul>
            <!-- 右边部分 -->
            <div class="footer-sub-right">
                <h1>支付问题</h1>
                <p><b>支付问题</b></p>
                <p>专家汇购买服务我怎么付款?</p>
                <p>在专家汇购买服务，付款方式有多种选择:</p>
                <pre> 1. 使用开通网上支付功能的银行卡或信用卡支付。一次操作，方便终生。（推荐）</pre>
                <pre> 2. 用专家汇余额或他人支付宝进行支付。</pre>
                <p>我预约了专家服务，但是不想要了怎么办?</p>
                <p>如果已经预约了服务但还没付款，可以在我的预约中删除订单或24小时以后系统自动删除订单。</p>
                <p>我预约了专家服务，是不是别人就不能预约了?</p>
                <p>预约了专家服务后档期会变为黄色抢约状态，其他用户扔可以下单，只有完成支付后档期才会变为灰色不可约状态，即不能再预约下单，所以下了单的小伙伴要抢时间支付噢！专家时间有限，最先完成支付的小伙伴才是最终客户，其余未抢到用户会提示订单已被抢，并自动删除该订单。</p>
                <p>如果到约定时间专家没有实施服务，或实施服务有问题怎么办?</p>
                <p>付款后，专家才会在约定时间服务，账款不会立即支付给专家或助理；若专家没有在约定时间服务，或服务有问题，可联系客服，投诉并申请退款，经专家汇审核后将退款给您。</p>
                <p>我预定的时间专家或助理说需要调整了，我该怎么办?</p>
                <p>同意即由专家或助理修改订单时间，不同意您可在下订单三小时内点击“取消订单”，由专家汇给您退款</p>
                <p>我已经支付过了，但是不想要了怎么办?</p>
                <p>仔细阅读违约条款，未在违约范围内条件可直接取消订单，由专家汇给您全额退款；若在违约范围内条件取消订单，则扣除条款标明的相应违约金;</p>
                <p>可以拨打专家汇400电话，进行人工服务取消，但同样遵守违约条款</p>
                <p>没有专家实施服务，钱会打给专家吗?</p>
                <p>专家实施服务结束后，用户在一定时间内未确认支付，钱将自动打给专家。</p>
                <p>在约定时间专家未实施服务，可拨打400电话投诉，申请退款，经客服确认审核后由专家汇给用户退款，并附带扣除专家违约金作为用户补偿</p>
                <p>专家能不能随意取消订单，对我造成影响损失怎么办?</p>
                <p>根据专家汇违约条款，专家如果在违约范围内条件取消订单，则相应的违约金将作为对用户的补偿打至用户账户</p>
                <p>订单管理中的订单确认是什么意思?</p>
                <p>为了保证用户权益，防止专家时间调整形成违约，所有订单在确认后作为正式成立，若专家未在24小时</p>
                <p>内确认订单，系统将自动取消订单，由专家汇给您退款，专家确认订单后若取消则按违约条款处理</p>
                <p>确认支付后钱打给专家了，专家未按约定实施服务怎么办?</p>
                <pre> 1. 您可以通过电话联系专家或助理要求退款；</pre>
                <pre> 2. 自己找专家或助理无法获得退款时，可拨打专家汇400电话，专家汇客服会帮助处理</pre>
                <p>交易结束后，我对专家服务不满意想退款怎么办?</p>
                <pre> 1. 您可以通过电话联系专家或助理要求退款；</pre>
                <pre> 2. 自己找专家或助理无法获得退款时，可拨打专家汇400电话，专家汇客服会帮助处理</pre>
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