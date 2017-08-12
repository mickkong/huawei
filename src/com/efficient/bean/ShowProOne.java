package com.efficient.bean;

 /**
 * 商品展示对象
 * @author 田锦辉
 * @Date 2017/07
 */
public class ShowProOne {
	
	//商品编码
	private String proCode;
	
    //商品名
	private String proName;
	
	//商品图片路径
	private String proImgPath;
	
	//商品单价
	private int  proPrice;
	
	//商品评价数量
	private int evlCount;
	
	//描述
	private String descr;
	
    
	public ShowProOne(){
		
	}


	public String getProCode() {
		return proCode;
	}


	public void setProCode(String proCode) {
		this.proCode = proCode;
	}


	public String getProName() {
		return proName;
	}


	public void setProName(String proName) {
		this.proName = proName;
	}


	public String getProImgPath() {
		return proImgPath;
	}


	public void setProImgPath(String proImgPath) {
		this.proImgPath = proImgPath;
	}


	public int getProPrice() {
		return proPrice;
	}


	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}


	public int getEvlCount() {
		return evlCount;
	}


	public void setEvlCount(int evlCount) {
		this.evlCount = evlCount;
	}


	
	
	public String getDescr() {
		return descr;
	}


	public void setDescr(String descr) {
		this.descr = descr;
	}


	public ShowProOne(String proCode, String proName, String proImgPath,
			int proPrice, int evlCount,String descr) {
		super();
		this.proCode = proCode;
		this.proName = proName;
		this.proImgPath = proImgPath;
		this.proPrice = proPrice;
		this.evlCount = evlCount;
		this.descr=descr;
	}


	
	
	
}
