package com.efficient.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.efficient.bean.Product;
import com.efficient.bean.ProductEva;
import com.efficient.dao.IProductDao;
import com.efficient.util.MybatisUtil;

/**
 * 商品类实现层
 * @author 雷雨田
 * @Date 2017/07
 */
public class ProductDaoImpl implements IProductDao{

	/**
	 * 根据编号查询一条数据
	 */
	public Product ListProduct(String code) {
		//获得会话
		SqlSession sqlSession=MybatisUtil.getSession();
		//statement
		String statement="ProductDao.ListProduct";
		//执行
		Product product=sqlSession.selectOne(statement, code);
		//提交
		sqlSession.close();
		return product;
	}

	/**
	 * 查询所有数据
	 */
	public List<Product> getListProduct(int userid) {
		//获得会话
		SqlSession sqlSession=MybatisUtil.getSession();
		//statement
		String statement="ProductDao.getListProduct";
		//执行
		List<Product> list=sqlSession.selectList(statement, userid);
		//提交
		sqlSession.close();
		return list;
	}

	/**
	 * 根据userid查询商品信息
	 */
	public List<Product> getProductBystate(int userid) {
		//获得会话
		SqlSession sqlSession=MybatisUtil.getSession();
		//statement
		String statement="ProductDao.getProductBystate";
		//执行
		List<Product> list=sqlSession.selectList(statement,userid);
		//提交
		sqlSession.close();
		return list;
	}
	
	/**
	 * 查询商品信息
	 */
	public List<ProductEva> getProductByCode(int userid) {
		//获得会话
		SqlSession sqlSession=MybatisUtil.getSession();
		//statement
		String statement="ProductDao.getProductByCode";
		//执行
		List<ProductEva> list=sqlSession.selectList(statement,userid);
		//提交
		sqlSession.close();
		return list;
	}

}
