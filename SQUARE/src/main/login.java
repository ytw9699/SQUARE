package main;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.Action;

public class login implements Action, SessionAware, RequestAware, ServletRequestAware {

	
	SqlMapClient sqlMapper;
	Map sessionMap;
	Map requestMap;
	HttpServletRequest request;
	
	private String id;
	private String password;
	
	public login() throws IOException{
		Reader reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		
		int checkNumber = 0;
		int statusCheckNumber = 0;
		
		memberVO member = new memberVO();
		member.setId(getId());
		member.setPassword(getPassword());
		
		checkNumber = (int) sqlMapper.queryForObject("userCheckID", member);
		if(checkNumber == 0)
			return LOGIN;
		statusCheckNumber = (int) sqlMapper.queryForObject("userStatusCheck", member);
		if(statusCheckNumber == 2)
			return ERROR;
		
		sessionMap.put("logonID", getId());
		
		return SUCCESS;
		
		
		
		/*if(checkNumber == 0)	
			return LOGIN;
		else if(statusCheckNumber == 2)
			return ERROR;
		else {
			sessionMap.put("logonID", getId());
			
			return SUCCESS;
		}*/
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

	

	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
