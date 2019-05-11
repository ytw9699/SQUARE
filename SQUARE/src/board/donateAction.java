package board;

import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;

public class donateAction extends ActionSupport implements SessionAware{
	
	Map sessionMap;
	
	public static Reader reader;
	public static SqlMapClient sqlmapper;
	
	private int line_num;
	private int currentPage;
	private int board_num;
	
	private String board_author;
	private memberVO memberClass = new memberVO();
	private boardVO boardClass = new boardVO();
	private dot_historyVO dothClass = new dot_historyVO();
	private memberVO minusMember = new memberVO();
	private int donateQuantity;
	
	Calendar today = Calendar.getInstance();
	
	
	
	public donateAction() throws IOException{
	  
		sqlmapper = SqlMapper.getMapper();	
	}
	
	public String execute() throws Exception{
		
		//세션id가 가지고 있는 닷 총량 확인 하는 logic 
		String currentID = (String) sessionMap.get("logonID");
		int myDot = (int) sqlmapper.queryForObject("selectMyDotForDonation", currentID);
		
		if(getDonateQuantity() > myDot)
			return ERROR;
		
		//board자체에 넣는거고.
		boardClass = (boardVO)sqlmapper.queryForObject("selectView",getBoard_num());
		boardClass.setBoard_dot(getDonateQuantity());
	
		sqlmapper.update("updateDotBoard",boardClass);
		//게시물을 쓴 사람한테의 총닷 _++
		memberClass.setId(getBoard_author());
		memberClass.setDot_sum(getDonateQuantity());
		
		sqlmapper.update("updateMemberDot",memberClass);
		
		minusMember.setId(currentID);
		minusMember.setDot_sum(getDonateQuantity());
		
	
		sqlmapper.update("minusMemberDot",minusMember);
		
		//거래내역 ++
		dothClass.setDh_donation(getDonateQuantity());
		dothClass.setDh_from(currentID);
		dothClass.setDh_to(getBoard_author());
		dothClass.setBoard_num(getBoard_num());
		dothClass.setDh_date(today.getTime());
	
		sqlmapper.insert("insertDot",dothClass);
		
		
		
		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		donateAction.reader = reader;
	}

	public static SqlMapClient getSqlmapper() {
		return sqlmapper;
	}

	public static void setSqlmapper(SqlMapClient sqlmapper) {
		donateAction.sqlmapper = sqlmapper;
	}

	public int getLine_num() {
		return line_num;
	}

	public void setLine_num(int line_num) {
		this.line_num = line_num;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public memberVO getMemberClass() {
		return memberClass;
	}

	public void setMemberClass(memberVO memberClass) {
		this.memberClass = memberClass;
	}

	public boardVO getBoardClass() {
		return boardClass;
	}

	public void setBoardClass(boardVO boardClass) {
		this.boardClass = boardClass;
	}

	public dot_historyVO getDothClass() {
		return dothClass;
	}

	public void setDothClass(dot_historyVO dothClass) {
		this.dothClass = dothClass;
	}

	public int getDonateQuantity() {
		return donateQuantity;
	}

	public void setDonateQuantity(int donateQuantity) {
		this.donateQuantity = donateQuantity;
	}

	public String getBoard_author() {
		return board_author;
	}

	public void setBoard_author(String board_author) {
		this.board_author = board_author;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	@Override
	public void setSession(Map arg0) {
		// TODO Auto-generated method stub
		this.sessionMap = arg0;
	}
	
	
}
