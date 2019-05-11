package main;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class passChange extends ActionSupport {
	
	SqlMapClient sqlMapper;
	
	private String id;
	private String email;
	private String password;
	private String password2;
	
	public passChange() throws IOException {
		Reader reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String form() throws Exception{
		return SUCCESS;
	}
	
	public String passChangePro() throws Exception{
	
		System.out.println("아이디는 "+getId());
		System.out.println("비밀번호는 "+getPassword());
		memberVO member = new memberVO();
		member.setId(getId());
		member.setPassword(getPassword());
		sqlMapper.update("passwordChange", member);
		
		
		return SUCCESS;
	}
	
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
