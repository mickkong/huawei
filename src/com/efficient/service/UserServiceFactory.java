package com.efficient.service;

import com.efficient.service.user.CheckAccService;
import com.efficient.service.user.EvaluationService;
import com.efficient.service.user.ExitService;
import com.efficient.service.user.FindCode;
import com.efficient.service.user.FindUserByIdService;
import com.efficient.service.user.RegiestService;
import com.efficient.service.user.RemberService;
import com.efficient.service.user.ShowProListService;
import com.efficient.service.user.UserListService;
import com.efficient.service.user.UserLoginService;
import com.efficient.service.user.ValidateService;

/**
 * 用户信息业务处理工厂
 * @author 雷雨田
 * @Date 2017/07
 */
public abstract class UserServiceFactory {

	private UserServiceFactory() {
	}

	/**
	 * 通过实例名获得
	 * 
	 * @param name
	 * @return
	 */
	public static IService getInstance(String name) {
		if(name.equals("userList")) {
			return new UserListService();
		}else if(name.equals("showProList")){
			return new ShowProListService();
		}else if(name.equals("login")){
			return new UserLoginService();
		}else if(name.equals("checkAcc")){
			return new CheckAccService();
		}else if(name.equals("rember")){
			return new RemberService();
		}else if(name.equals("findCode")){
			return new FindCode();
		}else if(name.equals("regiest")){
			return new RegiestService();
		}else if(name.equals("validate")){
			return new ValidateService();
		}else if(name.equals("findUserById")){
			return new FindUserByIdService();
		}else if(name.equals("evaluation")){
			return new EvaluationService();
		}else if(name.equals("exit")){
			return new ExitService();
		}
		return null;
	}
}
