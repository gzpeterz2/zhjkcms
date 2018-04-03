package com.hc.cms.po;

public class Succstudent {
	private Integer id;
	private String name;
	private String degree;
	private String enterprize;
	private Integer salary;
	private String career;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	
	public String getEnterprize() {
		return enterprize;
	}
	public void setEnterprize(String enterprize) {
		this.enterprize = enterprize;
	}
	public Integer getSalary() {
		return salary;
	}
	public void setSalary(Integer salary) {
		this.salary = salary;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	@Override
	public String toString() {
		return "Succstudent [id=" + id + ", name=" + name + ", degree=" + degree + ", enterprize=" + enterprize
				+ ", salary=" + salary + ", career=" + career + "]";
	}
	
}
