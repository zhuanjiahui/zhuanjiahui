
window.onload=function(){
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
				}
				else{
					lis[i].className="";
					uls[i].className="";
				}
			}
		}
	}
	

	//轮播
    $(function () {
     	var showpic = $('#showpic');
     	var list = $('#list');
     	var buttons = $('#buttons span');
     	var prev = $('#prev');
     	var next = $('#next');
     	var index = 1;
     	var len = 6;
     	var interval = 3000;
     	var timer;
        function animate (offset) {
            var left = parseInt(list.css('left')) + offset;
            if (offset>0) {
                offset = '+=' + offset;
            }
            else {
                offset = '-=' + Math.abs(offset);
            }
            list.animate({'left': offset}, 300, function () {
                if(left > -200){
                    list.css('left', -984 * len);
                }
                if(left < (-984 * len)) {
                    list.css('left', -984);
                    }
            });
        }

        function showButton() {
            buttons.eq(index-1).addClass('on').siblings().removeClass('on');
        }

        function play() {
            timer = setTimeout(function () {
                next.trigger('click');
                play();
            }, interval);
        }
        function stop() {
            clearTimeout(timer);
        }

        next.bind('click', function () {
            if (list.is(':animated')) {
                return;
            }
            if (index == 6) {
                index = 1;
            }
            else {
                index += 1;
            }
            animate(-984);
            showButton();
        });

        prev.bind('click', function () {
            if (list.is(':animated')) {
                return;
            }
            if (index == 1) {
                index = 6;
            }
            else {
                index -= 1;
            }
            animate(984);
            showButton();
        });
        // 此处修改切换采用何种方式(click/mouseover)
        buttons.each(function () {
            $(this).bind('mouseover', function () {
                if (list.is(':animated') || $(this).attr('class')=='on') {
                    return;
                }
                var myIndex = parseInt($(this).attr('index'));
                var offset = -984 * (myIndex - index);

                animate(offset);
                index = myIndex;
                showButton();
            })
        });

        showpic.hover(stop, play);
        play();

    });
	//nav显示
    $(function(){
    	$(".navmenu").mouseover(function(){
    	$(this).children("#only").show();//原文件为ul,改为的#only
       
    	})
    	$(".navmenu").mouseout(function(){
     
    	$(this).children("#only").hide();//原文件为ul,改为的#only
     
    	})
    
    })
    //筛选条件控制
    $(function(){
        $('.screening ul li').not('.screeningTitle').click(function(){
            $(this).parent(). children().removeClass("screeningChioce");
            $(this).addClass("screeningChioce");
        });
        
        $('.screening-hide').hide();
        $('.train').click(function(){
            $('.screening-hide').show();
            $('.screening-hide li:first-child').html('课程类别');
        });
        $('.consultation').click(function(){
            $('.screening-hide').show();
            $('.screening-hide li:first-child').html('专业类别');
        });
        $('.noSecond').click(function(){
            $('.screening-hide').hide();
        });
    });

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

}
