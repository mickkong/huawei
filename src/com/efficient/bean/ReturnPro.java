package com.efficient.bean;

import java.sql.Timestamp;
import java.util.Date;

/**
 * 退货信息实体类
 * @author 雷雨田
 * @Date 2017/07
 */
public class ReturnPro implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	//唯一标识
	private int id;
	//用户id
	private int userId;
	//订单编号
	private String orderNo;
	//电话
	private String phone;
	//状态
	private String state;
	//退货日期
	private Timestamp returnDate;
	//退货理由
	private String reason;
	//退货金额
	private Float amount;
	//退货快递
	private String expressName;
	//退货快递编号
	private String expressNo;

	public ReturnPro() {
	}

	public ReturnPro(int userId, String orderNo, String phone,
			String state, Timestamp returnDate, String reason, Float amount,
			String expressName, String expressNo) {
		this.userId = userId;
		this.orderNo = orderNo;
		this.phone = phone;
		this.state = state;
		this.returnDate = returnDate;
		this.reason = reason;
		this.amount = amount;
		this.expressName = expressName;
		this.expressNo = expressNo;
	}

	public ReturnPro(int id, int userId, String orderNo, String phone,
			String state, Timestamp returnDate, String reason, Float amount,
			String expressName, String expressNo) {
		super();
		this.id = id;
		this.userId = userId;
		this.orderNo = orderNo;
		this.phone = phone;
		this.state = state;
		this.returnDate = returnDate;
		this.reason = reason;
		this.amount = amount;
		this.expressName = expressName;
		this.expressNo = expressNo;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getOrderNo() {
		return this.orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Date getReturnDate() {
		return this.returnDate;
	}

	public void setReturnDate(Timestamp returnDate) {
		this.returnDate = returnDate;
	}

	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Float getAmount() {
		return this.amount;
	}

	public void setAmount(Float amount) {
		this.amount = amount;
	}

	public String getExpressName() {
		return this.expressName;
	}

	public void setExpressName(String expressName) {
		this.expressName = expressName;
	}

	public String getExpressNo() {
		return this.expressNo;
	}

	public void setExpressNo(String expressNo) {
		this.expressNo = expressNo;
	}

}