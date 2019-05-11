package admin;

import com.opensymphony.xwork2.ActionSupport;

import com.ibatis.sqlmap.client.SqlMapClient;

import java.io.IOException;
import config.SqlMapper;

public class memberBlind extends ActionSupport {
	public static SqlMapClient sqlMapper;
	 
	private String board_num;
	private String blindOption;
	private String line_num;
	private String board_author;
	private int currentPage;

	public memberBlind() throws IOException {
		
		sqlMapper = SqlMapper.getMapper();
	}
	public String execute() throws Exception {
		
		int getboard_num = Integer.parseInt(getBoard_num());
		
		if(getBlindOption().equals("1")){
			sqlMapper.update("blindBack", getboard_num);//블라인드 복구
		}else if (getBlindOption().equals("2")) {
			sqlMapper.update("blinding", getboard_num);//블라인드 걸기
		}
		return SUCCESS;
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
	public String getLine_num() {
		return line_num;
	}
	public void setLine_num(String line_num) {
		this.line_num = line_num;
	}
	public String getBlindOption() {
		return blindOption;
	}
	public void setBlindOption(String blindOption) {
		this.blindOption = blindOption;
	}
	public String getBoard_num() {
		return board_num;
	}
	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}
}
