package com.efficient.dao;

import java.util.List;

import com.efficient.bean.Evaluation;
import com.efficient.bean.User;

/**
 * 用户数据处理接口
 * @author 雷雨田
 * @Date 2017/07
 */
public interface IUserDao {
	
	//获得所有的用户信息
	List<User> getUserList();

	// 注册
	int register(User user);

	// 实名认证
	int validateRealName(User user);

	// 通过ID查找用户信息
	User getById(int id);
	
	// 通过名查找用户信息
	User getByName(String name);

	// 更新积分(new setId setPoint)
	int updatePointBan(User user);

	// 验证登录(setName,setPwd)
	User login(User user);
	
	//手机登录
	User phoneLogin(User user);
	
	//邮箱登录
	User emailLogin(User user);

	// 修改手机号
	int updatePhone(User user);

	// 修改邮箱
	int updateEmail(User user);

	// 修改密码
	int updatePwd(User user);
	
	//根据user_id查询余额
	float getBalance(int id);
	
	//根据user_id查询评价
	List<Evaluation> getEvaluation(int id);

}