<%@ page import="com.frame.organization.model.MyUser" %>
<%@ page import="com.frame.core.util.AuthorizationUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="zjh" uri="http://java.zjh.com/taglib" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/15
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/images/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <title>专家查询</title>
    <link rel="stylesheet" href="/theme/reset.css">
    <link rel="stylesheet" href="/theme/index.css">
    <script type="text/javascript" src="/scripts/zjh/zjh.js"></script>
    <script type="text/javascript" src="/scripts/jquery-1.8.0.min.js"></script>
    <%--    <script>
            $(function(){
                $('.sortingMethod li a').click(function(){
                    $('.sortingMethod li a').removeClass('sortingMethodChioce');
                    $(this).addClass('sortingMethodChioce');
                });
            });
        </script>--%>
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

    <!-- 筛选条件 -->
    <div class="multiConditionScreening">
        <%--
            <p class="city"><span>所有分类&nbsp;>&nbsp;</span><span>北京</span><span>切换城市</span></p>
        --%>
        <ul class="screening">
            <ul class="screening-1">
                <li class="screeningTitle">服务类别:</li>
                <li><a href="/pc/expertServe/pageList?industry=${industry}">全部</a> </li>
                <zjh:status name="serveType" dataType="ExpertServe.serveType" type="list" checkedValue="${serveType}" onclick="/pc/expertServe/pageList?industry=${industry}&serveType="></zjh:status>
            </ul>
            <ul class="screening-1">
                <li class="screeningTitle">行业类型:</li>
                <li><a href="/pc/expertServe/pageList?serveType=${serveType}">全部</a> </li>
                <zjh:status name="industry" dataType="ExpertServe.industry" type="list" checkedValue="${industry}" onclick="/pc/expertServe/pageList?serveType=${serveType}&industry="></zjh:status>
            </ul>

            <c:if test="${serveType=='train'||serveType=='consult'}">
                <ul class="screening-1">
                    <li class="screeningTitle">专业类型:</li>
                    <li><a href="/pc/expertServe/pageList?serveType=${serveType}&industry=${industry}">全部</a> </li>
                    <zjh:status name="major" dataType="ExpertServe.major" type="list" checkedValue="${major}" onclick="/pc/expertServe/pageList?serveType=${serveType}&industry=${industry}&major="></zjh:status>
                </ul>
                <c:if test="${!empty courseTypes&&serveType=='train'}">
                    <ul class="screening-1">

                        <li class="screeningTitle">课程类型:</li>
                        <li><a href="/pc/expertServe/pageList?industry=${industry}&major=${major}&serveType=train">全部</a> </li>
                        <c:forEach items="${courseTypes}" var="course">
                            <c:if test="${course.name==courseType}">
                                <li><a   class="screeningChioce" href="/pc/expertServe/pageList?industry=${industry}&major=${major}&courseType=${course.name}&serveType=train">${course.label}</a> </li>
                            </c:if>
                            <c:if test="${course.name!=courseType}">
                                <li><a href="/pc/expertServe/pageList?industry=${industry}&major=${major}&courseType=${course.name}&serveType=train">${course.label}</a> </li>
                            </c:if>
                        </c:forEach>
                    </ul>

                </c:if>
            </c:if>
            <c:if test="${serveType=='development'}">
                <ul class="screening-1">
                    <li class="screeningTitle">擅长类型:</li>
                    <li><a href="/pc/expertServe/pageList?serveType=development&industry=${industry}">全部</a> </li>
                    <zjh:status name="developType" dataType="ExpertServe.developType" type="list" checkedValue="${developType}" onclick="/pc/expertServe/pageList?serveType=development&industry=${industry}&developType="></zjh:status>
                </ul>
            </c:if>
        </ul>
    </div>
    <div class="screeningResultsAndRight">
        <!-- 右侧栏 -->
        <div class="bodyRight">
            <ul class="expertRecommendation">
                <li style="margin:15px 0;color:#00bdff;font-size:15px;font-weight:bold;text-indent:5px;">专家推荐</li>
                <c:forEach items="${listPageExperts}" var="listPageExpert">
                    <li>
                        <ul>
                            <a href="/pc/expert/viewExpert?expertId=${listPageExpert.id}">
                                <img src="http://pic.591zjh.com/${listPageExpert.pictureUrl}">
                            </a>
                            <ul class="text">
                                <li>${listPageExpert.name}</li>
                                <li>教龄:${listPageExpert.workTime}年 </li>
                                <li>${listPageExpert.chief}</li>
                                <li class="last">${listPageExpert.province.name}</li>
                            </ul>
                        </ul>
                    </li>
                </c:forEach>

            </ul>
            <ul class="commonProblem">
                <li style="margin:5px 0;color:#333;font-size:15px;text-indent:5px;border-bottom:1px solid #e8e8e8;height:40px;line-height:40px;">常见问题</li>
                <li style="margin-top:20px;">1、专家汇平台是否会收取职...</li>
                <li>1、专家汇平台是否会收取职...</li>
                <li>1、专家汇平台是否会收取职...</li>
                <li>1、专家汇平台是否会收取职...</li>
                <li>1、专家汇平台是否会收取职...</li>
                <li>1、专家汇平台是否会收取职...</li>
                <li>1、专家汇平台是否会收取职...</li>
                <li>1、专家汇平台是否会收取职...</li>
                <li>1、专家汇平台是否会收取职...</li>
                <li>10、专家汇平台是否会收取职...</li>
            </ul>
        </div>

        <!-- 筛选结果 -->
        <ul class="resultsTop">
            <li>
                <ul class="sortingMethod">
                    <li><a class="sortingMethodChioce" href="/pc/expertServe/pageList?serveType=${serveType}&industry=${industry}&major=${major}&courseType=${courseType}&developType=${developType}">默认排序</a> </li>
                    <li><a href="/pc/expertServe/pageList?serveType=${serveType}&industry=${industry}&major=${major}&courseType=${courseType}&developType=${developType}$orderBy=price_asc">价格</a></li>
                    <%--
                                    <li><a href="/pc/expertServe/pageList?serveType=${serveType}&industry=${industry}&major=${major}&courseType=${courseType}&developType=${developType}$orderBy=obj.expert.visitCount_desc">人气</a></li>
                    --%>
                </ul>
            </li>
            <%--  <li>
                  <ul class="costRange">
                      <li>费用&nbsp;:</li>
                      <li><input type="text" name="price0"></li>
                      <li style="padding:0 1px;color:#00bdff">-</li>
                      <li><input type="text" name="price1"></li>
                  </ul>
              </li>--%>
        </ul>
        <div class="resultsBody">
            <!--筛选结果-专家介绍-->
            <ul class="expertElem">
                <c:forEach items="${pageInfo.list}" var="expertServe">

                    <li>
                        <a href="/pc/expert/viewExpert?expertId=${expertServe.expert.id}"><img src="http://pic.591zjh.com/${expertServe.expert2.pictureUrl}" alt="" class="expertPhoto"></a>
                        <ul class="star">
                                <%--  <c:forEach items="${expertServeIndustry.expertServe.grade}">
                                  </c:forEach>--%>
                            <li><img src="/images/star-pic.png"></li>
                            <li><img src="/images/star-pic.png"></li>
                            <li><img src="/images/star-pic.png"></li>
                            <li><img src="/images/star-pic.png"></li>
                            <li><img src="/images/star-pic.png"></li>

                        </ul>
                        <p class="score"><span>5.0</span>分</p>
                        <p class="address">${expertServe.expert2.province.name}</p>
                        <p class="expertName">${expertServe.expert2.name}</p>
                        <p class="topJob">${expertServe.expert2.chief}</p>
                        <p class="ServiceType">行业: <zjh:status name="industry"  dataType="ExpertServe.industry" type="normal" checkedValue="${expertServe.industry}" ></zjh:status></p>
                        <p class="industry"><zjh:status name="serveType" dataType="ExpertServe.serveType" type="normal" checkedValue="${expertServe.serveType}"></zjh:status> </p>

                        <ul class="expertStyle">
                            <span style="color:#6d6d6d;font-size:14px;">风格:</span>
                            <c:forEach items="${expertServe.expert2.styleLabelList}" var="stylelabel">
                                <li>${stylelabel.label}</li>
                            </c:forEach>

                        </ul>
                        <p class="expertOffer">服务报价:<span>${expertServe.price}</span>元</p>
                        <p class="maxim">${expert2.memo}</p>
                        <a class="viewDetials" href="/pc/expert/viewExpert?expertId=${expertServe.expert2.id}">查看详情</a>
                        <a class="collectionExpert" href="#" onclick="favoriteExpert('${expertServe.expert2.id}');">收藏专家</a>
                    </li>
                </c:forEach>

            </ul>

            <div class="page-normal">
                <ul class="page-ul">

                    <zjh:pageList bean="${pageEntity}" url="/pc/expertServe/pageList">
                        <zjh:pageParam name="industry" value="${industry}"></zjh:pageParam>
                        <zjh:pageParam name="major" value="${major}"></zjh:pageParam>
                        <zjh:pageParam name="courseType" value="${courseType}"></zjh:pageParam>
                        <zjh:pageParam name="developType" value="${developType}"></zjh:pageParam>
                        <zjh:pageParam name="serveType" value="${serveType}"></zjh:pageParam>
                    </zjh:pageList>

                </ul>
            </div>

        </div>
    </div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>

</div>

<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js" charset="utf-8"></script>
<script type="text/javascript">
    function favoriteExpert(id){
        $.ajax({
            url:"/pc/favorite/addExpert",
            type:"get",
            data:{
                expertId:id
            },
            dataType:"json",
            success:function(data){
                if(data){
                    alert("收藏成功！");
                }else{
                    alert("收藏失败！");
                }
            }
        })
    }
</script>
<!-- JiaThis Button END -->
</body>
</html>
