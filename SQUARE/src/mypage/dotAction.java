package mypage;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;

public class dotAction extends ActionSupport {

	SqlMapClient sqlMapper;
	private String dc_id;
	private int dc_value;
	
	private String de_id;
	private int de_value;
	
	
	public dotAction() {
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String charge() throws Exception{
		
		int requestCheck = (int) sqlMapper.queryForObject("chargeReqExist", getDc_id());
		
		if(requestCheck > 0)
			return ERROR;
		
		chargeVO paramClass = new chargeVO();
		paramClass.setDc_id(getDc_id());
		paramClass.setDc_value(getDc_value());
		
		sqlMapper.insert("chargeRequest", paramClass);
		
		return SUCCESS;
	}
	
	public String exchange() throws Exception{
		
		int requestCheck = (int) sqlMapper.queryForObject("exchangeReqExist", getDe_id());
		
		if(requestCheck > 0)
			return ERROR;
		
		exchangeVO paramClass = new exchangeVO();
		paramClass.setDe_id(getDe_id());
		paramClass.setDe_value(getDe_value());
		
		sqlMapper.insert("exchangeRequest", paramClass);
		return SUCCESS;
	}

	public String getDc_id() {
		return dc_id;
	}

	public void setDc_id(String dc_id) {
		this.dc_id = dc_id;
	}

	public int getDc_value() {
		return dc_value;
	}

	public void setDc_value(int dc_value) {
		this.dc_value = dc_value;
	}

	public String getDe_id() {
		return de_id;
	}

	public void setDe_id(String de_id) {
		this.de_id = de_id;
	}

	public int getDe_value() {
		return de_value;
	}

	public void setDe_value(int de_value) {
		this.de_value = de_value;
	}
	
	
}
