<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ page import="com.frame.organization.model.MyUser" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/6
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <title>专家个人中心</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/public-css-style.css">
    <link rel="stylesheet" href="/theme/main.css">
    <script type="text/javascript" src="/scripts/jquery-1.8.0.min.js"></script>
    <script src="/scripts/uploadify/jquery.uploadify.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/zjh/zjh-public.js"></script>
    <script type="text/javascript" src="/scripts/My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="/scripts/imgare/imgareaselect-animated.css" />
    <script src="/scripts/imgare/jquery.imgareaselect.pack.js"></script>
    <style type="text/css">
        #bg{ display: none; position: fixed; top: 20%; left: 34%; width: 32%; height: 60%; background-color: gray; z-index:1001; opacity:0.7;filter:alpha(opacity=70);}
        #big{display: none; position: fixed; top: 25%; left: 36%; width: 18%; height: 40%; padding: 8px; border: 8px solid #E8E9F7; background-color: white; z-index:1002; overflow: auto;}
        #sma{display: none; position: fixed; top: 25%; left: 58%; width: 6%; height: 12%; padding: 8px; border: 8px solid #E8E9F7; background-color: white; z-index:1002; overflow: auto;}
        #sure{display: none; position: fixed; top: 70%; left: 40%; width:120px; height:25px;z-index:1002; overflow: auto;}
        #cancel{display: none; position: fixed; top: 70%; left: 50%; width:120px; height:25px;z-index:1002; overflow: auto;}

        .elem{display:inline-block;height:20px;position:relative;}
    </style>



    <script type="text/javascript">
        var x, y, w, h,url;
        $(function () {
            $('#big').imgAreaSelect({ aspectRatio: '1:1', handles: true,fadeSpeed: 200, onSelectChange: preview });
            $("#expertPicUpload").uploadify({
                swf: '/scripts/uploadify/uploadify.swf?m=' + Math.random(),
                uploader: '/pc/user/uploadPic',
                fileTypeExts: '*.jpg;*.jpeg;*.gif;*.png',
                //浏览按钮的宽度
                width: '100',
                //浏览按钮的高度
                height: '32',
                multi: false,
                buttonText: '<a class="le-wz">上传头像</a>',
                onUploadSuccess: function (file, data, response) {
                    document.getElementById("bg").style.display ="block";
                    document.getElementById("big").style.display ="block";
                    document.getElementById("sma").style.display ="block";
                    document.getElementById("sure").style.display ="block";
                    document.getElementById("cancel").style.display ="block";
                    $("#photo").attr("src","http://pic.591zjh.com/"+eval(data));
                    $("#sma img").attr("src","http://pic.591zjh.com/"+eval(data));
                    url=eval(data);
                    console.log(url);
                }
            })
        })
        function preview(img, selection) {
            if (!selection.width || !selection.height)
                return;

            var scaleX = 100 / selection.width;
            var scaleY = 100 / selection.height;

            $('#sma img').css({
                width: Math.round(scaleX * 300),
                height: Math.round(scaleY * 300),
                marginLeft: -Math.round(scaleX * selection.x1),
                marginTop: -Math.round(scaleY * selection.y1)
            });
            x=selection.x1;
            y=selection.y1;
            w=selection.width;
            h=selection.height;
        }
        function sureButton(){

            $("#picUrl").val(url+"@"+x+"-"+y+"-"+w+"-"+h+"a");
            $("#head").attr("src","http://pic.591zjh.com/"+url+"@"+x+"-"+y+"-"+w+"-"+h+"a");
            $("#floatDiv").hide();

        }
        function cancelButton(){
            $("#floatDiv").hide();
        }

    </script>
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
    <div class="text-border fl">
        <img src="/images/text-border.png" alt="text-border">
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
</div>
<!-- content部分 -->
<div class="content clear">
<!-- 导航部分 -->
<div class="nav">
    <ul>
        <li class="nav-1"><a href="/pc/index">首页</a></li>
        <li><a href="/pc/schedule/view">账号管理</a></li>
        <li><a href="/pc/expert/viewPersonal">中心</a></li>
        <li><a href="/pc/requirement/myPublish">我的需求</a></li>
        <li><a href="/pc/activity/myActivity">我的活动</a></li>
        <li><a href="#">消息</a></li>
    </ul>
