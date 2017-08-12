package com.efficient.bean;

import java.sql.Timestamp;

/**
 * 订单表，订单明细表，商品表的属性组合类
 * @author 雷雨田
 * @Date 2017/07
 */
public class OrderAndProduct {

	//订单编号
	private String order_no;
	//商品的库存
	private int stock;
	//订单状态
	private String state;
	//应收金额
	private float amt;
	//实收金额
	private float final_amt;
	//商品数量
	private int num;
	//商品名
	private String name;
	//单价
	private float price;
	//下单时间
	private Timestamp create_date;
	
	//无参构造
	public Timestamp getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Timestamp create_date) {
		this.create_date = create_date;
	}

	public float getAmt() {
		return amt;
	}

	public void setAmt(float amt) {
		this.amt = amt;
	}

	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public float getFinal_amt() {
		return final_amt;
	}

	public void setFinal_amt(float final_amt) {
		this.final_amt = final_amt;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public OrderAndProduct() {
		
	}
	
	public OrderAndProduct(String order_no,int stock,String state, float final_amt, int num, String name) {
		super();
		this.state = state;
		this.final_amt = final_amt;
		this.num = num;
		this.name = name;
		this.order_no=order_no;
		this.stock=stock;
	}

	public OrderAndProduct(String order_no, int stock, String state, float amt,
			float final_amt, int num, String name, float price,
			Timestamp create_date) {
		super();
		this.order_no = order_no;
		this.stock = stock;
		this.state = state;
		this.amt = amt;
		this.final_amt = final_amt;
		this.num = num;
		this.name = name;
		this.price = price;
		this.create_date = create_date;
	}

	
}
