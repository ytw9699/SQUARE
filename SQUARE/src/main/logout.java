package main;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class logout extends ActionSupport implements SessionAware, RequestAware, ServletRequestAware {

	Map sessionMap;
	Map requestMap;
	HttpServletRequest request;
	HttpServletResponse response;
	
	public String execute() throws Exception{
		
		sessionMap.remove("logonID");
		sessionMap.remove("headerLineList");
		
		return SUCCESS;
	}
	
	//SessionAware의 setSession 구현
			public void setSession(Map session) {
				this.sessionMap = session;
			}	
				//RequestAware의 setRequest 구현
			public void setRequest(Map requestMap) {
				this.requestMap = requestMap;
			}	
				//ServletRequestAware의 serServletRequest 구현
			public void setServletRequest(HttpServletRequest request) {
				this.request = request;
			}	
	
}