</div>
<div class="content-sub">
    <div class="content-sub1">
        <div class="content-sub2"><img src="/images/order-bg2.png" alt="背景图文字部分"></div>
    </div>
</div>
<div id="wrap2">
<div class="content-sidebar fl">
    <dl>

        <dt><a href="/pc/expert/viewPersonal">基本资料</a></dt>
        <dd><a href="/pc/expert/viewPersonal">个人资料</a></dd>
        <c:if test="${myUser.utype==2}">
            <dd><a href="/pc/expertServe/add">服务内容</a></dd>
        </c:if>
        <dd><a href="/pc/user/myBalance">资金管理</a></dd>
        <dd><a href="/pc/bindPhone">修改账户</a></dd>
        <dd><a href="/pc/resetPwd">重置密码</a></dd>
    </dl>
    <dl>
        <dt class="order-icon2"><a href="/pc/purchaseOrder/myOrders">账号管理</a></dt>
        <dd><a href="/pc/purchaseOrder/myOrders">订单管理</a></dd>
        <c:if test="${myUser.utype==3}">
            <dd><a href="/pc/assistant/myExperts">专家管理</a></dd>
        </c:if>
        <c:if test="${myUser.utype==2}">
            <dd><a href="/pc/schedule/view">档期管理</a></dd>
        </c:if>
        <dd><a href="/pc/requirement/myPublish">需求管理</a></dd>
        <dd><a href="/pc/activity/myActivity">活动管理</a></dd>
    </dl>

    <dl>
        <dt class="order-icon3"><a href="/pc/favorite/listExpert">我的收藏</a></dt>
        <dd><a href="/pc/favorite/listExpert">收藏专家</a></dd>
    </dl>
    <dl>
        <dt class="no-border"><a href="#">我的消息</a></dt>
    </dl>
</div>
<div class="content-head clear">
    <span class="content-head1">hi,你好,${myUser.name}</span>
    <span class="content-head2">上次登录时间:${myUser.lastLogintime}</span>
</div>
<div class="content-body">
<ul class="body-nav">
    <li class="nav-li h-color"><a href="#">专家资料</a> </li>

</ul>
<div class="body-sub">
<div class="Personal-information">
    <img src="/images/duihao.gif">
    完善个人资料信息
</div>
<div class="pi-inf-table">
<form id="expert" name="expert" action="/pc/assistant/saveExpert" method="post">
<input  type="hidden" name="expertId" value="${expert.id}">
<input id="picUrl" type="hidden" name="pictureUrl" value="${expert.pictureUrl}">
<div class="pi-inf-tr">
    <div class="pi-inf-td-l">
        姓名:
    </div>
    <div class="pi-inf-td-r">
        <input class="pi-input-css" type="text" value="${expert.name}" name="name"/>
    </div>
</div>
<div class="pi-inf-tr">
    <div class="pi-inf-td-l">
        性别:
    </div>
    <div class="pi-inf-td-r">
        <zjh:status name="gender" dataType="Expert.gender" type="radio" checkedValue="${expert.gender}"></zjh:status>
    </div>

</div>
<div class="pi-inf-tr">
    <div class="pi-inf-td-l">
        出生日期:
    </div>
    <div class="pi-inf-td-r">
        <input type="text" class="Wdate" id="birthday" name="birthdayDate" value="<fmt:formatDate value="${expert.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate>" style="width:120px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})">
    </div>
</div>
<div class="pi-inf-tr">
    <div class="pi-inf-td-l">
        工作年限:
    </div>
    <div class="pi-inf-td-r">
        <select name="workTime">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
            <option value="19">19</option>
            <option value="20">20</option>
        </select>
    </div>
</div>
<div class="pi-inf-tr">
    <div class="pi-inf-td-l">
        所在公司:
    </div>
    <div class="pi-inf-td-r">
        <input class="pi-input-css" type="text" value="${expert.companyName}" name="companyName"/>
    </div>

