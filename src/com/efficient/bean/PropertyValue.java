package com.efficient.bean;

/**
 * 属性值实体类
 * @author 雷雨田
 * @Date 2017/07
 */
public class PropertyValue implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	//唯一标识
	private int id;
	//商品编号
	private String productCode;
	//属性值名
	private String propertyName;
	//属性值
	private String val;

	public PropertyValue() {
	}

	public PropertyValue(String productCode, String propertyName, String value) {
		this.productCode = productCode;
		this.propertyName = propertyName;
		this.val = value;
	}

	public PropertyValue(int id, String productCode, String propertyName,
			String value) {
		super();
		this.id = id;
		this.productCode = productCode;
		this.propertyName = propertyName;
		this.val = value;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProductCode() {
		return this.productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getPropertyName() {
		return this.propertyName;
	}

	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}

	public String getValue() {
		return this.val;
	}

	public void setValue(String value) {
		this.val = value;
	}

}