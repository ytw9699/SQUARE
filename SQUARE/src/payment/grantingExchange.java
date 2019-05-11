package payment;

import com.opensymphony.xwork2.ActionSupport;

import com.ibatis.sqlmap.client.SqlMapClient;

import java.io.IOException;
import config.SqlMapper;

public class grantingExchange extends ActionSupport {
	public static SqlMapClient sqlMapper;
	
	private int currentPage;//현재 페이지
	private String de_num;//글번호
	private String de_status;//승인 or 취소
	private String de_id;
	private String de_value;
	private dot_exchangeVO resultClass; //파라미터를 저장할 객체
	private String listOption;
	
	private String searchKeyword;
	private int searchNum;
	
	public grantingExchange() throws IOException {
		sqlMapper = SqlMapper.getMapper();
	}
	public String execute() throws Exception {
	
		int getde_value = Integer.parseInt(getDe_value());
		int getde_num = Integer.parseInt(getDe_num());
		int getde_status = Integer.parseInt(getDe_status());
		
		resultClass = new dot_exchangeVO();
		resultClass.setDe_id(getDe_id());
		resultClass.setDe_value(getde_value);
	
		if(de_status.equals("1")) {//환전요청
			sqlMapper.update("exchanging", getde_num);	
			sqlMapper.update("exchangingDate", getde_num);	
			sqlMapper.update("memberDot_minus", resultClass);	
		}
		if(de_status.equals("0")){//환전 취소
			sqlMapper.update("backExchanging", getde_num);
			sqlMapper.update("memberBackDot_minus", resultClass);
		}
		return SUCCESS;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getSearchNum() {
		return searchNum;
	}
	public void setSearchNum(int searchNum) {
		this.searchNum = searchNum;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public String getDe_num() {
		return de_num;
	}
	public void setDe_num(String de_num) {
		this.de_num = de_num;
	}
	public String getDe_status() {
		return de_status;
	}
	public void setDe_status(String de_status) {
		this.de_status = de_status;
	}
	public String getDe_id() {
		return de_id;
	}
	public void setDe_id(String de_id) {
		this.de_id = de_id;
	}
	public String getDe_value() {
		return de_value;
	}
	public void setDe_value(String de_value) {
		this.de_value = de_value;
	}
	public dot_exchangeVO getResultClass() {
		return resultClass;
	}
	public void setResultClass(dot_exchangeVO resultClass) {
		this.resultClass = resultClass;
	}	
	public String getListOption() {
		return listOption;
	}
	public void setListOption(String listOption) {
		this.listOption = listOption;
	}
}