</div>
<div class="pi-inf-tr">
    <div class="pi-inf-td-l">
        公司地址:
    </div>
    <div class="pi-inf-td-r">
        <input class="pi-input-css" type="text" value="${expert.companyAddress}" name="companyAddress"/>
    </div>
</div>
<div class="pi-inf-tr">
    <div class="pi-inf-td-l">
        现任职务:
    </div>
    <div class="pi-inf-td-r">
        <input class="pi-input-css" type="text" value="${expert.preposition}" name="preposition"/>
    </div>

</div>
<div class="pi-inf-tr">
    <div class="pi-inf-td-l">
        最高职务:
    </div>
    <div class="pi-inf-td-r">
        <input class="pi-input-css pi-zuigaoziwu" type="text" value="${expert.chief}" name="chief" placeholder="公司简称与职涯最高职务(10个字内)"/>
    </div>

</div>
<div class="pi-inf-tr">
    <div class="pi-inf-td-l">
        是否在职:
    </div>
    <div class="pi-inf-td-r">
        <input type="radio" name="isCheif" value="true" checked>是
        <input type="radio" name="isCheif" value="false" >否

    </div>
</div>
<div class="pi-inf-tr">
    <div class="pi-inf-td-l">
        自由专家:
    </div>
    <div class="pi-inf-td-r">
        <zjh:status name="freedom" dataType="Expert.freedom" type="radio" checkedValue="${expert.freedom}"></zjh:status>
    </div>
</div>
<div class="pi-inf-tr">
    <div class="industry">
        <label>行业:</label>
        <ul class="industryElem">
            <li><input type="checkbox" name="industrys" value="khy">跨行业</li>
            <li><input type="checkbox" name="industrys" value="hlw">互联网</li>
            <li><input type="checkbox" name="industrys" value="tz">投资</li>
            <li><input type="checkbox" name="industrys" value="xfdz">消费电子</li>
            <li><input type="checkbox" name="industrys" value="tx">通信</li>
            <li><input type="checkbox" name="industrys" value="zhzy">制造业</li>
        </ul>
        <ul class="industryElem">
            <li><input type="checkbox" name="industrys" value="yhbx">银行保险</li>
            <li><input type="checkbox" name="industrys" value="hk">航空</li>
            <li><input type="checkbox" name="industrys" value="fdch">房地产</li>
            <li><input type="checkbox" name="industrys" value="qch">汽车</li>
            <li><input type="checkbox" name="industrys" value="jjjc">家居建材</li>
            <li><input type="checkbox" name="industrys" value="dl">电力</li>
        </ul>
        <ul class="industryElem">
            <li><input type="checkbox" name="industrys" value="gyp">工业品</li>
            <li><input type="checkbox" name="industrys" value="kxp">快消品</li>
            <li><input type="checkbox" name="industrys" value="jd">家电</li>
            <li><input type="checkbox" name="industrys" value="jdcy">酒店餐饮</li>
            <li><input type="checkbox" name="industrys" value="mt">媒体</li>
            <li><input type="checkbox" name="industrys" value="pxjg">培训机构</li>
        </ul>
    </div>
</div>
<br/><br/>
<div class="pi-inf-tr">
    <div class="pi-inf-td-l">
        关键字:
    </div>
    <div class="pi-inf-td-r">
        <input name="keywords" class="pi-input-css pi-guaniianz"  type="text" value="" placeholder="方便搜索到您"/>
        <c:forEach items="${expert.keywordsList}" var="keywords">
            <div class="elem"><span>${keywords.words}&nbsp;</span><img src="/images/pop-up-down3.png" onclick="deleteKeyword('${keywords.id}',this)"></div>
        </c:forEach>
    </div>
</div>
<div class="pi-inf-tr">
    <div class="pi-inf-td-l">
        风格标签:
    </div>
    <div class="pi-inf-td-r">
        <input name="styleLabels" class="pi-input-css pi-guaniianz"  type="text" value="" placeholder="方便查找到您"/>
        <c:forEach items="${expert.styleLabelList}" var="stylelabel">
            <div class="elem" ><span>${stylelabel.label}&nbsp;</span><img  src="/images/pop-up-down3.png" onclick="deleteLabel('${stylelabel.id}',this)"></div>
        </c:forEach>
    </div>
