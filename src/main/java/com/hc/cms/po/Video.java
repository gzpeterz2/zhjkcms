package com.hc.cms.po;

public class Video {
	private Integer v_id;
	private String v_title;
	private String v_type;
	private String v_teacher;
	private String v_link;
	private String v_date;
	private String v_update;
	private Integer v_isrecommend;
	private String v_catelog;
	private String v_cover;
	private String v_describe;

	public Video() {
	}

	public Integer getV_id() {
		return v_id;
	}

	public void setV_id(Integer v_id) {
		this.v_id = v_id;
	}

	public String getV_title() {
		return v_title;
	}

	public void setV_title(String v_title) {
		this.v_title = v_title;
	}

	public String getV_type() {
		return v_type;
	}

	public void setV_type(String v_type) {
		this.v_type = v_type;
	}

	public String getV_teacher() {
		return v_teacher;
	}

	public void setV_teacher(String v_teacher) {
		this.v_teacher = v_teacher;
	}

	public String getV_link() {
		return v_link;
	}

	public void setV_link(String v_link) {
		this.v_link = v_link;
	}

	public String getV_date() {
		return v_date;
	}

	public void setV_date(String v_date) {
		this.v_date = v_date;
	}

	public String getV_update() {
		return v_update;
	}

	public void setV_update(String v_update) {
		this.v_update = v_update;
	}

	public Integer getV_isrecommend() {
		return v_isrecommend;
	}

	public void setV_isrecommend(Integer v_isrecommend) {
		this.v_isrecommend = v_isrecommend;
	}

	public String getV_catelog() {
		return v_catelog;
	}

	public void setV_catelog(String v_catelog) {
		this.v_catelog = v_catelog;
	}

	public String getV_cover() {
		return v_cover;
	}

	public void setV_cover(String v_cover) {
		this.v_cover = v_cover;
	}

	public String getV_describe() {
		return v_describe;
	}

	public void setV_describe(String v_describe) {
		this.v_describe = v_describe;
	}

	@Override
	public String toString() {
		return "Video [v_id=" + v_id + ", v_title=" + v_title + ", v_type=" + v_type + ", v_teacher=" + v_teacher
				+ ", v_link=" + v_link + ", v_date=" + v_date + ", v_update=" + v_update + ", v_isrecommend="
				+ v_isrecommend + ", v_catelog=" + v_catelog + ", v_cover=" + v_cover + ", v_describe=" + v_describe
				+ "]";
	}

}
