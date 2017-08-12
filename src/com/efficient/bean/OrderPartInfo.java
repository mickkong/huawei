package com.efficient.bean;

import java.sql.Timestamp;

/**
 * 组合实体类
 * @author 雷雨田
 * @Date 2017/07
 */
public class OrderPartInfo {

	//user_id
	private int user_id; 
	//订单编号
	private String orderNo;
	//订单状态
	private String state;
	//创建日期
	private Timestamp createDate;
	//应收金额
	private float amt;
	//实收金额
	private float finalAmt;
	
	public OrderPartInfo() {

	}
	
	public OrderPartInfo(int userId, String state) {
		super();
		this.user_id = userId;
		this.state = state;
	}

	public int getUserId() {
		return user_id;
	}

	public void setUserId(int userId) {
		this.user_id = userId;
	}

	public OrderPartInfo(String orderNo, String state, Timestamp createDate,
			float amt, float finalAmt) {
		super();
		this.orderNo = orderNo;
		this.state = state;
		this.createDate = createDate;
		this.amt = amt;
		this.finalAmt = finalAmt;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public float getAmt() {
		return amt;
	}
	public void setAmt(float amt) {
		this.amt = amt;
	}
	public float getFinalAmt() {
		return finalAmt;
	}
	public void setFinalAmt(float finalAmt) {
		this.finalAmt = finalAmt;
	}
}