</div>
<div class="pi-inf-tr">
    <div class="pi-inf-td-l">
        联系电话:
    </div>
    <div class="pi-inf-td-r">
        <input name="phone" class="pi-input-css" type="text" value="${expert.phone}"/>
    </div>
</div>
<div class="pi-inf-tr">
    <div class="pi-inf-td-l">
        邮箱:
    </div>
    <div class="pi-inf-td-r">
        <input name="email" class="pi-input-css" type="text" value="${expert.email}"/>
    </div>
</div>
<div class="pi-inf-tr">
    <div class="pi-inf-td-l">
        常驻地:
    </div>
    <div class="pi-inf-td-r">
        <select class="pi-box-four" name="provinceId" required="true">
            <c:forEach items="${provinces}" var="province">
                <option value="${province.id}">${province.name}</option>
            </c:forEach>
        </select>

    </div>
</div>

<div class="pi-inf-tr">
    <div class="pi-inf-td-l">
        区间报价:
    </div>
    <div class="pi-inf-td-r">
        <input name="minPrice" class="pi-jiaqian" type="text" value="${expert.minPrice}"/>——
        <input name="maxPrice" class="pi-jiaqian" type="text" value="${expert.maxPrice}"/>元/天
    </div>
</div>
<div class="pi-inf-tr">
    <div class="pi-inf-td-l">
        个人描述:
    </div>
    <div class="pi-inf-td-r">
        <input name="memo" class="pi-input-css pi-gerenmiaoshu" type="text" value="${expert.memo}" placeholder="用一句话描述下自己"/>
    </div>
</div>
<div class="pi-inf-tr">
    <div class="pi-inf-td-l">
        个人简介:
    </div>
    <div class="pi-inf-td-r">
        <textarea name="introduce" class="pi-size-inp" type="text" placeholder="详细的介绍下自己">${expert.introduce}</textarea>
    </div>
</div>
<div class="pi-imgs-zj">
    <img id="head" src="http://pic.591zjh.com/${expert.pictureUrl}@!personal-list">
</div>
<div id="" class="pi-wz-zj"><span id="expertPicUpload">上传头像</span></div>
<%--  <div class="pi-inf-tr">
      <div class="pi-inf-td-l">
          认证信息:
      </div>
      <div class="pi-inf-td-r">
          <div class="pi-certification">上传身份证扫描件</div>
          <div class="pi-certification-wz">上传文件</div>
      </div>
      <div class="pi-inf-td-r" style="margin:0 20px 0px 20px;">
          <div class="pi-certification">上传学历证扫描件</div>
          <div class="pi-certification-wz">上传文件</div>
      </div>
      <div class="pi-inf-td-r">
          <div class="pi-certification">上传离职证明扫描件</div>
          <div class="pi-certification-wz">上传文件</div>
      </div>
  </div>--%>

