package mypage;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;
import main.memberVO;

public class mypageAction extends ActionSupport implements SessionAware, RequestAware, ServletRequestAware{

	SqlMapClient sqlMapper;
	Map sessionMap;
	Map requestMap;
	HttpServletRequest request;
	HttpServletResponse response;
	Date date = new Date();
	//내정보
	memberVO myInfomation = new memberVO();
	//내게시물정보
	private int myBoardSum;
	//내가댓글쓴게시물정보
	private int myCommentSum;
	//내가담아둔게시물정보
	private int myLikeSum;
	
	public static final int SEC = 60;
	public static final int MIN = 60;
	public static final int HOUR = 24;
	public static final int DAY = 30;
	public static final int MONTH = 12;
	
	String msg = null;

	
	private String currentID;
	
	public mypageAction() {
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String mainForm() throws Exception{
		
		if(sessionMap.get("logonID") == null)
			return LOGIN;
		
		currentID = (String) sessionMap.get("logonID");
		myInfomation = (memberVO) sqlMapper.queryForObject("memberOne",currentID);
		
		/*long curTime = System.currentTimeMillis();
		long regTime = myInfomation.getReg_date().getTime();
		long diffTime = (curTime - regTime) / 1000;
		if (diffTime < SEC) {

			// sec
			msg = "방금 전";
		} else if ((diffTime /= SEC) < MIN) {
			// min
			msg = diffTime + "분 전";
		} else if ((diffTime /= MIN) < HOUR) {
			// hour
			msg = (diffTime) + "시간 전";
		} else if ((diffTime /= HOUR) < DAY) {
			// day
			msg = (diffTime) + "일 전";
		} else if ((diffTime /= DAY) < MONTH) {
			// day
			msg = (diffTime) + "달 전";
		} else {
			msg = (diffTime) + "년 전";
		}
		System.out.println(msg);*/
		myBoardSum = (int) sqlMapper.queryForObject("myBoardSum", currentID);
		myCommentSum = (int) sqlMapper.queryForObject("myCommentSum", currentID);
		myLikeSum = (int) sqlMapper.queryForObject("myLikeSum", currentID);
		
		return SUCCESS;
	}
	
	public void setSession(Map session) {
		this.sessionMap = session;
	}	
				
	public void setRequest(Map requestMap) {
		this.requestMap = requestMap;
	}	
				
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String getCurrentID() {
		return currentID;
	}

	public void setCurrentID(String currentID) {
		this.currentID = currentID;
	}

	public memberVO getMyInfomation() {
		return myInfomation;
	}

	public void setMyInfomation(memberVO myInfomation) {
		this.myInfomation = myInfomation;
	}

	

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getMyBoardSum() {
		return myBoardSum;
	}

	public void setMyBoardSum(int myBoardSum) {
		this.myBoardSum = myBoardSum;
	}

	public int getMyCommentSum() {
		return myCommentSum;
	}

	public void setMyCommentSum(int myCommentSum) {
		this.myCommentSum = myCommentSum;
	}

	public int getMyLikeSum() {
		return myLikeSum;
	}

	public void setMyLikeSum(int myLikeSum) {
		this.myLikeSum = myLikeSum;
	}
	
	
	
}
