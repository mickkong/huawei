package com.efficient.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.efficient.bean.ShoppingCar;
import com.efficient.dao.IShoppingCarDao;
import com.efficient.util.MybatisUtil;

/**
 * 实现购物车方法
 * @author HC
 * @Date 2017/07
 */
public class ShoppingCarDaoImpl implements IShoppingCarDao{

	/**
	 * 获取该用户的所有商品
	 */
	public List<ShoppingCar> ListShoppingCar(int id) {
		//获得会话
		SqlSession sqlSession=MybatisUtil.getSession();
		//statement
		String statement="ShoppingCarDao.ListShoppingCar";
		//执行语句
		List<ShoppingCar> list=sqlSession.selectList(statement,id);
		//关闭
		sqlSession.close();
		//返回
		return list;
	}

	/**
	 * 删除一条数据
	 */
	public int removeProduct(int id) {
		//创建会话
		SqlSession sqlSession=MybatisUtil.getSession();
		//statement
		String statement="ShoppingCarDao.removeProduct";
		//执行
		int result=sqlSession.delete(statement, id);
		//提交
		sqlSession.commit();
		//关闭
		sqlSession.close();
		//返回
		return result;
	}
	
	/**
	 * 删除一条数据
	 */
	public int removeProductBycode(int id) {
		//创建会话
		SqlSession sqlSession=MybatisUtil.getSession();
		//statement
		String statement="ShoppingCarDao.removeProductBycode";
		//执行
		int result=sqlSession.delete(statement, id);
		//提交
		sqlSession.commit();
		//关闭
		sqlSession.close();
		//返回
		return result;
	}

	/**
	 * 获得总价钱
	 */
	public float sumPrice(int userId) {
		//获得会话
		SqlSession sqlSession=MybatisUtil.getSession();
		//statement
		String statement="ShoppingCarDao.sumPrice";
		//执行语句
		float sum=sqlSession.selectOne(statement,userId);
		//关闭
		sqlSession.close();
		//返回
		return sum;
	}

	/**
	 * 查询该商品是否存在购物车
	 * @param shoppingCar
	 * @return
	 */
	public ShoppingCar selectByCode(ShoppingCar shoppingCar) {
		//获得会话
		SqlSession sqlSession=MybatisUtil.getSession();
		//statement
		String statement="ShoppingCarDao.selectByCode";
		//执行语句
		ShoppingCar shoppingCar1=sqlSession.selectOne(statement,shoppingCar);
		//关闭
		sqlSession.close();
		//返回
		return shoppingCar1;
	}

	/**
	 * 插入数据
	 */
	public int insert(ShoppingCar shoppingCar) {
		//创建会话
		SqlSession sqlSession=MybatisUtil.getSession();
		//statement
		String statement="ShoppingCarDao.insert";
		//执行
		int result=sqlSession.insert(statement, shoppingCar);
		//提交
		sqlSession.commit();
		//关闭
		sqlSession.close();
		//返回
		return result;
	}

	/**
	 * 更新数据
	 */
	public int updateNum(ShoppingCar shoppingCar) {
		//创建会话
		SqlSession sqlSession=MybatisUtil.getSession();
		//statement
		String statement="ShoppingCarDao.updateNum";
		//执行
		int result=sqlSession.insert(statement, shoppingCar);
		//提交
		sqlSession.commit();
		//关闭
		sqlSession.close();
		//返回
		return result;
	}

	/**
	 * 根据状态获取购物车中的商品
	 */
	public List<ShoppingCar> ListShoppingCarByState(int id) {
		//获得会话
		SqlSession sqlSession=MybatisUtil.getSession();
		//statement
		String statement="ShoppingCarDao.ListShoppingCarByState";
		//执行语句
		List<ShoppingCar> list=sqlSession.selectList(statement,id);
		//关闭
		sqlSession.close();
		//返回
		return list;
	}

}
