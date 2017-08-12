package com.efficient.bean;

/**
 * 商品评价部分属性的组合类
 * @author 雷雨田
 * @Date 2017/07
 */
public class ProductEva {

	//商品名
	private String name;
	//评价内容
	private String content;
	//评价星级
	private int level;
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public int getLevel() {
		return level;
	}
	
	public void setLevel(int level) {
		this.level = level;
	}
	
}
