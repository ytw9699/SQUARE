package board;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;

public class commentDeleteAction extends ActionSupport {

	private String comment_num;
	private String line_num;
	private String board_num;
	private String currentPage;
	
	private int redirect_line_num;
	private int redirect_board_num;
	private int redirect_currentPage;
	private int redirect_comment_num;
	
	SqlMapClient sqlMapper;
	
	public commentDeleteAction() {
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception{
		redirect_line_num = Integer.parseInt(getLine_num());
		redirect_board_num = Integer.parseInt(getBoard_num());
		redirect_currentPage = Integer.parseInt(getCurrentPage());
		redirect_comment_num = Integer.parseInt(getComment_num());
		
		sqlMapper.update("updateCommentStatus",getRedirect_comment_num());

		return SUCCESS;
	}

	public String getComment_num() {
		return comment_num;
	}

	public void setComment_num(String comment_num) {
		this.comment_num = comment_num;
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

	public int getRedirect_comment_num() {
		return redirect_comment_num;
	}

	public void setRedirect_comment_num(int redirect_comment_num) {
		this.redirect_comment_num = redirect_comment_num;
	}
	
	
	
	
}
