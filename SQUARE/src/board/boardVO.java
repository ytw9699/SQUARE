package board;

import java.util.Date;

public class boardVO {
	
	private int line_num;
	private int board_num;
	private String board_subject;
	private String board_author;
	private String board_content;
	private Date board_regdate;
	private String board_upload; //���� ���� �̸�
	
	
	private int board_up; //��õ ����
	private int board_down; //���� ����
	private int board_dot; //�� �Խù��� dot ����
	private int board_singo; //�Խù� �� �Ű� ����
	private int board_readcount; //�Խù� �� ��ȸ��
	private int board_status; // 0:���� / 1:����� ����
	
	
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
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_author() {
		return board_author;
	}
	public void setBoard_author(String board_author) {
		this.board_author = board_author;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_regdate() {
		return board_regdate;
	}
	public void setBoard_regdate(Date board_regdate) {
		this.board_regdate = board_regdate;
	}
	public String getBoard_upload() {
		return board_upload;
	}
	public void setBoard_upload(String board_upload) {
		this.board_upload = board_upload;
	}
	public int getBoard_up() {
		return board_up;
	}
	public void setBoard_up(int board_up) {
		this.board_up = board_up;
	}
	public int getBoard_down() {
		return board_down;
	}
	public void setBoard_down(int board_down) {
		this.board_down = board_down;
	}
	public int getBoard_dot() {
		return board_dot;
	}
	public void setBoard_dot(int board_dot) {
		this.board_dot = board_dot;
	}
	public int getBoard_singo() {
		return board_singo;
	}
	public void setBoard_singo(int board_singo) {
		this.board_singo = board_singo;
	}
	public int getBoard_readcount() {
		return board_readcount;
	}
	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}
	public int getBoard_status() {
		return board_status;
	}
	public void setBoard_status(int board_status) {
		this.board_status = board_status;
	}

	
}
