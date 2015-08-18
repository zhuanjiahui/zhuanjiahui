window.onload=function(){

	//轮播
    $(function () {
     	var showpic = $('#showpic');
     	var list = $('#list');
     	var buttons = $('#buttons span');
     	var prev = $('#prev');
     	var next = $('#next');
     	var index = 1;
     	var len = 3;
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
            if (index == 3) {
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
            if (index == 3) {
                index = 1;
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
    // $(function(){
    // 	$(".navmenu").mouseover(function(){
    // 	$(this).children("#only").show();//原文件为ul,改为的#only
       
    // 	})
    // 	$(".navmenu").mouseout(function(){
     
    // 	$(this).children("#only").hide();//原文件为ul,改为的#only
     
    // 	})
    // })

        //无缝滚动效果
        var outer = document.getElementById('outer');
        var inter = document.getElementById('inter');
        // var btnLeft = document.getElementById('btnLeft');
        // var btnRight = document.getElementById('btnRight');  
        inner.innerHTML += inner.innerHTML ; 
        var t=null;
        var t1 ;
        var speed = 5;
        time();

        function time(){
            t = setInterval(autoscroll,60);

        }
        function autoscroll() {
            outer.scrollLeft+=speed;
            
            if((outer.scrollLeft >= outer.clientWidth)&&(speed>0)){
                outer.scrollLeft = 0;
            }
            if((outer.scrollLeft<=0)&&(speed<0)){
                outer.scrollLeft = outer.clientWidth
                
            }
            if (outer.scrollLeft%195 == 0){
                clearInterval(t);
                t1=setTimeout(time,2000);
                //走走停停  
            }
            // if (outer.scrollLeft == inner.offsetWidth/2) {
            //  outer.scrollLeft = 0;
            //  //循环
            // }
        }
            // // 用时激活
            // btnLeft.onclick = function(){
            //  speed = Math.abs(speed);
            // }
            // btnRight.onclick = function(){
            //  speed = -Math.abs(speed);
            // }
            // 鼠标移入移出
            outer.onmouseover=function(){
                clearInterval(t);
                clearInterval(t1);//要清两个计时器
            }
            outer.onmouseout=function(){
                time();
            }   

}
