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
                <a href="/pc/static/footer-website-terms"><li class="footer-sub-2-but footer-sub-2s">网站条款
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
                <h1>网站条款</h1>
                <div class="join-section">
                    <h2>网站条款</h2>
                    <h2>专家汇网站用户服务协议</h2>
                    <p>欢迎访问专家汇！专家汇网站（591zjh.com）及相应的手机应用软件由北京语博信息科技有限公司负责运营，致力于打造以专家服务为核心的O2O平台，拉近专家与用户距离，使用户享受到公平、高质的专家服务。</p>
                    <p>请用户在访问和使用专家汇提供的服务前仔细阅读本协议。用户接受本协议点击“我已阅读并遵守专家汇服务条款”按钮完成注册，这表示用户与专家汇已达成协议并接受所有的服务条款。</p>
                </div>
                <div class="join-section">
                    <h2>一、专家汇服务</h2>
                    <p> 用户应了解并知悉，专家汇是为专家及用户提供服务信息发布与搜索的服务平台。用户与专家通过专家汇的平台服务，在双方之间达成独立的专家服务协议，并承担相应的权利和义务。如在服务过程中导致用户遭受相关财产及人身损害的，用户应直接向另一方追责，专家汇免于承担因用户和专家之间服务协议履行所致任何纠纷的赔偿责任。同时，专家汇建立了完善的客户服务体系，力争帮助或促使专家或用户妥善解决纠纷。</p>
                </div>
                <div class="join-section">
                    <h2>二、使用规则</h2>
                    <h2>  1、注册及账户</h2>
                    <p>为了使用专家汇提供的服务，用户需要注册一个专家汇账户。账户名即为用户所提供的常用手机号码（或邮箱），用户需设置密码并确认，通过专家汇下发的验证码进行账户验证后，该账户即完成初步注册。在个人中心里，用户需要设置相关个人信息。用户可以在账户中查询到自己的服务记录和资金情况。用户使用专家汇服务，应负责维护自己账户的保密性并限制第三方使用/访问其计算机或移动设备，用户对其账户和密码下发生的所有活动承担法律责任。</p>
                    <h2>  2、信息发布</h2>
                    <p>专家汇将专家填写的信息（包括但不限于个人信息、工作经历、服务内容等）公布于专家汇服务平台。专家汇认真履行注意义务，对入驻专家的身份证件等进行形式审核认证。但是，无法就其所有信息内容的准确性、完整性、真实性等做出实质保证。如果用户在专家汇张贴内容或提交材料，用户同意授予专家汇非独有的、免费的、永久的、不可撤销的和完全的许可权: 在全世界范围内，基于宣传专家汇服务等合法目的合理使用、转载、修改、改编、出版、翻译、创作衍生作品、分发和展示这些内容。</p>
                    <h2>  3、服务订单</h2>
                    <p>本条款所述“服务订单”，是指用户在专家汇平台上根据自身需求自行匹配达成的专家与用户之间的服务协议。用户在平台上搜索到合适的专家后，服务订单在下述时刻同时满足时正式成立:</p>
                    <p>( 1 ) 用户通过专家汇已支付服务费用；</p>
                    <p> ( 2 ) 用户通过专家汇联系到能够提供服务的专家并商定服务地点、时间等服务信息；</p>
                    <p>有服务时间时订单的修改、取消、退费等事项，请参见专家汇网站的具体规则介绍。</p>
                    <h2>  4、专家确认、服务确认、付款及点评</h2>
                    <p>用户根据自身需求自行匹配的预约服务在完成支付后订单生成，网站将显示专家/助理联系方式，同时短信通知专家/助理进行确认，专家/助理在网站或客户端进行专家确认后此订单协议正式生效，由专家按约定时间完成服务。</p>
                    <p>专家根据用户需求可选择上门服务或第三方地点服务，或线下方式进行授课。服务完成后由用户在网站或客户端进行服务确认，确认完毕系统将服务费用支付给专家。</p>
                    <p>专家履行完毕与用户达成的服务合同后，用户在网站或客户端上做出相应的评价，以便专家汇进一步改进服务。用户可以在专家汇平台发表对专家的评论、意见和其他内容，以及向平台提出建议、意见或其他信息，但是该等内容不得违反中国现行法律法规及其他规范性文件的要求，不得含有非法、淫秽、威胁、侮辱、诽谤、侵犯隐私、侵犯知识产权的内容或以其他形式对第三方权利构成侵犯。</p>
                    <p>专家汇在接到有关权利人的投诉与举报后将采取合理的删除或屏蔽等措施。基于用户的过错给专家汇造成损失时，用户须对专家汇承担赔偿责任。</p>
                </div>
                <div class="join-section">
                    <h2>三、双方权利义务及法律责任</h2>
                    <p>  1、专家汇享有对本协议约定服务的监督、提示、检查、纠正等权利。</p>
                    <p> 2、专家汇有权保留用户注册及使用时预留的所有信息。专家汇在线上线下针对专家汇服务进行宣传推广活动时，有权合理使用用户预留的信息。</p>
                    <p>  3、专家汇有权删除或屏蔽用户上传的非法及侵权信息。</p>
                    <p>  4、专家汇谨慎使用用户的所有信息，非依法律规定及用户许可，不得向任何第三方透露用户信息。</p>
                    <p>  5、专家汇为任何涉嫌侵权的权利人设置便捷的投诉与举报渠道，并依法采取合理救济措施。</p>
                    <p>  6、用户须为合法目的使用专家汇提供的平台服务。</p>
                    <p>  7、用户对其发布的信息的真实性及合法性承担法律责任。用户不得在专家汇平台上发布任何虚假、违法信息及言论。用户上传跟谁学的任何内容如涉嫌侵犯第三方权利的，用户须独立承担因此所产生法律责任。</p>
                    <p>  8、用户依据专家汇平台提供的信息达成约课订单的，应在线下或线上全面、适当履行约定义务并独立承担法律责任。</p>
                    <p> 9、用户仅对在跟专家汇享有的服务及内容享有使用权，未经专家汇或其他第三方权利人的书面许可，用户不得对包括视频、学习软件、学习资料、音频内容等在内的任何内容进行翻录、复制、发行等违反知识产权相关法律、法规的行为，由此所导致的一切民事、行政或刑事责任，由用户自行承担。</p>
                </div>
                <div class="join-section">
                    <h2>四、用户注意义务特别提示</h2>
                    <p>  用户上传专家汇平台的信息不得含有以下内容:</p>
                    <p>（一）反对宪法确定的基本原则的；</p>
                    <p>（二）危害国家统一、主权和领土完整的；</p>
                    <p>（三）泄露国家秘密、危害国家安全或者损害国家荣誉和利益的；</p>
                    <p>（四）煽动民族仇恨、民族歧视，破坏民族团结，或者侵害民族风俗、习惯的；</p>
                    <p>（五）宣扬邪教、迷信的；</p>
                    <p>（六）扰乱社会秩序，破坏社会稳定的；</p>
                    <p>（七）诱导未成年人违法犯罪和渲染暴力、色情、赌博、恐怖活动的；</p>
                    <p>（八）侮辱或者诽谤他人，侵害公民个人隐私等他人合法权益的；</p>
                    <p>（九）危害社会公德，损害民族优秀文化传统的；</p>
                    <p>（十）有关法律、行政法规和国家规定禁止的其他内容。</p>
                </div>
                <div class="join-section">
                    <h2>五、知识产权</h2>
                    <h2> 1、软件使用</h2>
                    <p> 用户需要下载专家汇提供的手机/pad软件并安装后方得以从客户端使用专家汇所提供的服务。专家汇在此授予客户免费的、不可转让的、非独占的全球性个人许可，允许客户使用由专家汇提供的、包含在服务中的软件。但是，客户不得复制、修改、发布、出售或出租专家汇的服务软件或所含软件的任何部分，也不得进行反向工程或试图提取该软件的源代码。</p>
                    <h2>  2、版权</h2>
                    <p>专家汇所包含或提供的所有内容诸如文字、图片、视频、声音文件片段、数字下载、软件等都是专家汇或其内容提供者的财产，受中国和国际版权法的保护。专家汇上所提供使用的所有软件都是专家汇或其软件供应商的财产，受中国和国际版权法的保护。未经专家汇书面许可，不得以任何形式通过任何方式复制、展示、修改、转让、分发、重新发布、下载、张贴或传输本网站的内容。</p>
                    <h2>  3、企业标识</h2>
                    <p>本网站服务所包含或者提供的图标、标识、网页页眉、按钮图标、文字等均为专家汇独有的合法企业标识。用户未经专家汇书面许可不得擅自使用，不得以任何方式或理由对本网站的标识的任何部分进行使用、复制、修改、传播或与其他产品捆绑使用，不得以任何可能引起消费者混淆的方式或任何诋毁或诽谤专家汇的方式用于任何商品或服务上。未经专家汇的书面许可，本网站上的任何内容都不应被解释为以默许或其他方式授予许可或使用本网站上出现的标识的权利。</p>
                </div>
                <div class="join-section">
                    <h2>六、免责条款</h2>
                    <p>  如发生以下情况，专家汇不对用户的直接或间接损失承担法律责任:</p>
                    <p>  1、专家汇系信息服务平台，不保证该等信息的准确性、有效性、及时性或完整性。提供信息的真实性、合法性等由信息提供者承担相关法律责任。</p>
                    <p>  2、不可抗力事件导致的服务中断或专家汇无法控制的原因所导致的用户损失，专家汇不承担任何责任。</p>
                    <p>  3、用户使用本网站（包括链接到第三方网站或自第三方网站链接）而可能产生的计算机病毒、黑客入侵、系统失灵或功能紊乱等导致的用户损失，专家汇不承担任何责任。</p>
                    <p>  4、由于用户将个人注册账号信息告知他人或与他人共享注册帐号，由此导致的任何风险或损失，由用户自行承担。</p>
                    <p>  5、专家与用户间或与任何第三人间的违约行为、侵权责任等，由有关当事人自行承担法律责任。</p>
                    <p>  6、如因系统维护或升级而需要暂停网络服务，专家汇将尽可能事先在本网站进行通知。</p>
                </div>
                <div class="join-section">
                    <h2>七、服务终止</h2>
                    <p>  用户在使用专家汇服务的过程中，具有下列情形时，专家汇有权终止对该用户的服务:</p>
                    <p>  1、用户以非法目的使用专家汇平台；</p>
                    <p>  2、用户不以预约服务的真实交易为目的使用专家汇平台；</p>
                    <p>  3、用户存在多次被投诉等不良记录的；</p>
                    <p>  4、其他侵犯专家汇合法权益的行为。</p>
                </div>
                <div class="join-section">
                    <h2>八、隐私声明</h2>
                    <p>专家汇承诺将按照本隐私声明收集、使用和披露用户信息，除本声明另有规定外，不会在未经用户许可的情况下向第三方或公众披露用户信息:</p>
                    <p> 1、用户信息的范围包括:用户注册的账户信息、用户上传的信息、专家汇自动接收的用户信息、专家汇通过合法方式收集的用户信息等。</p>
                    <p>  2、用户信息的收集、使用和披露</p>
                    <p>为了给用户提供更优质的服务，专家汇保留收集用户cookie信息等权利，专家汇不会向第三方披露任何可能用以识别用户个人身份的信息。只在如下情况下，专家汇会合法披露用户信息:</p>
                    <p>（1）经用户事先同意，向第三方披露。</p>
                    <p>（2）根据法律的有关规定，或者行政或司法机构的要求，向第三方或者行政、司法机构披露。</p>
                    <p>（3）其他根据法律、法规或者政策应进行的披露。</p>
                    <p>  3、用户信息的保护</p>
                    <p>（1）用户的账户均有安全保护功能，请妥善保管账户及密码信息。专家汇将通过服务器数据备份，确认技术上以实现安全的对用户密码进行加密等措施确保用户信息不丢失，不被滥用和变造。尽管有前述安全措施，但同时也请用户注意在信息网络上不存在“绝对的安全措施”。</p>
                    <p>（2）除非经过用户同意，专家汇不允许任何用户、第三方通过专家汇收集、出售或者无偿传播用户信息。</p>
                    <p>（3）专家汇含有到其他网站的链接，专家汇不对那些网站的隐私保护措施负责。当用户登录那些网站时，请提高警惕，保护个人隐私。</p>
                    <p></p>
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