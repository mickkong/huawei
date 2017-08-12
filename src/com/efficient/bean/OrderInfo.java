package com.efficient.bean;

import java.sql.Timestamp;

/**
 * 订单实体类
 * @author 雷雨田
 * @Date 2017/07
 */
public class OrderInfo implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	//订单id
	private int id;
	//订单编号
	private String order_no;
	//用户Id
	private int user_id;
	//收货地址Id
	private int rec_addr_id;
	//订单状态
	private String state;
	//创建日期
	private Timestamp create_date;
	//支付时间
	private Timestamp pay_date;
	//完成时间
	private Timestamp finish_date;
	//应收金额
	private float amt;
	//实收金额
	private float final_amt;
	//快递名
	private String express_name;
	//快递编号
	private String express_no;

	//无参构造
	public OrderInfo() {
	}
	
	//根据订单的编号修改订单状态
	public OrderInfo(String order_no, String state) {
		super();
		this.order_no = order_no;
		this.state = state;
	}


	//此构造函数用于根据order_no更新下单时间
	public OrderInfo(String order_no, Timestamp create_date) {
		super();
		this.order_no = order_no;
		this.create_date = create_date;
	}

	public OrderInfo(String order_no, String state, Timestamp create_date,
			float amt, float final_amt) {
		super();
		this.order_no = order_no;
		this.state = state;
		this.create_date = create_date;
		this.amt = amt;
		this.final_amt = final_amt;
	}

	//此构造函数只有订单编号，状态，支付时间，完成时间，实收金额（用于修改订单信息）
	public OrderInfo(String order_no, String state, Timestamp pay_date,
			Timestamp finfish_date,float final_amt) {
		super();
		this.order_no = order_no;
		this.state = state;
		this.pay_date = pay_date;
		this.finish_date = finfish_date;
		this.final_amt=final_amt;
	}


	//此构造函数没有付款和完成付款时间
	public OrderInfo(String order_no, int user_id,
			int rec_addr_id, String state, Timestamp create_date, float amt,
			float final_amt, String express_name, String express_no) {
		super();
		
		this.order_no = order_no;
		this.user_id = user_id;
		this.rec_addr_id = rec_addr_id;
		this.state = state;
		this.create_date = create_date;
		this.amt = amt;
		this.final_amt = final_amt;
		this.express_name = express_name;
		this.express_no = express_no;
	}

	public OrderInfo(String orderNo, int user_id, int recAddrId,
			String state, Timestamp create_date, Timestamp pay_date, Timestamp finish_date,
			float amt, float finalAmt, String expressName, String expressNo) {
		this.order_no = orderNo;
		this.user_id = user_id;
		this.rec_addr_id = recAddrId;
		this.state = state;
		this.create_date = create_date;
		this.pay_date = pay_date;
		this.finish_date = finish_date;
		this.amt = amt;
		this.final_amt = finalAmt;
		this.express_name = expressName;
		this.express_no = expressNo;
	}

	public OrderInfo(int id, String orderNo, int user_id,
			int recAddrId, String state, Timestamp create_date, Timestamp pay_date,
			Timestamp finish_date, float amt, float finalAmt, String expressName,
			String expressNo) {
		super();
		this.id = id;
		this.order_no = orderNo;
		this.user_id = user_id;
		this.rec_addr_id = recAddrId;
		this.state = state;
		this.create_date = create_date;
		this.pay_date = pay_date;
		this.finish_date = finish_date;
		this.amt = amt;
		this.final_amt = finalAmt;
		this.express_name = expressName;
		this.express_no = expressNo;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderNo() {
		return this.order_no;
	}

	public void setOrderNo(String orderNo) {
		this.order_no = orderNo;
	}

	public int getuser_id() {
		return this.user_id;
	}

	public void setuser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getRecAddrId() {
		return this.rec_addr_id;
	}

	public void setRecAddrId(int recAddrId) {
		this.rec_addr_id = recAddrId;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Timestamp getCreateTimestamp() {
		return this.create_date;
	}

	public void setCreateTimestamp(Timestamp create_date) {
		this.create_date = create_date;
	}

	public Timestamp getPayTimestamp() {
		return this.pay_date;
	}

	public void setPayTimestamp(Timestamp pay_date) {
		this.pay_date = pay_date;
	}

	public Timestamp getFinishTimestamp() {
		return this.finish_date;
	}

	public void setFinishTimestamp(Timestamp finish_date) {
		this.finish_date = finish_date;
	}

	public float getAmt() {
		return this.amt;
	}

	public void setAmt(float amt) {
		this.amt = amt;
	}

	public float getFinalAmt() {
		return this.final_amt;
	}

	public void setFinalAmt(float finalAmt) {
		this.final_amt = finalAmt;
	}

	public String getExpressName() {
		return this.express_name;
	}

	public void setExpressName(String expressName) {
		this.express_name = expressName;
	}

	public String getExpressNo() {
		return this.express_no;
	}

	public void setExpressNo(String expressNo) {
		this.express_no = expressNo;
	}

}