package board;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;

public class commentAction extends ActionSupport implements SessionAware {

	private int line_num;
	private int board_num;
	private int currentPage;
	private String currentID;
	private String comment_content;
	private int comment_ref;
	private int comment_re_level;
	
	Map sessionMap;
	SqlMapClient sqlMapper;
	
	public commentAction() {
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception{
		//System.out.println("넘어오는 ref 가 몇이냐면 ,"+getComment_ref());
		currentID = (String)sessionMap.get("logonID");
		
		//ref0 으로 넘어오면 원글
		if(getComment_ref() == 0) {
			commentVO paramClass = new commentVO();
			paramClass.setLine_num(getLine_num());
			paramClass.setBoard_num(getBoard_num());
			paramClass.setComment_author(currentID);
			paramClass.setComment_content(getComment_content());
			paramClass.setComment_ref(getComment_ref());
			paramClass.setComment_re_level(getComment_re_level());
			
			sqlMapper.insert("insertComment", paramClass);
		//ref0 으로 안넘어오면 답변글
		}
		
		if(getComment_ref() != 0) { 
			commentVO paramClass = new commentVO();
			paramClass.setLine_num(getLine_num());
			paramClass.setBoard_num(getBoard_num());
			paramClass.setComment_author(currentID);
			paramClass.setComment_content(getComment_content());
			paramClass.setComment_ref(getComment_ref());
			
			int reLevel = (int)sqlMapper.queryForObject("selectMaxCommentLevel", getComment_ref());
			paramClass.setComment_re_level(reLevel+1);
			
			sqlMapper.insert("insertRecomment", paramClass);
		}
		
		return SUCCESS;
	}
	@Override
	public void setSession(Map arg0) {
		
		this.sessionMap = arg0;
		
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

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public int getComment_ref() {
		return comment_ref;
	}

	public void setComment_ref(int comment_ref) {
		this.comment_ref = comment_ref;
	}

	public int getComment_re_level() {
		return comment_re_level;
	}

	public void setComment_re_level(int comment_re_level) {
		this.comment_re_level = comment_re_level;
	}

	
	
	
	
	
	
}
