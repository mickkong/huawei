package com.efficient.daoImpl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import com.efficient.bean.OrderAndProduct;
import com.efficient.bean.OrderDetail;
import com.efficient.bean.OrderInfo;
import com.efficient.bean.OrderPartInfo;
import com.efficient.dao.IOrderInfoDao;
import com.efficient.util.MybatisUtil;

/**
 * 订单信息接口实现类
 * @author 雷雨田
 * @Date 2017/07
 */
public class OrderInfoDaoImpl implements IOrderInfoDao {

	//获取所有的订单信息
	public List<OrderInfo> getOrderList() {
		//获得会话
		SqlSession session = MybatisUtil.getSession();
		String statement = "OrderInfoDao.getOrderList";
		List<OrderInfo> list = session.selectList(statement);
		return list;
	}
	
	//根据编号查找商品code
	public List<OrderDetail> getProCodeByOrderNo(String orderNo) {
		//获得会话
		SqlSession session = MybatisUtil.getSession();
		String statement = "OrderInfoDao.getProCodeByOrderNo";
		List<OrderDetail> list = session.selectList(statement,orderNo);
		return list;
	}
	
	//根据订单编号查询收货地址id
	public int getAddrIdByOrderNo(String orderNo) {
		//获得会话
		SqlSession session = MybatisUtil.getSession();
		String statement = "OrderInfoDao.getAddrIdByOrderNo";
		int list = session.selectOne(statement,orderNo);
		return list;
	}
	
	//获取部分订单信息（主要用于解决el表达式不支持下划线的问题）
	public List<OrderPartInfo> getPartOrder(int id) {
		//获得会话
		SqlSession session = MybatisUtil.getSession();
		String statement = "OrderInfoDao.getPartOrder";
		List<OrderPartInfo> list = session.selectList(statement,id);
		return list;
	}
	
	//根据状态获得部分订单信息
	public List<OrderPartInfo> getPartByState(OrderPartInfo state) {
		//获得会话
		SqlSession session = MybatisUtil.getSession();
		String statement = "OrderInfoDao.getPartByState";
		List<OrderPartInfo> list = session.selectList(statement,state);
		return list;
	}

	//更新订单信息
	public int updateOrder(OrderInfo orderInfo) {
		//获得会话
		SqlSession session = MybatisUtil.getSession();
		String statement = "OrderInfoDao.update";
		int result = session.update(statement, orderInfo);
		session.commit();
		session.close();
		return result;
	}
	
	//修改订单的状态
	public int updatestate(OrderInfo orderInfo) {
		//获得会话
		SqlSession session = MybatisUtil.getSession();
		String statement = "OrderInfoDao.updatestate";
		int result = session.update(statement, orderInfo);
		session.commit();
		session.close();
		return result;
	}
	
	//更新创建日期
	public int updateCreateDate(OrderInfo orderInfo) {
		//获得会话
		SqlSession session = MybatisUtil.getSession();
		String statement = "OrderInfoDao.updateCreateDate";
		int result = session.update(statement, orderInfo);
		session.commit();
		session.close();
		return result;
	}

	//插入订单信息
	public int insert(OrderInfo orderInfo) {
		// 获得一个sql会话
		SqlSession session = MybatisUtil.getSession();
		String statement = "OrderInfoDao.insert";
		int result = session.insert(statement, orderInfo);
		// 变更数据后用commit方法提交数据
		session.commit();
		session.close();
		return result;
	}

	//连表查询订单信息
	public List<OrderAndProduct> selectOrderInfo() {
		//获得会话
		SqlSession session = MybatisUtil.getSession();
		String statement = "OrderInfoDao.getOrderInfo";
		List<OrderAndProduct> list = session.selectList(statement);
		return list;
	}
	
	//根据订单状态连表查询订单信息
	public List<OrderAndProduct> getOrderByState(String state) {
		//获得会话
		SqlSession session = MybatisUtil.getSession();
		String statement = "OrderInfoDao.getOrderByState";
		List<OrderAndProduct> list = session.selectList(statement,state);
		return list;
	}
}
