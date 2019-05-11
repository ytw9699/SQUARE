package admin;

import java.util.Date;

public class singoVO {
	private int singo_num;
	private int board_num;
	private String singo_reporter;
	private String singo_badman;
	private String singo_reason;
	private Date singo_regdate;
	
	public int getSingo_num() {
		return singo_num;
	}
	public void setSingo_num(int singo_num) {
		this.singo_num = singo_num;
	} 
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getSingo_reporter() {
		return singo_reporter;
	}
	public void setSingo_reporter(String singo_reporter) {
		this.singo_reporter = singo_reporter;
	}
	public String getSingo_badman() {
		return singo_badman;
	}
	public void setSingo_badman(String singo_badman) {
		this.singo_badman = singo_badman;
	}
	public String getSingo_reason() {
		return singo_reason;
	}
	public void setSingo_reason(String singo_reason) {
		this.singo_reason = singo_reason;
	}
	public Date getSingo_regdate() {
		return singo_regdate;
	}
	public void setSingo_regdate(Date singo_regdate) {
		this.singo_regdate = singo_regdate;
	}
	
	
}
