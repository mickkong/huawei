package com.efficient.daoImpl;

import java.util.List;



import org.apache.ibatis.session.SqlSession;
import com.efficient.dao.IShowProductDao;
import com.efficient.bean.DescBean;
import com.efficient.bean.Product;
import com.efficient.bean.PropertyValue;
import com.efficient.bean.ShoppingCar;
import com.efficient.bean.ShowProOne;
import com.efficient.util.MybatisUtil;

public class ShowProductDaoImpl implements IShowProductDao{
    
	/**
	 * 实现返回显示商品对象集合方法
	 */
	public List<ShowProOne> getList() {
		// 获得一个sql会话
		SqlSession session = MybatisUtil.getSession();
		// 和JDBC的statement差不多
		String statement = "ShowProductDao.getList";
		List<ShowProOne> list = session.selectList(statement);
		// 关闭session
		session.close();
		return list;
	}
	
	
	/**
	 * 实现返回显示商品对象集合方法 按系列分组
	 */
	public List<ShowProOne> getListSeries(String ser) {
		// 获得一个sql会话
		SqlSession session = MybatisUtil.getSession();
		// 和JDBC的statement差不多
		String statement = "ShowProductDao.getListSeries";
		List<ShowProOne> list = session.selectList(statement,ser);
		// 关闭session
		session.close();
		return list;
	}
	
	/**
	 * 实现返回显示商品单个对象方法
	 */
	public ShowProOne getOne(String code) {
		// 获得一个sql会话
		SqlSession session = MybatisUtil.getSession();
		// 和JDBC的statement差不多
		String statement = "ShowProductDao.getOne";
		ShowProOne proOne = session.selectOne(statement,code);
		// 关闭session
		session.close();
		return proOne;
	}
	
	/**
	 * 参数集合
	 */
	public List<PropertyValue> getValue(String code) {
		// 获得一个sql会话
		SqlSession session = MybatisUtil.getSession();
		// 和JDBC的statement差不多
		String statement = "ShowProductDao.getValue";
		List<PropertyValue> values = session.selectList(statement,code);
		// 关闭session
		session.close();
		return values;
	}
    
	/**
	 * 排序方法
	 */
	public List<ShowProOne> getListSort(String sortType) {
		// 获得一个sql会话
		SqlSession session = MybatisUtil.getSession();
		List<ShowProOne> list=null;
		//单价升序
		if(sortType.equals("priceUp")){
			String statement = "ShowProductDao.getListSort";
			list = session.selectList(statement);
		}else{
			//降序降序
			String statement = "ShowProductDao.getListSortDown";
			list = session.selectList(statement);
		}	
		// 关闭session
		session.close();
		return list;
	}

	/**
	 * 插入到购物车表
	 */
	public int saveToShopCar(ShoppingCar shopCar) {
		SqlSession session = MybatisUtil.getSession();
		String statement = "ShowProductDao.saveToShopCar";
		int result = session.insert(statement,shopCar);
		session.commit();
		session.close();
		return result;
	}
    
	/**
	 * 取得图片路径集合
	 */
	public List<String> findImgByNC(PropertyValue value) {
		// 获得一个sql会话
		SqlSession session = MybatisUtil.getSession();
		// 和JDBC的statement差不多
		String statement = "ShowProductDao.findImgByNC";
		List<String> imgPath = session.selectList(statement,value);
		// 关闭session
		session.close();
		return imgPath;
	}

	
	public String fingCode(DescBean dsb) {
		// 获得一个sql会话
		SqlSession session = MybatisUtil.getSession();
		// 和JDBC的statement差不多
		String statement = "ShowProductDao.findCode";
		String proCode = session.selectOne(statement,dsb);
		// 关闭session
		session.close();
		return proCode;
	}

	public Product fingProOne(ShowProOne pone) {
		// 获得一个sql会话
		SqlSession session = MybatisUtil.getSession();
		// 和JDBC的statement差不多
		String statement = "ShowProductDao.findProOne";
		Product proOne = session.selectOne(statement,pone);
		// 关闭session
		session.close();
		return proOne;
	}

}
