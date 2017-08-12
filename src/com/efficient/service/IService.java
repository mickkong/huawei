package com.efficient.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * servlet接口
 * @author 雷雨田
 * @Date 2017/07
 */
public interface IService  {
	void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException ;
}
