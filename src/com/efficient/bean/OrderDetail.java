package com.efficient.bean;

/**
 * 订单明细实体类
 * @author 雷雨田
 * @Date 2017/07
 */
public class OrderDetail implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	//id唯一标识
	private int id;
	//订单编号
	private String order_no;
	//商品编号
	private String product_code;
	//商品数量
	private int num;

	//无参构造
	public OrderDetail() {
	}

	public OrderDetail(String orderNo, String productCode, int num) {
		this.order_no = orderNo;
		this.product_code = productCode;
		this.num = num;
	}

	public OrderDetail(int id, String orderNo, String productCode,
			int num) {
		super();
		this.id = id;
		this.order_no = orderNo;
		this.product_code = productCode;
		this.num = num;
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

	public String getProductCode() {
		return this.product_code;
	}

	public void setProductCode(String productCode) {
		this.product_code = productCode;
	}

	public int getNum() {
		return this.num;
	}

	public void setNum(int num) {
		this.num = num;
	}

}