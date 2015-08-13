$(function(){
	$('.content form ul li').click(function(){
		$('.content form ul li img').hide();
		$(this).children('img').show();
	});

	jQuery.validator.addMethod("isMobile", function(value, element) { 
        var length = value.length; 
        var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/; 
        return this.optional(element) || (length == 11 && mobile.test(value));
    }, "请正确填写您的手机号码");
	jQuery.validator.addMethod("isPassword", function(value, element) { 
        var length = value.length; 
        var passwoed = /^[0-9A-Za-z]{6,12}$/; 
        return this.optional(element) || passwoed.test(value); 
    }, "密码由6-12位数字或字母组成");
	
	$("#reg-form").validate({  
        rules: {  
            account: {  
                required:true,  
                minlength:11,
                isMobile:true				
            },
			password: {
				required:true,
                minlength:6,
                maxlength:12,
                isPassword:true				
			},
			rePassword: {
				required:true,
				equalTo: "#password"
			}
        },

        messages: {  
            account: {  
                required: "用户名必填",  
                minlength: "至少11个字符",
				isMobile : "请正确填写您的手机号码"
            },
            password: {
				required: "密码必填",  
                minlength: "至少6个字符",
				maxlength: "最多12个字符",
				isPassword : "密码由6-12位数字或字母组成"
			},
            rePassword: {
				required: "再次输入密码必填",
				equalTo: "两次密码必须一致"
			}
        },
		errorPlacement: function(error, element) {
            error.appendTo( element.parent().next() );
        },
		success:function(lable){
			lable.remove();
		},
		onfocusout: function(element){
            $(element).valid();
        },
		onkeyup: false
    });

	$('.box input').blur(function(){
		var labelMsg = $(this).parent().next();
		var labelImg = $(this).parent().next().children('img');
		var labelText = $(this).parent().next().html();
		if(!labelText){
			labelMsg.html("<img src='/images/ok.png' style='position:relative;left:11px;top:1px;' >");
		}else{
			if(labelImg){labelImg.remove();}
		}	
	});
	
	var agreement = $('#agreement:checked').length;
	if(agreement == 0){
		$('#registerBt').addClass('disAble').attr('disabled',true);
	}else{
		$('#registerBt').removeClass('disAble').attr('disabled',false);
	}
	
	$('#agreement').click(function(){
		var agreement = $('#agreement:checked').length;
		if(agreement == 0){
			$('#registerBt').addClass('disAble').attr('disabled',true);
		}else{
			$('#registerBt').removeClass('disAble').attr('disabled',false);
		}
	});
	

	var reClick;
	function verificationCodeClick(){
		var timer = 60;
		function verificationCode(){
			if (timer >= 0){
				$('#verificationCode').attr('disabled','true');
				$('#verificationCode').val(timer+'S后重新发送');
				timer--;
			}else{
				$('#verificationCode').val('重新发送');
				$('#verificationCode').removeAttr("disabled");
				return false;
			}
		}
		reClick = setInterval(verificationCode, 1000);
	}
	
	$('#verificationCode').click(function(){
		clearInterval(reClick);
		verificationCodeClick();
	});
	
	
});