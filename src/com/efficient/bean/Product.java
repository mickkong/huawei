package com.efficient.bean;

import com.sun.jmx.snmp.Timestamp;

/**
 * 商品实体类
 * @author 雷雨田
 * @Date 2017/07
 */
public class Product {

	//id唯一标识
	private int id;
	//种类
	private String category;
	//系列
	private String series;
	//名字
	private String name;
	//品牌
	private String brand;
	//商品 编号
	private String code;
	//商品描述
	private String describ;
	//商品价格
	private float price;
	//上架日期
	private Timestamp puton_date;
	//商品状态
	private int state;
	//商品的库存
	private int stock;
	//商品的图片路径
	private String img_path;
	//无参构造
	public Product() {
		super();
	}
	public Product(int id, String category, String series, String name,
			String brand, String code, String describ, float price,
			Timestamp putonDate, int state, int stock, String imgPath) {
		super();
		this.id = id;
		this.category = category;
		this.series = series;
		this.name = name;
		this.brand = brand;
		this.code = code;
		this.describ = describ;
		this.price = price;
		puton_date = putonDate;
		this.state = state;
		this.stock = stock;
		img_path = imgPath;
	}
	public Product(String category, String series, String name, String brand,
			String code, String describ, float price, Timestamp putonDate,
			int state, int stock, String imgPath) {
		super();
		this.category = category;
		this.series = series;
		this.name = name;
		this.brand = brand;
		this.code = code;
		this.describ = describ;
		this.price = price;
		puton_date = putonDate;
		this.state = state;
		this.stock = stock;
		img_path = imgPath;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSeries() {
		return series;
	}
	public void setSeries(String series) {
		this.series = series;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDescrib() {
		return describ;
	}
	public void setDescrib(String describ) {
		this.describ = describ;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public Timestamp getPuton_date() {
		return puton_date;
	}
	public void setPuton_date(Timestamp putonDate) {
		puton_date = putonDate;
	}
	public int getDate() {
		return state;
	}
	public void setDate(int state) {
		this.state = state;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String imgPath) {
		img_path = imgPath;
	}
	@Override
	public String toString() {
		return "Product [brand=" + brand + ", category=" + category + ", code="
				+ code + ", state=" + state + ", describ=" + describ + ", id="
				+ id + ", img_path=" + img_path + ", name=" + name + ", price="
				+ price + ", puton_date=" + puton_date + ", series=" + series
				+ ", stock=" + stock + "]";
	}
	
	
}
