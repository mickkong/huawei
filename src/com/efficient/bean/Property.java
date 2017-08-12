package com.efficient.bean;

/**
 * 属性实体类
 * @author 雷雨田
 * @Date 2017/07
 */
public class Property implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	//唯一标识
	private int id;
	//种类
	private String category;
	//名字
	private String name;

	public Property() {
	}

	public Property(String category, String name) {
		this.category = category;
		this.name = name;
	}

	public Property(Integer id, String category, String name) {
		super();
		this.id = id;
		this.category = category;
		this.name = name;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}