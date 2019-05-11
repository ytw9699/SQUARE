package board;

import java.util.Date;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;

public class commentUpDownAction extends ActionSupport {

	private SqlMapClient sqlMapper;
	
	private String comment_num;
	private String id;
	private String line_num;
	private String board_num;
	private String currentPage;
	
	private int redirect_line_num;
	private int redirect_board_num;
	private int redirect_currentPage;
	//http://localhost:8080/SQUARE/commentUp.action
	//?comment_num=65&id=%BC%BC%BC%C7%B0%AA&line_num=201&board_num=601&currentPage=1
	public commentUpDownAction() {
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String up() throws Exception{
		
		redirect_line_num = Integer.parseInt(getLine_num());
		redirect_board_num = Integer.parseInt(getBoard_num());
		redirect_currentPage = Integer.parseInt(getCurrentPage());
		
		commentUpDownDTO dto = new commentUpDownDTO();
		dto.setId(getId());
		dto.setComment_num(Integer.parseInt(getComment_num()));
		dto.setDo_kind(0);
		
		//System.out.println(dto.getComment_num());
		int checkNum = (int) sqlMapper.queryForObject("selectCommentUpCheck", dto);
		if(checkNum > 0)
			return ERROR;
		
		sqlMapper.update("updateCommentUp", Integer.parseInt(getComment_num()));
		sqlMapper.insert("insertUPLog", dto);
		
		
		return SUCCESS;
	}
	
	public String down() throws Exception{
		
		redirect_line_num = Integer.parseInt(getLine_num());
		redirect_board_num = Integer.parseInt(getBoard_num());
		redirect_currentPage = Integer.parseInt(getCurrentPage());
		
		commentUpDownDTO dto = new commentUpDownDTO();
		dto.setId(getId());
		dto.setComment_num(Integer.parseInt(getComment_num()));
		dto.setDo_kind(1);
		
		int checkNum = (int) sqlMapper.queryForObject("selectCommentUpCheck", dto);
		if(checkNum > 0)
			return ERROR;
		
		sqlMapper.update("updateCommentDown", Integer.parseInt(getComment_num()));
		sqlMapper.insert("insertUPLog", dto);
		
		return SUCCESS;
	}

	public SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public void setSqlMapper(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

	public String getComment_num() {
		return comment_num;
	}

	public void setComment_num(String comment_num) {
		this.comment_num = comment_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLine_num() {
		return line_num;
	}

	public void setLine_num(String line_num) {
		this.line_num = line_num;
	}

	public String getBoard_num() {
		return board_num;
	}

	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}

	public String getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	public int getRedirect_line_num() {
		return redirect_line_num;
	}

	public void setRedirect_line_num(int redirect_line_num) {
		this.redirect_line_num = redirect_line_num;
	}

	public int getRedirect_board_num() {
		return redirect_board_num;
	}

	public void setRedirect_board_num(int redirect_board_num) {
		this.redirect_board_num = redirect_board_num;
	}

	public int getRedirect_currentPage() {
		return redirect_currentPage;
	}

	public void setRedirect_currentPage(int redirect_currentPage) {
		this.redirect_currentPage = redirect_currentPage;
	}
	
	
	
}
