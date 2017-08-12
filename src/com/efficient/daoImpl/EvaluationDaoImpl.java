package com.efficient.daoImpl;

import org.apache.ibatis.session.SqlSession;
import com.efficient.bean.Evaluation;
import com.efficient.dao.IEvaluationDao;
import com.efficient.util.MybatisUtil;

/**
 * 评价实体的实现接口层
 * @author 雷雨田
 * @Date 2017/07
 */
public class EvaluationDaoImpl implements IEvaluationDao{

	//加入评价数据
	public int insertEva(Evaluation eva) {
		// 获得一个sql会话
		SqlSession session = MybatisUtil.getSession();
		String statement = "EvaluationDao.insertEva";
		int result = session.insert(statement,eva);
		// 变更数据后用commit方法提交数据
		session.commit();
		session.close();
		return result;
	}
}
