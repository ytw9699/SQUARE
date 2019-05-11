package mypage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;

public class myPayHistory extends ActionSupport implements SessionAware {

	SqlMapClient sqlMapper;
	String currentID;
	Map sessionMap;
	private String od; //ch 충전내역 ex 환전내역
	private List<chargeHistoryVO> chargeHistoryList = new ArrayList<chargeHistoryVO>();
	private List<exchangeHistoryVO> exchangeHistoryList = new ArrayList<exchangeHistoryVO>();
	
	public myPayHistory() {
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String myDotPayForm() throws Exception{
		
		currentID = (String) sessionMap.get("logonID");
		
		chargeHistoryVO charge = new chargeHistoryVO();
		exchangeHistoryVO exchange = new exchangeHistoryVO();
		
		//죽은빈
		charge.setDc_id(currentID);
		charge.setDc_status(1);
		exchange.setDe_id(currentID);
		exchange.setDe_status(1);
		chargeHistoryList = sqlMapper.queryForList("selectMyChargedList", currentID);
		exchangeHistoryList = sqlMapper.queryForList("selectMyExchangedList", currentID);

		return SUCCESS;
	}

	public String getOd() {
		return od;
	}

	public void setOd(String od) {
		this.od = od;
	}

	
	public SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public void setSqlMapper(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

	public String getCurrentID() {
		return currentID;
	}

	public void setCurrentID(String currentID) {
		this.currentID = currentID;
	}

	public Map getSessionMap() {
		return sessionMap;
	}

	public void setSessionMap(Map sessionMap) {
		this.sessionMap = sessionMap;
	}

	public List<chargeHistoryVO> getChargeHistoryList() {
		return chargeHistoryList;
	}

	public void setChargeHistoryList(List<chargeHistoryVO> chargeHistoryList) {
		this.chargeHistoryList = chargeHistoryList;
	}

	public List<exchangeHistoryVO> getExchangeHistoryList() {
		return exchangeHistoryList;
	}

	public void setExchangeHistoryList(List<exchangeHistoryVO> exchangeHistoryList) {
		this.exchangeHistoryList = exchangeHistoryList;
	}

	@Override
	public void setSession(Map arg0) {
		
		this.sessionMap = arg0;
		
	}
	
	
}
