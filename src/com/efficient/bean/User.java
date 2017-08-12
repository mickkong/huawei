package com.efficient.bean;

/**
 * 用户实体类
 * @author 雷雨田
 * @Date 2017/07
 */
public class User implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	//唯一标识
	private int id;
	//用户名
	private String name;
	//用户密码
	private String pwd;
	//用户手机号
	private String phone;
	//用户邮箱
	private String email;
	//用户真实姓名
	private String realname;
	//用户身份证号
	private String idcard;
	//用户银行卡
	private String bankcard;
	//用户余额
	private float balance;
	//积分
	private int point;

	public User() {
	}

	/**
	 * 专用于更新积分和余额
	 * @param id
	 * @param point
	 */
	public User(int id, int point,float balance) {
		super();
		this.id = id;
		this.point = point;
		this.balance=balance;
	}

	/**
	 * 用于注册的构造方法
	 * 
	 * @param id
	 * @param name
	 * @param pwd
	 */
	public User(String name, String pwd, String phone, String email) {
		super();
		this.name = name;
		this.pwd = pwd;
		this.phone = phone;
		this.email = email;
	}

	/**
	 * 用于实名认证的构造方法
	 * 
	 * @param realname
	 * @param idcard
	 * @param bankcard
	 */
	public User(int id, String realname, String idcard, String bankcard) {
		super();
		this.id = id;
		this.realname = realname;
		this.idcard = idcard;
		this.bankcard = bankcard;
	}

	public User(String name, String pwd, String phone, String email,
			String realname, String idcard, String bankcard, Float balance,
			int point) {
		this.name = name;
		this.pwd = pwd;
		this.phone = phone;
		this.email = email;
		this.realname = realname;
		this.idcard = idcard;
		this.bankcard = bankcard;
		this.balance = balance;
		this.point = point;
	}

	public User(int id, String name, String pwd, String phone,
			String email, String realname, String idcard, String bankcard,
			Float balance, int point) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.phone = phone;
		this.email = email;
		this.realname = realname;
		this.idcard = idcard;
		this.bankcard = bankcard;
		this.balance = balance;
		this.point = point;
	}

	public int getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getIdcard() {
		return this.idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getBankcard() {
		return this.bankcard;
	}

	public void setBankcard(String bankcard) {
		this.bankcard = bankcard;
	}

	public float getBalance() {
		return this.balance;
	}

	public void setBalance(float balance) {
		this.balance = balance;
	}

	public int getPoint() {
		return this.point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

}