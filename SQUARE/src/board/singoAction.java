package board;

import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;


public class singoAction extends ActionSupport implements SessionAware {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	Map sessionMap;
	
	private int board_num;
	private int line_num;
	private int currentPage;
	private String board_author; //badman
	private String singo_reason;
	private singoVO singoClass = new singoVO();
	private boardVO boardClass = new boardVO();
	Calendar today= Calendar.getInstance(); 
	
	public singoAction() throws IOException{
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception{
	
		String currentID = (String)sessionMap.get("logonID");
		singoClass.setSingo_num(1111);
		singoClass.setBoard_num(getBoard_num()); //보드번호 
	    singoClass.setSingo_badman(getBoard_author());//badman
	    singoClass.setSingo_reason(getSingo_reason());
	    singoClass.setSingo_regdate(today.getTime());
	    singoClass.setSingo_reporter(currentID);
		
		int count = (Integer)sqlMapper.queryForObject("singoCount",singoClass);
	
		if(count >= 1) {
			return ERROR;
		}
		
		sqlMapper.insert("insertSingo",singoClass);
		boardClass.setBoard_num(getBoard_num());
		
		sqlMapper.update("updateSingo",boardClass);
		
		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		singoAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		singoAction.sqlMapper = sqlMapper;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
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

	public String getBoard_author() {
		return board_author;
	}

	public void setBoard_author(String board_author) {
		this.board_author = board_author;
	}

	public String getSingo_reason() {
		return singo_reason;
	}

	public void setSingo_reason(String singo_reason) {
		this.singo_reason = singo_reason;
	}

	public singoVO getSingoClass() {
		return singoClass;
	}

	public void setSingoClass(singoVO singoClass) {
		this.singoClass = singoClass;
	}

	public boardVO getBoardClass() {
		return boardClass;
	}

	public void setBoardClass(boardVO boardClass) {
		this.boardClass = boardClass;
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