</form>
<form id="company" name="company" action="" method="post">
    <div class="pi-line"></div>
    <div class="Personal-information">
        <img src="/images/duihao.gif">
        完善工作经历
    </div>
    <div class="history">

        <c:forEach items="${expert.companyList}" var="company">
            <div class="body-con-4">
                <dl>
                    <dd>
                        <span class="list">${company.name}</span>
                        <span class="list"><span><fmt:formatDate value="${company.startDate}" pattern="yyyy-MM-dd"></fmt:formatDate></span></span>
                        <span class="list">——</span>
                        <span class="list"><span><fmt:formatDate value="${company.endDate}" pattern="yyyy-MM-dd"></fmt:formatDate> </span></span>
                        <span class="list">职位:${company.position}</span>
                    </dd>
                </dl>

            </div>

        </c:forEach>
    </div>
    <div class="pi-inf-table">
        <div class="pi-inf-tr">
            <input type="hidden" name="expertId" value="${expert.id}">
            <div class="pi-inf-td-l">
                公司名称:
            </div>
            <div class="pi-inf-td-r">
                <input class="pi-input-css pi-input1-css" name="name" type="text" value=""/>
            </div>
            <div class="pi-inf-td-l">
                行业:
            </div>
            <div class="pi-inf-td-r">
                <zjh:status name="industry" dataType="ExpertServe.industry" type="select" checkedValue=""></zjh:status>
            </div>
        </div>
        <div class="pi-inf-tr">
            <div class="pi-inf-td-l">
                起止年月:
            </div>
            <div class="pi-inf-td-r">
                <input type="text" class="Wdate"  name="startDatetime" value="" style="width:120px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})">
                --
                <input type="text" class="Wdate"  name="endDatetime" value="" style="width:120px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})">

            </div>
        </div>
        <div class="pi-inf-tr">
            <div class="pi-inf-td-l">
                职务:
            </div>
            <div class="pi-inf-td-r">
                <input class="pi-input-css pi-input1-css" type="text" name="position" value=""/>
            </div>
        </div>
     <%--   <div class="pi-inf-tr">
            <div class="pi-inf-td-l">
                公司官网:
            </div>
            <div class="pi-inf-td-r">
                <input class="pi-input-css pi-input1-css" type="text" name="homeUrl" value=""/>
            </div>
        </div>
        <div class="pi-inf-tr">
            <div class="pi-inf-td-l">
                公司地址:
            </div>
            <div class="pi-inf-td-r">
                <input class="pi-input-css pi-input1-css" type="text" name="address" value=""/>
            </div>
        </div>
        <div class="pi-inf-tr">
            <div class="pi-inf-td-l">
                公司简介:
            </div>
            <div class="pi-inf-td-r">
                <textarea name="introduce" class="pi-size-inp" type="text" placeholder="公司介绍"></textarea>
            </div>
        </div>--%>

    </div>
</form>
<div class="pi-line2"></div>
<div class="pi-but-zk"><a href="#" onclick="submitCompany()">添加</a> </div>
<div style="text-align: center"><button class="pi-but2" onclick="$('#expert').submit()">保存</button></div>
</div>
</div>
</div>
</div>
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
</div>
<%--图像浮层--%>
<div id="floatDiv">
    <div id="bg"></div>
    <div id="big">
        <img id="photo" src="">
    </div>
    <div id="sma">
        <img src="">
    </div>
    <button id="sure" onclick="sureButton();">确定</button>
    <button id="cancel" onclick="cancelButton();">取消</button>

</div>
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
<script type="text/javascript">
    function submitCompany(){

        $.ajax({
            url:"/pc/company/add",
            type:"post",
            data:$("#company").serialize(),
            dataType:"json",
            success:function(data){
                $("#history").append(" <div class=\"body-con-4\">"+
                        "<dl><dd>"+
                        "<span class=\"list\">${company.name}</span>"+
                        "<span class=\"list\"><span><fmt:formatDate value="${company.startDate}" pattern="yyyy-MM-dd"></fmt:formatDate></span></span>"
                        +"<span class=\"list\">——</span>"
                        +"<span class=\"list\"><span><fmt:formatDate value="${company.endDate}" pattern="yyyy-MM-dd"></fmt:formatDate> </span></span>"
                        +"<span class=\"list\">职位:${company.position}</span>"
                        +" </dd> </dl></div>);")


            }
        })
        $("#company :input").not(":button,:submit,:reset,:hidden").val("");
        $("#company :input").not(":button,:submit,:reset,:hidden").removeAttr("checked");
        $('#company').show();
    }
    function deleteKeyword(key,obj){
        $.ajax({
            url:"/pc/expert/deleteKey",
            type:"get",
            data:{
                keywordId:key
            },
            dataType:"json",
            success:function(data){
                if(data){
                    $(obj).parents(".elem").fadeOut(1500);
                }
            }
        })
    }
    function deleteLabel(label,obj){
        $.ajax({
            url:"/pc/expert/deleteStyle",
            type:"get",
            data:{
                labelId:label
            },
            dataType:"json",
            success:function(data){
                if(data){
                    $(obj).parent().fadeOut(1500);
                }
            }
        })
    }
</script>
</body>
</html>


