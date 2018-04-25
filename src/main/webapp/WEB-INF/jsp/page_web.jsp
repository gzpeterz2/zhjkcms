<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/header.css"/>
		<link rel="stylesheet" type="text/css" href="css/section.css"/>
		<link rel="stylesheet" type="text/css" href="css/pageWeb.css"/>
		<link rel="stylesheet" type="text/css" href="css/show-list.css"/>
		<style type="text/css">
			.header .container ul li:nth-of-type(2) a p {
            	color: #2E96F8;
            }
          	.header .container ul li:nth-of-type(2) a span {
            	display: inline-block;
            }
		</style>
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="js/rem.js" ></script>
		<script type="text/javascript" src="js/section.js" ></script>
		<script type="text/javascript" src="js/pageWeb.js"></script>
		<script type="text/javascript" src="js/picload.js"></script>
		<script type="text/javascript" src="js/description.js" ></script>
		<script type="text/javascript" src="js/wangEditor.js"></script>
		
	</head>
	<body>
		<!--<div id="header">
			
		</div>-->
		<div class="header">
			<div class="container">
				<img src="img/index/logo2.png"/>
				<ul>
					<li>
						<a href="pagefirst.action">
							<p>首页</p>
							<span></span>
						</a>
					</li>
					<li>
						<a href="pageweb.action">
							<p>官网设置</p>
							<span></span>
						</a>
					</li>
					<li>
						<a href="pageforums.action">
							<p>论坛设置</p>
							<span></span>
						</a>
					</li>
				</ul>
				<ol>
					<li>欢迎你 : <span class="username">${existUser.name }</span></li>
					<li class="logoff">退出</li>
				</ol>
			</div>
		</div>
		<div class="section">
			<div class="container">
				<ul class="select-list">
					<li class="choosen">
						<p>
							轮播图列表
							<span></span>
						</p>
					</li>
					<li>
						<p>
							教学视频列表
							<span></span>
						</p>
					</li>
					<li>
						<p>
							就业行情
							<span></span>
						</p>
					</li>
					<li>
						<p>
							师资力量
							<span></span>
						</p>
					</li>
					<li>
						<p>
							资讯动态列表
							<span></span>
						</p>
					</li>
					<li>
						<p>
							学员故事
							<span></span>
						</p>
					</li>
					<li>
						<p>
							关于我们
							<span></span>
							<b>></b>
						</p>
						<ol>
							<li>
								<p>学院介绍</p>
							</li>
							<li>
								<p>教学环境</p>
							</li>
						</ol>
					</li>
					<li>
						<p>
							报名列表
							<span></span>
						</p>
					</li>
					<li>
						<p>
							友情链接列表
							<span></span>
						</p>
					</li>
				</ul>
				<ol class="main-list">
					<li class="banner select">
						<p>
							官网设置<i>></i><span>轮播图列表</span><b class="add">添加轮播图</b>
						</p>
						<ul class="main-content">
							<li class="show">
								<div>
									<table border="1" cellspacing="0" cellpadding="">
										<tr>
											<th>轮播标题</th>
											<th>轮播图</th>
											<th>轮播图链接</th>
											<th>操作</th>
										</tr>
										<!--<tr>
											<td>大咖简介</td>
											<td>
												<img src="img/index/fail_pic.jpg"/>
											</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>-->
									</table>
								</div>
							</li>
							<li class="hidden">
								<div>
									<form action="${pageContext.request.contextPath }/home/addBanner.action" method="post" enctype="multipart/form-data">
									<h2>轮播标题：</h2>
									<input name="name" type="text" placeholder="请输入标题"/>
									<h2>对应的链接地址：</h2>
									<input name="url" type="text" placeholder="java.action"/>
									<h2>配图：</h2>
									<c:if test="${itemsCustom.pic !=null}">
										<img src="/${banner.src}" width=100 height=100/>
										<br/>
									</c:if>
									<!--<input type="file" name="pictureFile" />-->
									<!-- <div class="picload">
										修改上传input样式 图片只读jpg、png、gif
										<input type="file" name="pictureFile" />
										<input type="button" value="选择文件"/>
										<span>未选择任何文件</span>
										<div></div>
									</div> -->
									<div class="picload">
										<!--修改上传input样式 图片只读jpg、png、gif-->
										<input name="pictureFile" type="file" />
										<input name="clickfile" type="button" value="选择文件"/>
										<span>未选择任何文件</span>
										<div></div>
									</div>
									<button class="submit">提交</button>
									<button class="cancel">取消</button>
									</form>
								</div>
								<img class="return_show" src="img/index/return_pic.jpg" alt="" />
							</li>
						</ul>
					</li>
					<li class="video">
						<p>
							官网设置<i>></i><span>教学视频列表</span><b class="add">添加视频</b>
						</p>
						<ul class="main-content">
							<li class="show">
								<div>
									<table border="1" cellspacing="0" cellpadding="">
										<tr>
											<th>视频标题</th>
											<th>视频类型</th>
											<th>视频讲师</th>
											<th>视频链接</th>
											<th>日期</th>
											<th>操作</th>
										</tr>
										<!-- <tr>
											<td>快速提升UI能力</td>
											<td>UI设计</td>
											<td>王老师</td>
											<td>http://www.dfigjoicvgff</td>
											<td>2018-03-07</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
										<tr>
											<td>快速提升UI能力</td>
											<td>UI设计</td>
											<td>王老师</td>
											<td>http://www.dfigjoicvgff</td>
											<td>2018-03-07</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
										<tr>
											<td>快速提升UI能力</td>
											<td>UI设计</td>
											<td>王老师</td>
											<td>http://www.dfigjoicvgff</td>
											<td>2018-03-07</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr> -->
									</table>
								</div>
							</li>
							<li class="hidden">
								
									<div>
										<form action="${pageContext.request.contextPath }/addVideo.action"  method="post" enctype="multipart/form-data">
											<ul class="content-list">
												<li>
													<h2>视频标题：</h2>
													<input type="text" name="v_title" placeholder="请输入视频标题"/>
												</li>
												<li>
													<h2>视频类型：</h2>
													<input type="text" name="v_type" placeholder="请输入视频类型"/>
												</li>
												<li>
													<h2>视频讲师：</h2>
													<input type="text" name="v_teacher" placeholder="请输入视频讲师"/>
												</li>
												<li>
													<h2>视频连接：</h2>
													<input type="text" name="v_link" placeholder="请输入视频链接"/>
												</li>
												<li>
													<h2>日期：</h2>
													<input type="text" name="v_date" placeholder="请输入日期"/>
												</li>
												<li>
													<h2>目前更新：</h2>
													<input type="text" name="v_update" placeholder="请输入更新"/>
												</li>
											</ul>
											<h2>是否首页推荐：</h2>
											<input type="radio" name="v_isrecommend" value="1"/>是
											<input type="radio" name="v_isrecommend" value="2"/>否
											<h2>课程目录：</h2>
											<input type="text" name="v_catelog" placeholder="请输入标题"/>
											<span class="add-content">
												<i>+</i>
												可添加目录
											</span>
											<!--<h2>轮播标题：</h2>
											<input type="text" placeholder="请输入标题"/>-->
											<h2>视频封面：</h2>
											<div class="picload">
												<!--修改上传input样式 图片只读jpg、png、gif-->
												<input type="file" name="videopictrue"/>
												<input type="button" name="clickvideofile" value="选择文件"/>
												<span>未选择任何文件</span>
												<div></div>
											</div>
											<div class="desciption">
												<h2>视频描述：</h2>
												
												<textarea name="v_describe" id="" cols="" rows=""> 
													<span>限50字</span>
												</textarea>
											</div>
											<button class="submit">提交</button>
											<button class="cancel">取消</button>
										</form>
									</div>
								
								<img class="return_show" src="img/index/return_pic.jpg" alt="" />
							</li>
						</ul>
					</li>
					<li class="job">
						<p>
							官网设置<i>></i><span>就业行情</span><b class="add">添加就业行情</b>
						</p>
						<ul class="main-content">
							<li class="show">
								<div>
									<table border="1" cellspacing="0" cellpadding="">
										<tr>
											<th>图片序号</th>
											<th>就业截图</th>
											<th>操作</th>
										</tr>
										<tr>
											<td>1</td>
											<td>
												<img src="img/index/fail_pic.jpg"/>
											</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
										<tr>
											<td>2</td>
											<td>
												<img src="img/index/fail_pic.jpg"/>
											</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
										<tr>
											<td>3</td>
											<td>
												<img src="img/index/fail_pic.jpg"/>
											</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
										
									</table>
								</div>
							</li>
							<li class="hidden">
								<div class="picload">
									<h2>轮播标题：</h2>
									<input type="text" placeholder="请输入标题"/>
									<h2>配图：</h2>
									<div>
										修改上传input样式 图片只读jpg、png、gif
										<input type="file" />
										<input type="button" value="选择文件"/>
										<span>未选择任何文件</span>
										<div></div>
									</div>
								
									<button class="submit">提交</button>
									<button class="cancel">取消</button>
								</div>
								<img class="return_show" src="img/index/return_pic.jpg" alt="" />
							</li>
						</ul>
					</li>
					<li class="teacher">
						<p>
							官网设置<i>></i><span>师资力量</span><b class="add">添加教师</b>
						</p>
						<ul class="main-content">
							<li class="show">
								<div>
									<table border="1" cellspacing="0" cellpadding="">
										<tr>
											<th>教师名称</th>
											<th>教学科目</th>
											<th>教师头像</th>
											<th>教师简介</th>
											<th>操作</th>
										</tr>
										<tr>
											<td>王XX</td>
											<td>UI设计</td>
											<td>
												<img src="img/index/fail_pic.jpg"/>
											</td>
											<td>aabbccsjdhfigutkyaabbccsjdhfigutkyaabbccsjdhfigutkyaabbccsjdhfigutkyaabbccsjdhfigutky</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
										<tr>
											<td>王XX</td>
											<td>UI设计</td>
											<td>
												<img src="img/index/fail_pic.jpg"/>
											</td>
											<td>aabbccsjdhfigutky</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
										<tr>
											<td>王XX</td>
											<td>UI设计</td>
											<td>
												<img src="img/index/fail_pic.jpg"/>
											</td>
											<td>aabbccsjdhfigutky</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
									</table>
								</div>
							</li>
							<li class="hidden">
								<div class="picload">
									<h2>轮播标题：</h2>
									<input type="text" placeholder="请输入标题"/>
									<h2>配图：</h2>
									<div>
										<!--修改上传input样式 图片只读jpg、png、gif-->
										<input type="file" />
										<input type="button" value="选择文件"/>
										<span>未选择任何文件</span>
										<div></div>
									</div>
									<button class="submit">提交</button>
									<button class="cancel">取消</button>
								</div>
								<img class="return_show" src="img/index/return_pic.jpg" alt="" />
							</li>
						</ul>
					</li>
					<li class="info">
						<p>
							官网设置<i>></i><span>资讯动态列表</span><b class="add">添加资讯</b>
						</p>
						<ul class="main-content">
							<li class="show">
								<div>
									<table border="1" cellspacing="0" cellpadding="">
										<tr>
											<th>动态标题</th>
											<th>发布时间</th>
											<th>操作</th>
										</tr>
										<!-- <tr>
											<td>快速提升UI能力</td>
											<td>2018-03-07</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
										<tr>
											<td>快速提升UI能力</td>
											<td>2018-03-07</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
										<tr>
											<td>快速提升UI能力</td>
											<td>2018-03-07</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr> -->
									</table>
								</div>
							</li>
							<li class="hidden">
								<div class="picload">
									<form action="${pageContext.request.contextPath }/instDynamic/addDynamic.action" method="post">
										<h2>资讯标题：</h2>
										<input name="title" type="text" placeholder="请输入标题"/>
										<h2>资讯内容：</h2>
										<!-- <div>
											修改上传input样式 图片只读jpg、png、gif
											<input type="file" />
											<input type="button" value="选择文件"/>
											<span>未选择任何文件</span>
											<div></div>
										</div> -->
										<input id="text1" name="content" type="hidden" 
											style="width: 200px; height: 200px;"/>
										<div id="editor">
											<!-- <b>wangEditor</b> -->
										</div>
										<button class="submit">提交</button>
										<button class="cancel">取消</button>
									</form>
									<script type="text/javascript">
		
										var E = window.wangEditor;
										var editor = new E('#editor');
										editor.customConfig.uploadImgServer = 'img/upload.action'; //上传URL
										//editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
										//editor.customConfig.uploadImgMaxLength = 5;
										editor.customConfig.uploadFileName = 'myFileName';
										editor.customConfig.uploadImgHooks = {
											customInsert : function(insertImg, result, editor) {
												// 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
												// insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
												// 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
												var url = result.data;
												insertImg(url);	
												// result 必须是一个 JSON 格式字符串！！！否则报错
											}
										}
								
										var $text1 = $('#text1')
										editor.customConfig.onchange = function(html) {
											// 监控变化，同步更新到 text
											$text1.val(html)
										}
										editor.customConfig.showLinkImg = false
										editor.create()
										
										//初始化 textarea 的值
										$text1.val(editor.txt.text())
									</script>
								</div>
								<img class="return_show" src="img/index/return_pic.jpg" alt="" />
							</li>
						</ul>
					</li>
					<li class="student">
						<p>
							官网设置<i>></i><span>学员故事</span><b class="add">添加学员故事</b>
						</p>
						<ul class="main-content">
							<li class="show">
								<div>
									<table border="1" cellspacing="0" cellpadding="">
										<tr>
											<th>学员名称</th>
											<th>专业</th>
											<th>学员头像</th>
											<th>学员简介</th>
											<th>操作</th>
										</tr>
										<tr>
											<td>王XX</td>
											<td>UI设计</td>
											<td>
												<img src="img/index/fail_pic.jpg"/>
											</td>
											<td>djfhguvbhcjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdj</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
										<tr>
											<td>王XX</td>
											<td>UI设计</td>
											<td>
												<img src="img/index/fail_pic.jpg"/>
											</td>
											<td>djfhguvbhcjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdj</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
										<tr>
											<td>王XX</td>
											<td>UI设计</td>
											<td>
												<img src="img/index/fail_pic.jpg"/>
											</td>
											<td>djfhguvbhcjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdjdj</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
									</table>
								</div>
							</li>
							<li class="hidden">
								<div class="picload">
									<h2>轮播标题：</h2>
									<input type="text" placeholder="请输入标题"/>
									<h2>配图：</h2>
									<div>
										<!--修改上传input样式 图片只读jpg、png、gif-->
										<input type="file" />
										<input type="button" value="选择文件"/>
										<span>未选择任何文件</span>
										<div></div>
									</div>
									<button class="submit">提交</button>
									<button class="cancel">取消</button>
								</div>
								<img class="return_show" src="img/index/return_pic.jpg" alt="" />
							</li>
						</ul>
					</li>
					<li class="school">
						<p>
							官网设置<i>></i>关于我们<i>></i><span>学院介绍</span><b class="add">添加学院</b>
						</p>
						<ul class="main-content">
							<li class="show">
								<div>
									<table border="1" cellspacing="0" cellpadding="">
										<tr>
											<th>学院介绍标题</th>
											<th>介绍图</th>
											<th>操作</th>
										</tr>
										<tr>
											<td>公司简介</td>
											<td>
												<img src="img/index/fail_pic.jpg"/>
											</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
										<tr>
											<td>公司简介</td>
											<td>
												<img src="img/index/fail_pic.jpg"/>
											</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
										<tr>
											<td>公司简介</td>
											<td>
												<img src="img/index/fail_pic.jpg"/>
											</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
									</table>
								</div>
							</li>
							<li class="hidden">
								<div class="picload">
									<h2>轮播标题：</h2>
									<input type="text" placeholder="请输入标题"/>
									<h2>配图：</h2>
									<div>
										<!--修改上传input样式 图片只读jpg、png、gif-->
										<input type="file" />
										<input type="button" value="选择文件"/>
										<span>未选择任何文件</span>
										<div></div>
									</div>
									<button class="submit">提交</button>
									<button class="cancel">取消</button>
								</div>
								<img class="return_show" src="img/index/return_pic.jpg" alt="" />
							</li>
						</ul>
					</li>
					<li class="enlist">
						<p>
							官网设置<i>></i><span>报名列表</span><b class="add">添加报名列表</b>
						</p>
						<ul class="main-content">
							<li class="show">
								<div>
									<table border="1" cellspacing="0" cellpadding="">
										<tr>
											<th>姓名</th>
											<th>电话</th>
											<th>地区</th>
											<th>学科</th>
											<th>QQ</th>
											<th>报名时间</th>
											<th>操作</th>
										</tr>
										<tr>
											<td>王XX</td>
											<td>17576016547</td>
											<td>广州地区</td>
											<td>UI设计</td>
											<td>3004471234</td>
											<td>2018-03-07</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
										<tr>
											<td>王XX</td>
											<td>17576016547</td>
											<td>广州地区</td>
											<td>UI设计</td>
											<td>3004471234</td>
											<td>2018-03-07</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
										<tr>
											<td>王XX</td>
											<td>17576016547</td>
											<td>广州地区</td>
											<td>UI设计</td>
											<td>3004471234</td>
											<td>2018-03-07</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
									</table>
								</div>
							</li>
							<li class="hidden">
								<div class="picload">
									<h2>轮播标题：</h2>
									<input type="text" placeholder="请输入标题"/>
									<h2>配图：</h2>
									<div>
										<!--修改上传input样式 图片只读jpg、png、gif-->
										<input type="file" />
										<input type="button" value="选择文件"/>
										<span>未选择任何文件</span>
										<div></div>
									</div>
									<button class="submit">提交</button>
									<button class="cancel">取消</button>
								</div>
								<img class="return_show" src="img/index/return_pic.jpg" alt="" />
							</li>
						</ul>
					</li>
					<li class="link">
						<p>
							官网设置<i>></i><span>友情链接列表</span><b class="add">添加链接</b>
						</p>
						<ul class="main-content">
							<li class="show">
								<div>
									<table border="1" cellspacing="0" cellpadding="">
										<tr>
											<th>链接名称</th>
											<th>链接地址</th>
											<th>操作</th>
										</tr>
										<tr>
											<td>海纳海辰科技</td>
											<td>http://www.dfigjoicvgff</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
										<tr>
											<td>海纳海辰科技</td>
											<td>http://www.dfigjoicvgff</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
										<tr>
											<td>海纳海辰科技</td>
											<td>http://www.dfigjoicvgff</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
									</table>
								</div>
							</li>
							<li class="hidden">
								<div class="picload">
									<h2>轮播标题：</h2>
									<input type="text" placeholder="请输入标题"/>
									<h2>配图：</h2>
									<div>
										<!--修改上传input样式 图片只读jpg、png、gif-->
										<input type="file" />
										<input type="button" value="选择文件"/>
										<span>未选择任何文件</span>
										<div></div>
									</div>
									<button class="submit">提交</button>
									<button class="cancel">取消</button>
								</div>
								<img class="return_show" src="img/index/return_pic.jpg" alt="" />
							</li>
						</ul>
					</li>
					<li class="envir">
						<p>
							官网设置<i>></i>关于我们<i>></i><span>教学环境</span><b class="add">添加校区</b>
						</p>
						<ul class="main-content">
							<li class="show">
								<div>
									<table border="1" cellspacing="0" cellpadding="">
										<tr>
											<th>校区标题</th>
											<th>环境图</th>
											<th>操作</th>
										</tr>
										<tr>
											<td>广州校区</td>
											<td>
												<img src="img/index/fail_pic.jpg"/>
											</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
										<tr>
											<td>广州校区</td>
											<td>
												<img src="img/index/fail_pic.jpg"/>
											</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
										<tr>
											<td>广州校区</td>
											<td>
												<img src="img/index/fail_pic.jpg"/>
											</td>
											<td>
												<span class="table_edit">编辑</span>
												<span class="table_delete">删除</span>
											</td>
										</tr>
									</table>
								</div>
							</li>
							<li class="hidden">
								<div class="picload">
									<h2>轮播标题：</h2>
									<input type="text" placeholder="请输入标题"/>
									<h2>配图：</h2>
									<div>
										<!--修改上传input样式 图片只读jpg、png、gif-->
										<input type="file" />
										<input type="button" value="选择文件"/>
										<span>未选择任何文件</span>
										<div></div>
									</div>
									<button class="submit">提交</button>
									<button class="cancel">取消</button>
								</div>
								<img class="return_show" src="img/index/return_pic.jpg" alt="" />
							</li>
						</ul>
					</li>
				</ol>
			</div>
		</div>
	</body>
</html>

