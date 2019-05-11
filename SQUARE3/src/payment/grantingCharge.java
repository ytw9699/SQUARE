package payment;

import com.opensymphony.xwork2.ActionSupport;

import com.ibatis.sqlmap.client.SqlMapClient;

import java.io.IOException;
import config.SqlMapper;

public class grantingCharge extends ActionSupport {
	public static SqlMapClient sqlMapper;

	private int currentPage;//현재 페이지
	private String dc_num;//글번호
	private String dc_status;//승인 or 취소
	private String dc_id;
	private String dc_value;
	private dot_chargeVO resultClass; //파라미터를 저장할 객체
	private String listOption;
	
	private String searchKeyword;
	private int searchNum;
	
		
	public grantingCharge() throws IOException {
		sqlMapper = SqlMapper.getMapper();
	}
	public String execute() throws Exception {
	
		int getdc_value = Integer.parseInt(getDc_value());
		int getdc_num = Integer.parseInt(getDc_num());
		int getdc_status = Integer.parseInt(getDc_status());
		
		resultClass = new dot_chargeVO();
		resultClass.setDc_id(getDc_id());
		resultClass.setDc_value(getdc_value);
	
		if(dc_status.equals("1")) {//승인요청
			sqlMapper.update("charging", getdc_num);	
			sqlMapper.update("chargingDate", getdc_num);	
			sqlMapper.update("memberDot_sum", resultClass);	
		}
		if(dc_status.equals("0")){//승인 취소
			sqlMapper.update("backCharging", getdc_num);
			sqlMapper.update("memberBackDot_sum", resultClass);
		}
		return SUCCESS;
	}	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getListOption() {
		return listOption;
	}
	public void setListOption(String listOption) {
		this.listOption = listOption;
	}
	public String getDc_num() {
		return dc_num;
	}
	public void setDc_num(String dc_num) {
		this.dc_num = dc_num;
	}
	public String getDc_id() {
		return dc_id;
	}
	public void setDc_id(String dc_id) {
		this.dc_id = dc_id;
	}
	public String getDc_value() {
		return dc_value;
	}
	public void setDc_value(String dc_value) {
		this.dc_value = dc_value;
	}

	public dot_chargeVO getResultClass() {
		return resultClass;
	}
	public void setResultClass(dot_chargeVO resultClass) {
		this.resultClass = resultClass;
	}
	public String getDc_status() {
		return dc_status;
	}
	public void setDc_status(String dc_status) {
		this.dc_status = dc_status;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
}
