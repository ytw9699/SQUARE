package board;

import java.util.Date;

public class boardUpDownVO {
	   private String id;
	   private int board_num;
	   private Date do_date;
	   private int do_kind;
	   
	   
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public Date getDo_date() {
		return do_date;
	}
	public void setDo_date(Date do_date) {
		this.do_date = do_date;
	}
	public int getDo_kind() {
		return do_kind;
	}
	public void setDo_kind(int do_kind) {
		this.do_kind = do_kind;
	}


}
