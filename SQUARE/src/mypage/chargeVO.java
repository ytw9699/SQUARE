package mypage;

import java.util.Date;

public class chargeVO {
	
	private int dc_num;
	private String dc_id;
	private int dc_value;
	private int dc_status;
	private Date dv_date;
	public int getDc_num() {
		return dc_num;
	}
	public void setDc_num(int dc_num) {
		this.dc_num = dc_num;
	}
	public String getDc_id() {
		return dc_id;
	}
	public void setDc_id(String dc_id) {
		this.dc_id = dc_id;
	}
	public int getDc_value() {
		return dc_value;
	}
	public void setDc_value(int dc_value) {
		this.dc_value = dc_value;
	}
	public int getDc_status() {
		return dc_status;
	}
	public void setDc_status(int dc_status) {
		this.dc_status = dc_status;
	}
	public Date getDv_date() {
		return dv_date;
	}
	public void setDv_date(Date dv_date) {
		this.dv_date = dv_date;
	}
	
	

}
