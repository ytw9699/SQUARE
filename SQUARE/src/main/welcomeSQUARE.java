package main;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;

public class welcomeSQUARE extends ActionSupport {

	private String id;
	private String password;
	private String password2;
	private String email;
	private String name;
	private String phone_num;
	private String account;
	private String zipcode;
	private String address;
	private String jumin;
	
	private SqlMapClient sqlMapper;
	
	public welcomeSQUARE() throws IOException {
		Reader reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		memberVO member = new memberVO();
		member.setId(getId());
		member.setPassword(getPassword());
		member.setEmail(getEmail());
		member.setName(getName());
		member.setPhone_num(getPhone_num());
		member.setAccount(getAccount());
		member.setZipcode(getZipcode());
		member.setAddress(getAddress());
		member.setJumin(getJumin());
		
		sqlMapper.insert("memberJoin",member);
		
		return SUCCESS;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone_num() {
		return phone_num;
	}

	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}
	
	

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getJumin() {
		return jumin;
	}

	public void setJumin(String jumin) {
		this.jumin = jumin;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public void setSqlMapper(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}
	
	
	
}
