package board;

import java.util.Date;

public class commentVO {
	
	private int line_num;
	private int board_num;
	private int comment_num;
	private String comment_author;
	private Date comment_regdate;
	private String comment_content;
	private int comment_ref;
	private int comment_re_level;
	private int comment_up;
	private int comment_down;
	private int comment_status;
	
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
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	
	public String getComment_author() {
		return comment_author;
	}
	public void setComment_author(String comment_author) {
		this.comment_author = comment_author;
	}
	public Date getComment_regdate() {
		return comment_regdate;
	}
	public void setComment_regdate(Date comment_regdate) {
		this.comment_regdate = comment_regdate;
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
	public int getComment_up() {
		return comment_up;
	}
	public void setComment_up(int comment_up) {
		this.comment_up = comment_up;
	}
	public int getComment_down() {
		return comment_down;
	}
	public void setComment_down(int comment_down) {
		this.comment_down = comment_down;
	}
	public int getComment_status() {
		return comment_status;
	}
	public void setComment_status(int comment_status) {
		this.comment_status = comment_status;
	}
	
	
}
