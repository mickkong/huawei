package com.efficient.daoImpl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.efficient.bean.OrderDetail;
import com.efficient.dao.IOrderDetailDao;
import com.efficient.util.MybatisUtil;

/**
 * 订单明细接口类实现
 * @author 雷雨田
 * @Date 2017/07
 */
public class OrderDetailDaoImpl implements IOrderDetailDao {
	
	//根据订单编号找到明细表里的数据
	public List<OrderDetail> getListByOrderNo(String orderNo) {
		//获得会话
		SqlSession session = MybatisUtil.getSession();
		String statement = "OrderDetailDao.getListByOrderNo";
		List<OrderDetail> list = session.selectList(statement,orderNo);
		return list;
	}

	//获得所有订单明细表里的数据
	public List<OrderDetail> getDetailList() {
		//获得会话
		SqlSession session = MybatisUtil.getSession();
		String statement = "OrderDetailDao.getDetailList";
		List<OrderDetail> list = session.selectList(statement);
		return list;
	}
	
	//向订单明细表里添加订单明细
	public int addDetail(OrderDetail orderDetail) {
		// 获得一个sql会话
		SqlSession session = MybatisUtil.getSession();
		String statement = "OrderDetailDao.addDetail";
		int result = session.insert(statement, orderDetail);
		// 变更数据后用commit方法提交数据
		session.commit();
		session.close();
		return result;
	}

}
