package com.efficient.bean;

/**
 * 收货地址实体类
 * @author hc
 * @Date 2017/07
 */
public class ReceiveAddr implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	//唯一标识
	private int id;
	//用户ID
	private int user_id;
	//收货人
	private String receiver;
	//收货地址
	private String addr;
	//邮编
	private String zipcode;
	//手机号
	private String phone;
	//默认地址
	private int mark;

	public ReceiveAddr() {
	}
	
	

	public ReceiveAddr(int id, int user_id) {
		super();
		this.id = id;
		this.user_id = user_id;
	}

	public ReceiveAddr(int userId, String receiver, String addr,
			String zipcode, String phone, int mark) {
		this.user_id = userId;
		this.receiver = receiver;
		this.addr = addr;
		this.zipcode = zipcode;
		this.phone = phone;
		this.mark = mark;
	}

	public ReceiveAddr(int id, int userId, String receiver,
			String addr, String zipcode, String phone, int mark) {
		super();
		this.id = id;
		this.user_id = userId;
		this.receiver = receiver;
		this.addr = addr;
		this.zipcode = zipcode;
		this.phone = phone;
		this.mark = mark;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return this.user_id;
	}

	public void setUserId(int userId) {
		this.user_id = userId;
	}

	public String getReceiver() {
		return this.receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getAddr() {
		return this.addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getZipcode() {
		return this.zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getMark() {
		return this.mark;
	}

	public void setMark(int mark) {
		this.mark = mark;
	}

}