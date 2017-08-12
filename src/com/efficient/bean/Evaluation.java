package com.efficient.bean;

import java.sql.Timestamp;

/**
 * 客户评价的实体类
 * @author 雷雨田
 * @Date 2017/07
 */
public class Evaluation implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	//评价的id 唯一标识
	private int id;
	//商品编号
	private String productCode;
	//用户id
	private int userId;
	//评价等级
	private int level;
	//评论日期
	private Timestamp date;
	//评价内容
	private String content;
	//管理员回复日期
	private Timestamp replyDate;
	//管理员回复内容
	private String reply;
	
	//无参构造
	public Evaluation() {
	}

	public Evaluation(int id, String productCode, int userId, int level,
			Timestamp date, String content, Timestamp replyDate, String reply) {
		super();
		this.id = id;
		this.productCode = productCode;
		this.userId = userId;
		this.level = level;
		this.date = date;
		this.content = content;
		this.replyDate = replyDate;
		this.reply = reply;
	}

	public Evaluation(String productCode, int userId, int level,
			Timestamp date, String content, Timestamp replyDate, String reply) {
		super();
		this.productCode = productCode;
		this.userId = userId;
		this.level = level;
		this.date = date;
		this.content = content;
		this.replyDate = replyDate;
		this.reply = reply;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Timestamp replyDate) {
		this.replyDate = replyDate;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}
	
	
	}