package com.action;

import java.io.IOException;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dao.SaveEDao;
import com.opensymphony.xwork2.ActionContext;

	
public class ManageAction {
	
	private String managerName ;
	private String managerPSW ;
	private String loginStatus ;
	private String tempPSW ;
	public String getManagerName() {
        return managerName;
    }
    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }
    public String getManagerPSW() {
        return managerPSW;
    }
    public void setManagerPSW(String managerPSW) {
        this.managerPSW = managerPSW;
    }
    public String getLoginStatus() {
        return loginStatus;
    }
    public void setLoginStatus(String loginStatus) {
        this.loginStatus = loginStatus;
    }
    public String getPSW(String managerName) throws Exception {
    	SqlSession session = Constants.getSqlSession();
		SaveEDao saveEDao = session.getMapper(SaveEDao.class);
        String PSW = saveEDao.queryPSW(managerName);
        session.commit();
        session.close();
        System.out.println(PSW);
        return PSW;
	}
	public String execute() throws Exception {
		ActionContext actionContext = ActionContext.getContext();
		Map session = actionContext.getSession();
		session.put("user", "Test User");
		System.out.println("ManageAction execute函数");
		System.out.println(getManagerName()+":"+getManagerPSW());
		tempPSW = getPSW(getManagerName());
		if(tempPSW == null){
			setLoginStatus("账号不存在");
	        return "FAIL";
		}
		if(getManagerPSW().equals(tempPSW)){
			System.out.println("验证成功");
			setLoginStatus("登陆成功");
	        return "SUCCESS";
		}
		
		System.out.println("验证失败");
		setLoginStatus("密码错误");
	        return "FAIL";
	    }
}