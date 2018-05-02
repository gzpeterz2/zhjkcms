package com.hc.cms.po;

public class Forum {
	//文章id
	private Integer id;
	//标题
	private String title;
	//作者
	private String author;
	//发表时间
	private String post_time;
	//查看次数
	private Integer views;
	//评论次数
	private Integer comments;
	//点赞次数
	private Integer thumbups;
	//编辑者
	private String editor;
	//编辑时间
	private String edit_time;
	//正文内容
	private String content;
	//分类
	private String type;
	//封面
	private String cover;
	//是否置顶
	private Integer top;
	//是否原创
	private Integer original;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPost_time() {
		return post_time;
	}
	public void setPost_time(String post_time) {
		this.post_time = post_time;
	}
	public Integer getViews() {
		return views;
	}
	public void setViews(Integer views) {
		this.views = views;
	}
	public Integer getComments() {
		return comments;
	}
	public void setComments(Integer comments) {
		this.comments = comments;
	}
	public Integer getThumbups() {
		return thumbups;
	}
	public void setThumbups(Integer thumbups) {
		this.thumbups = thumbups;
	}
	public String getEditor() {
		return editor;
	}
	public void setEditor(String editor) {
		this.editor = editor;
	}
	public String getEdit_time() {
		return edit_time;
	}
	public void setEdit_time(String edit_time) {
		this.edit_time = edit_time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public Integer getTop() {
		return top;
	}
	public void setTop(Integer top) {
		this.top = top;
	}
	public Integer getOriginal() {
		return original;
	}
	public void setOriginal(Integer original) {
		this.original = original;
	}
	
}
