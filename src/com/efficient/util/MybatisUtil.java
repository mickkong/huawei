package com.efficient.util;

import java.io.IOException;
import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * MybatisUtil 工具
 * @author 雷雨田
 * @Date 2017/07
 */
public class MybatisUtil {
	
	public static SqlSession getSession() {
		//创建session会话
		SqlSession session = null;
		//mybatis配置文件路径
		String resource = "mybatis-config.xml";
		//读配置文件
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader(resource);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//创建sqlsessison工厂
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		session = sessionFactory.openSession();
		return session;
	}
}
