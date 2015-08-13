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
