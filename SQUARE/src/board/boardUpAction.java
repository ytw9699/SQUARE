package board;

import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;

public class boardUpAction extends ActionSupport implements SessionAware{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	Map sessionMap;
	
	private String line_num;
	private String currentPage;
	private String board_num;
	private boardVO paramClass;
	Calendar today = Calendar.getInstance(); 
	private boardUpDownVO upClass;
	private boardUpDownVO upResClass;
	//생성자
	public boardUpAction() throws IOException{
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception{
		//id오면 확인하는logic
		String currentID = (String) sessionMap.get("logonID");
		upClass = new boardUpDownVO();
		int board_num = Integer.parseInt(getBoard_num());
		
		upClass.setBoard_num(board_num); //글번호 넣어주기
		upClass.setDo_date(today.getTime()); //날짜 넣어주기
		upClass.setId(currentID); //아이디 넣어주기
		
		//up있는지 찾기  and id
		int num= (Integer)sqlMapper.queryForObject("selectUp",upClass);
	
		if(num == 0 ) {
			//추천 가능
			
			upClass.setDo_kind(0);
			sqlMapper.insert("boardUpInsert",upClass);
			
			
			
		}else{
			//추천 안된다.
			return ERROR;
			
			
		}
		
		paramClass = (boardVO)sqlMapper.queryForObject("selectView",board_num);
		
		sqlMapper.update("updateBoardUp",paramClass);

	
		return SUCCESS;
	}
	
	
	
	public boardVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(boardVO paramClass) {
		this.paramClass = paramClass;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		boardUpAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		boardUpAction.sqlMapper = sqlMapper;
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

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public boardUpDownVO getUpClass() {
		return upClass;
	}

	public void setUpClass(boardUpDownVO upClass) {
		this.upClass = upClass;
	}

	public boardUpDownVO getUpResClass() {
		return upResClass;
	}

	public void setUpResClass(boardUpDownVO upResClass) {
		this.upResClass = upResClass;
	}

	@Override
	public void setSession(Map arg0) {
		// TODO Auto-generated method stub
		this.sessionMap = arg0;
	}

	
}
