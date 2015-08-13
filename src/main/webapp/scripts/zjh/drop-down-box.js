

$(function(){
    //下拉框主体，鼠标移动改变颜色
    $(".xl-wapper").mousemove(function(){
        $(".xl-right").css('color','black');
    });
    
    $(".xl-wapper").mouseout(function(){
        $(".xl-right").css('color','#dcdcdc');
    });
    
    $(".xl-right").click(function(){
        if($(".xl-ul").css("display")=="none"){
            $(".xl-ul").css('display','block');
        }
        else{
            $(".xl-ul").css('display','none');
        }
    });
    
    //下拉列表，点击事件
        //把列表里的值赋值到input框
    $(".xl-ul").click(function(){
        var text=$(this).text();
        $(".xl-input").val(text);
        $(".xl-ul").css('display','none');
    });
    
    
});

