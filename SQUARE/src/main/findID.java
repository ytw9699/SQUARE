package main;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;

public class findID extends ActionSupport {

	
	SqlMapClient sqlMapper;
	private String name;
	private String email;
	private String foundID;
	
	public findID() throws IOException{
		
		sqlMapper = SqlMapper.getMapper();
		
		
	}
	
	public String execute() throws Exception{
		
		memberVO member = new memberVO();
		
		member.setName(getName());
		member.setEmail(getEmail());
		foundID = (String) sqlMapper.queryForObject("findID", member);
		
		if(foundID != null)
			return SUCCESS;
		else
			return ERROR;
	}

	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFoundID() {
		return foundID;
	}

	public void setFoundID(String foundID) {
		this.foundID = foundID;
	}
	
	
	
}
