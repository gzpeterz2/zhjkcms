$(function(){
//	banner
	var banner_return = picload(".banner");
	
//	按钮点击清除
	banner_return.siblings("button").click(function(){
		var result = 0;
		if($(this).attr("class")=="submit"){
			if(banner_return.siblings("input[type='text']").val()){
				if(banner_return.children("input[type='file']").val()){
					banner_return.children("span").html("提交完成");
					result=1;
				}else{
					alert("请选择上传文件");
				}
			}else{
				alert("请填写轮播简介");
			}
		}else{
			banner_return.children("span").html("未选择任何文件");
			result=1;
		}
		if(result){
			banner_return.siblings("input[type='text']").val("");
			banner_return.children("span").css("color","#2E96F8");		
			banner_return.children("input[type='file']").val("");
			banner_return.children("div").html("");
			result=0;
		}
	})
	
	
	
	
	
	
	
})




