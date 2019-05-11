package main;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;

public class checkID extends ActionSupport {

	SqlMapClient sqlMapper;
	private String id;
	private int resultNumber;
	
	public checkID() {
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception{
		
		resultNumber = -1;
		resultNumber = (int) sqlMapper.queryForObject("selectCheckJoinId", getId());
		
		
		return SUCCESS;
	}

	public SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public void setSqlMapper(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getResultNumber() {
		return resultNumber;
	}

	public void setResultNumber(int resultNumber) {
		this.resultNumber = resultNumber;
	}
	
	
	
}
