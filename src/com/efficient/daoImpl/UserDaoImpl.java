package com.efficient.daoImpl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.efficient.dao.IUserDao;
import com.efficient.bean.Evaluation;
import com.efficient.bean.User;
import com.efficient.util.MybatisUtil;

/**
 * 用户接口实现类
 * @author 雷雨田
 * @Date 2017/07
 */
public class UserDaoImpl implements IUserDao {

	//获得所有的用户信息
	public List<User> getUserList() {
		SqlSession session = MybatisUtil.getSession();
		String statement = "UserDao.getUserList";
		List<User> list = session.selectList(statement);
		return list;
	}
	
	// 注册
	public int register(User user) {
		SqlSession session = MybatisUtil.getSession();
		String statement = "UserDao.register";
		int result = session.insert(statement,user);
		session.commit();
		session.close();
		return result;
	}

	// 实名认证
	public int validateRealName(User user) {
		SqlSession session = MybatisUtil.getSession();
		String statement = "UserDao.validateRealName";
		int result = session.update(statement,user);
		session.commit();
		session.close();
		return result;
	}

	// 通过ID查找用户信息
	public User getById(int id) {
		SqlSession session = MybatisUtil.getSession();
		String statement = "UserDao.getById";
		User user = session.selectOne(statement,id);
		return user;
	}

	// 通过名查找用户信息
	public User getByName(String name) {
		SqlSession session = MybatisUtil.getSession();
		String statement = "UserDao.getByName";
		User user = session.selectOne(statement,name);
		return user;
	}

	// 更新余额
	public int updateBalance(User user) {
		SqlSession session = MybatisUtil.getSession();
		String statement = "UserDao.updateBalance";
		int result = session.update(statement,user);
		session.commit();
		session.close();
		return result;
	}
	
	// 更新积分(new setId setPoint)
	public int updatePointBan(User user) {
		SqlSession session = MybatisUtil.getSession();
		String statement = "UserDao.updatePointBan";
		int result = session.update(statement,user);
		session.commit();
		session.close();
		return result;
	}

	// 验证登录(setName,setPwd)
	public User login(User user) {
		SqlSession session = MybatisUtil.getSession();
		String statement = "UserDao.login";
		return session.selectOne(statement,user);
	}

	// 修改邮箱
	public int updateEmail(User user) {
		SqlSession session = MybatisUtil.getSession();
		String statement = "UserDao.updateEmail";
		int result = session.update(statement,user);
		return result;
	}

	// 修改手机号
	public int updatePhone(User user) {
		SqlSession session = MybatisUtil.getSession();
		String statement = "UserDao.updatePhone";
		int result = session.update(statement,user);
		return result;
	}

	// 修改密码
	public int updatePwd(User user) {
		SqlSession session = MybatisUtil.getSession();
		String statement = "UserDao.updatePwd";
		int result = session.update(statement,user);
		return result;
	}

	//邮箱登录
	public User emailLogin(User user) {
		SqlSession session = MybatisUtil.getSession();
		String statement = "UserDao.emailLogin";
		return session.selectOne(statement,user);
	}

	//手机登录
	public User phoneLogin(User user) {
		SqlSession session = MybatisUtil.getSession();
		String statement = "UserDao.phoneLogin";
		return session.selectOne(statement,user);
	}

	//根据用户的id查询余额
	public float getBalance(int id) {
		SqlSession session = MybatisUtil.getSession();
		String statement = "UserDao.getBalance";
		float balance = session.selectOne(statement,id);
		return balance;
	}
	
	//根据user_id查询评价
	public List<Evaluation> getEvaluation(int id) {
		SqlSession sqlSession=MybatisUtil.getSession();
		String statement="UserDao.getEvaluation";
		List<Evaluation> evaluation=sqlSession.selectList(statement, id);
		//提交
		sqlSession.close();
		return evaluation;
	}

}
