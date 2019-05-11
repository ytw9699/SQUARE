package mypage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;

public class myDonateHistory extends ActionSupport implements SessionAware {

	SqlMapClient sqlMapper;
	
	String currentID;
	Map sessionMap;
	private List<donationVO> myGiveList = new ArrayList<donationVO>();
	private List<donationVO> myTakeList = new ArrayList<donationVO>();
	
	String od; // give 준내역 take 받은내역
	
	public myDonateHistory() {
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception{
		
		currentID = (String) sessionMap.get("logonID");
		myGiveList = sqlMapper.queryForList("selectMyGiveList", currentID);
		myTakeList = sqlMapper.queryForList("selectMyTakeList", currentID);
		
		return SUCCESS;
	}

	@Override
	public void setSession(Map arg0) {
		this.sessionMap = arg0;
		
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

	public String getOd() {
		return od;
	}

	public void setOd(String od) {
		this.od = od;
	}

	public List<donationVO> getMyGiveList() {
		return myGiveList;
	}

	public void setMyGiveList(List<donationVO> myGiveList) {
		this.myGiveList = myGiveList;
	}

	public List<donationVO> getMyTakeList() {
		return myTakeList;
	}

	public void setMyTakeList(List<donationVO> myTakeList) {
		this.myTakeList = myTakeList;
	}
	
	
	
	
	
	
}
