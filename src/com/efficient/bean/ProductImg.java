package com.efficient.bean;

/**
 * 商品图片实体类
 * 
 * @author Administrator
 * 
 */
public class ProductImg implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private String productCode;
	private String type;
	private String path;

	public ProductImg() {
	}

	public ProductImg(String productCode, String type, String path) {
		this.productCode = productCode;
		this.type = type;
		this.path = path;
	}

	public ProductImg(Integer id, String productCode, String type, String path) {
		super();
		this.id = id;
		this.productCode = productCode;
		this.type = type;
		this.path = path;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProductCode() {
		return this.productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}