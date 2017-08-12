package com.efficient.bean;
/**
 * 描述类型
 * @author 田锦辉
 * @Date 2017/07
 */
public class DescBean {
	//描述内容
    String descContent;
    //商品名
    String proName;
    
    public DescBean() {
		
	}

	public String getDescContent() {
		return descContent;
	}

	public void setDescContent(String descContent) {
		this.descContent = descContent;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public DescBean(String descContent,String proName) {
		super();
		this.descContent = descContent;
		this.proName=proName;
	}
    
    
    
}
