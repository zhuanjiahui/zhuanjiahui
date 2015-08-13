$(document).ready(function(){

    // TAB切换
    var nav=document.getElementById("tab-nav");
    var lis=document.getElementById("tab-nav").getElementsByTagName("li");
    var uls=document.getElementById("tab_con").getElementsByTagName("ul");
    for(var i=0;i<lis.length;i++){
        lis[i].onclick=function(){
            for(var i=0;i<lis.length;i++){
                if(this==lis[i]){
                    lis[i].className="select";
                    uls[i].className="show";
                    //动态修改主搜索选项卡选择改变输入框提示文本 万云 2015.08.11
                    if(i==0){
                        $('.mainSearchBox').attr('placeholder','请输入专家姓名');
                    }else if(i==1){
                        $('.mainSearchBox').attr('placeholder','请输入您的需求');
                    }else{
                        $('.mainSearchBox').attr('placeholder','请输入活动名称');
                    }
                }
                else{
                    lis[i].className="";
                    uls[i].className="";
                }
            }
        }
    }

        //回到顶部
        var obtn=document.getElementById('btn');
        //用来获取页面可视区的高度的
        var clientHeight=document.documentElement.clientHeight;
        var timer=null;
        var isTop=true;
        //滚动条滚动时触发该事件
        window.onscroll=function(){
            var osTop=document.documentElement.scrollTop||document.body.scrollTop;
            if(osTop>=clientHeight){
                obtn.style.display="block";
            }else{
                obtn.style.display="none";
            }
            if(!isTop){
                clearInterval(timer);
            }
            isTop=false;
        }
        obtn.onclick=function(){
            //设置定时器
            timer=setInterval(function(){
                //IE浏览器下与chrome浏览器下的兼容，获取滚动条距离顶部的高度
                var osTop=document.documentElement.scrollTop||document.body.scrollTop;
                var ispeed=Math.floor(-osTop/9);//此方法实现由快到慢的效果，加-号的原因不是特别理解，但是它可以解决运算出的结果不为0，到达不了顶部没办法清除定时器问题。
                isTop=true;
                document.documentElement.scrollTop=osTop+ispeed;
                document.body.scrollTop=osTop+ispeed;
                //到达顶部后清除定时器
                if(osTop==0){
                    clearInterval(timer);
                }
            },30)           
        }


});

function sureOrderProcess(orderId ,status){
    $.ajax({
        url:"/pc/purchaseOrder/process",
        type:"get",
        data:{
            orderId:orderId,
            processStatus:status
        },
        dataType:"json",
        success:function(data){
            location.reload();
        }
    })

}
