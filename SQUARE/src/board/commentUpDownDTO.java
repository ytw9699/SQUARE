package board;

import java.util.Date;

public class commentUpDownDTO {

	private String id;
	private int comment_num;
	private Date do_date;
	private int do_kind;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
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
