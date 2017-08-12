package com.efficient.bean;

/**
 * 购物车实体类
 * @author HC
 * @Date 2017/07
 */
public class ShoppingCar {

	//唯一标识
	private int id;
	//用户ID
	private int user_id;
	//商品Code
	private String product_code;
	//商品数量
	private int num;
	//商品状态
	private int state;
	public ShoppingCar() {
		super();
	}
	
	public ShoppingCar(int userId, String productCode, int num, int state) {
		super();
		user_id = userId;
		product_code = productCode;
		this.num = num;
		this.state = state;
	}

	
	public ShoppingCar(int id, int userId, String productCode, int num,
			int state) {
		super();
		this.id = id;
		user_id = userId;
		product_code = productCode;
		this.num = num;
		this.state = state;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int userId) {
		user_id = userId;
	}

	public String getProduct_code() {
		return product_code;
	}

	public void setProduct_code(String productCode) {
		product_code = productCode;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "ShoppingCar [id=" + id + ", num=" + num + ", product_code="
				+ product_code + ", state=" + state + ", user_id=" + user_id
				+ "]";
	}

}
