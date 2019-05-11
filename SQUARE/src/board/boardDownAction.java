package board;

import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;

public class boardDownAction extends ActionSupport implements SessionAware{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	Map sessionMap;
	
	private String line_num;
	private String currentPage;
	private String board_num;
	private boardVO paramClass;
	Calendar today = Calendar.getInstance(); 

	private boardUpDownVO downClass = new boardUpDownVO();
	private boardUpDownVO downResClass = new boardUpDownVO();
	
	
	//생성자
	public boardDownAction() throws IOException{
		 sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception{
		String currentID = (String) sessionMap.get("logonID");
		int board_num = Integer.parseInt(getBoard_num());
		downClass= new boardUpDownVO();
		
		downClass.setBoard_num(board_num); //글번호 넣어주기
		downClass.setDo_date(today.getTime()); //날짜 넣어주기
		downClass.setId(currentID); //아이디 넣어주기
		
		int num= (Integer)sqlMapper.queryForObject("selectDown",downClass);
		
		if(num == 0 ) {
			//추천 가능
			
			downClass.setDo_kind(1);
			sqlMapper.insert("boardUpInsert",downClass);
			
			
			
		}else{
			//추천 안된다.
			return ERROR;
			
			
		}
		
	    paramClass= (boardVO)sqlMapper.queryForObject("selectView",board_num);
		
		sqlMapper.update("updateBoardDown",paramClass);
		
	
		
		
		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		boardDownAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		boardDownAction.sqlMapper = sqlMapper;
	}

	public String getLine_num() {
		return line_num;
	}

	public void setLine_num(String line_num) {
		this.line_num = line_num;
	}

	public String getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	public String getBoard_num() {
		return board_num;
	}

	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}

	public boardVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(boardVO paramClass) {
		this.paramClass = paramClass;
	}

	public boardUpDownVO getDownClass() {
		return downClass;
	}

	public void setDownClass(boardUpDownVO downClass) {
		this.downClass = downClass;
	}

	public boardUpDownVO getDownResClass() {
		return downResClass;
	}

	public void setDownResClass(boardUpDownVO downResClass) {
		this.downResClass = downResClass;
	}

	@Override
	public void setSession(Map arg0) {
		// TODO Auto-generated method stub
		this.sessionMap = arg0;
	}
	
	
}
