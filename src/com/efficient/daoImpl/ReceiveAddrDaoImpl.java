package com.efficient.daoImpl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.efficient.bean.ReceiveAddr;
import com.efficient.dao.IReceiveAddrDao;
import com.efficient.util.MybatisUtil;

/**
 * 收货地址实现层
 * @author HC
 * @Date 2017/07
 */
public class ReceiveAddrDaoImpl implements IReceiveAddrDao {

	/**
	 * 添加收货地址
	 */
	public int addReceiveAddr(ReceiveAddr receiveAddr) {
		//获取会话
		SqlSession sqlSession=MybatisUtil.getSession();
		//获取statement
		String statement="ReceiveAddrDao.addReceiveAddr";
		//执行，返回一个int型
		int result=sqlSession.insert(statement,receiveAddr);
		// 变更数据后用commit方法提交数据
		sqlSession.commit();
		//关闭
		sqlSession.close();
		//返回 
		return result;
	}

	/**
	 * 获得所有的收货地址
	 */
	public List<ReceiveAddr> getReceiveAddrList(int userId) {
		//获取会话
		SqlSession sqlSession=MybatisUtil.getSession();
		//获取statement
		String statement="ReceiveAddrDao.getReceiveAddrList";
		//执行，返回一个List型
		List<ReceiveAddr> list=sqlSession.selectList(statement, userId);
		//返回List
		return list;
	}
	
	/**
	 * 获取该用户的收货地址
	 */
	public String getAddr(ReceiveAddr addr) {
		//获取会话
		SqlSession sqlSession=MybatisUtil.getSession();
		//获取statement
		String statement="ReceiveAddrDao.getAddr";
		//执行，返回一个String型
		String list=sqlSession.selectOne(statement, addr);
		//返回List
		return list;
	}

	/**
	 * 根据id删除收货地址
	 */
	public int removeReceiveAddr(int id) {
		//获取会话
		SqlSession sqlSession=MybatisUtil.getSession();
		//获取statement
		String statement="ReceiveAddrDao.removeReceiveAddr";
		//执行，返回一个int型
		int result=sqlSession.delete(statement, id);
		// 变更数据后用commit方法提交数据
		sqlSession.commit();
		//关闭
		sqlSession.close();
		//返回
		return result;
	}

	/**
	 * 更新为默认地址
	 */
	public int updateMark(int id) {
		//获取会话
		SqlSession sqlSession=MybatisUtil.getSession();
		//获取statement
		String statement="ReceiveAddrDao.updateMark";
		//执行，返回一个int型
		int result=sqlSession.update(statement, id);
		// 变更数据后用commit方法提交数据
		sqlSession.commit();
		//关闭
		sqlSession.close();
		//返回
		return result;
	}
	
	/**
	 * 设置为不是默认地址
	 */
	public int updateNotMark(int id) {
		//获取会话
		SqlSession sqlSession=MybatisUtil.getSession();
		//获取statement
		String statement="ReceiveAddrDao.updateNotMark";
		//执行，返回一个int型
		int result=sqlSession.update(statement, id);
		// 变更数据后用commit方法提交数据
		sqlSession.commit();
		//关闭
		sqlSession.close();
		//返回
		return result;
	}

	/**
	 * 更新收货地址数据
	 */
	public int updateReceiveAddr(ReceiveAddr receiveAddr) {
		//获取会话
		SqlSession sqlSession=MybatisUtil.getSession();
		//获取statement
		String statement="ReceiveAddrDao.updateReceiveAddr";
		//执行，返回一个int型
		int result=sqlSession.update(statement, receiveAddr);
		// 变更数据后用commit方法提交数据
		sqlSession.commit();
		//关闭
		sqlSession.close();
		//返回
		return result;
	}
	
	/**
	 * 获取一条收货地址数据
	 */
	public ReceiveAddr oneReceiveAddr(int id) {
		//获取会话
		SqlSession sqlSession=MybatisUtil.getSession();
		//获取statement
		String statement="ReceiveAddrDao.oneReceiveAddr";
		//执行代码
		ReceiveAddr receive_addr=sqlSession.selectOne(statement, id);
		//返回list
		return receive_addr;
	}


}
