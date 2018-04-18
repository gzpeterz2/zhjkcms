$(function(){
//	banner
	/*var banner_list_info=$.ajax({url:"http://localhost/zhjkcms/json/homeBanner.action",type:"GET",async:false})
	console.log(banner_list_info.responseJSON);
	
	for(var k in banner_list_info.responseJSON){
		$(".banner .main-content .show div table").append("<tr><td>"+banner_list_info.responseJSON[k].name+"</td><td><img src='"+banner_list_info.responseJSON[k].src+"'/></td><td>"+banner_list_info.responseJSON[k].url+"</td><td><span class='table_edit'>编辑</span><span class='table_delete'>删除</span></td></tr>")
	}*/
	var url1 = "http://localhost:8080/zhjkcms/json/homeBanner.action";
	
	$.get(url1,function(data){				
		//i 索引 n对象
		$(data).each(function(i,n){
			
			$(".banner .main-content .show div table").append("<tr><td>"+n.name+"</td><td><img src='"+n.src+"'/></td><td>"+n.url+"</td><td><a href=''><span class='table_edit'>编辑</span></a><a href='http://localhost:8080/zhjkcms/home/deleteBanner.action?imgid=" + n.id +"'><span class='table_delete'>删除</span></a></td></tr>");
		});
	});
	picload(".banner");
	description(".banner",50);
	
//dynamic
	var url = "http://localhost:8080/zhjkcms/json/instDynamic.action";
	
	$.get(url,function(data){				
		//i 索引 n对象
		$(data).each(function(i,n){
			
			$(".info .main-content .show div table").append("<tr><td>"+n.title+"</td><td>"+n.postTime+"</td><td><a href=''><span class='table_edit'>编辑</span></a><a href='http://localhost:8080/zhjkcms/instDynamic/deleteDynamic.action?instid=" + n.artId +"'><span class='table_delete'>删除</span></a></td></tr>");
		});
	});
	
//video
	var url = "json/video.action";
	$.post(url,function(data){
		$(data).each(function(i,n){
			/*var tr_bg=i%2?"#f2f2fa":"#e6ebf6";*/
			$(".video .main-content .show div table").append("<tr><td>"+n.v_title+"</td><td>"+n.v_type+"</td><td>"+n.v_teacher+"</td><td>"+n.v_link+"</td><td>"+n.v_date+"</td><td><span class='table_edit'>编辑</span><a href='deleteVideo.action?v_id="+n.v_id+"'><span class='table_delete'>删除</span></a></td></tr>")
		});
		
	},"json");
	
	picload(".video");
	description(".video",50);
})
