$(function(){
	
	var slider_width = $(".section .container .main-list > li .main-content > li ").width();
	
//	左侧菜单点击,右侧编辑主体改变

//	一级菜单
	var choosen_index=0;
	$(".section .container > ul > li").click(function(){
		$(this).addClass("choosen").siblings("li").removeClass("choosen");
		if(choosen_index!=$(this).index()){
			choosen_index=$(this).index();
			$(".section .container > ol > li").eq(choosen_index).addClass("select").siblings("li").removeClass("select");
			if(choosen_index==6){
				$(".section .container ul > li > ol > li").eq(0).addClass("choosen").siblings("li").removeClass("choosen");
			}
		}
	})
	
//	二级菜单      学院介绍  教学环境
	$(".section .container ul > li > ol > li").click(function(){
		$(this).addClass("choosen").siblings("li").removeClass("choosen");
		if($(this).index()==0){
			$(".school").addClass("select").siblings("li").removeClass("select");
		}else if($(this).index()==1){
			$(".envir").addClass("select").siblings("li").removeClass("select");
		}
	})
	
//	右侧主体    编辑和删除 按钮
	$(".submit").click(function(){
		$(this).parent().parent().parent().parent().parent().parent().parent().animate({"left":"-"+slider_width },500);
	})
	$(".cancel").click(function(){
		$(this).parent().parent().remove();
	})
	
//	添加按钮
	$(".add").click(function(){
		$(this).parent().siblings("ul").animate({"left":"-"+slider_width },500);
	})
	
//	编辑页的返回按钮
	$(".return_show").click(function(){
		$(this).parent().parent().animate({"left":"0"},500);
	})
	
//	input选中框
	$("input[type='text']").focus(function(){
		$(this).css("box-shadow","0 0 0 1px #2e96f8");
	}).blur(function(){
		$(this).css("box-shadow","none");
	})
	
	
	console.log(3);
})
