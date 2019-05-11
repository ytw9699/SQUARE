package board;



import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;

public class like_boardAction extends ActionSupport implements SessionAware{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	Map sessionMap;
	

	
	private int line_num;
	private int board_num;
	private int currentPage;
	private int checkNumber;
	
	private like_boardVO likeClass = new like_boardVO();
	
	public like_boardAction() throws IOException{
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception{
	 	
		
	  String currentID = (String)sessionMap.get("logonID");	

	  likeClass.setLike_id(currentID);
	  likeClass.setOrg_board_num(getBoard_num());
	  likeClass.setLike_num(0);
	   int a =(Integer)sqlMapper.queryForObject("selectLike", likeClass);
	   //a=1 ¡Ò√£ a=0 ¡Ò√£ æ»«‘
	   if(a == 0 ) {
		   sqlMapper.insert("insertLike",likeClass);
		   setCheckNumber(1);
		  
	   }else {
		   sqlMapper.delete("deleteLike",likeClass);
		   setCheckNumber(0);
		   return ERROR;
	   }
	  
	   return SUCCESS;
	}
	

	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		like_boardAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		like_boardAction.sqlMapper = sqlMapper;
	}

	public Map getSessionMap() {
		return sessionMap;
	}

	public void setSessionMap(Map sessionMap) {
		this.sessionMap = sessionMap;
	}

	public int getLine_num() {
		return line_num;
	}

	public void setLine_num(int line_num) {
		this.line_num = line_num;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getCheckNumber() {
		return checkNumber;
	}

	public void setCheckNumber(int checkNumber) {
		this.checkNumber = checkNumber;
	}

	public like_boardVO getLikeClass() {
		return likeClass;
	}

	public void setLikeClass(like_boardVO likeClass) {
		this.likeClass = likeClass;
	}

	@Override
	public void setSession(Map arg0) {
		// TODO Auto-generated method stub
		this.sessionMap = arg0;
	}
	
}
