package com.hc.cms.po;

public class Enviroment {
	
	private Integer id;
	private String campus_name;
	private String pic;
	private String description;
	private String location;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCampus_name() {
		return campus_name;
	}
	public void setCampus_name(String campus_name) {
		this.campus_name = campus_name;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	@Override
	public String toString() {
		return "Enviroment [id=" + id + ", campus_name=" + campus_name + ", pic=" + pic + ", description=" + description
				+ ", location=" + location + "]";
	}
	
	

}
