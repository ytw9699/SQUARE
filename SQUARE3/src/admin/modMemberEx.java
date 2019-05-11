package admin;

import com.opensymphony.xwork2.ActionSupport;

import com.ibatis.sqlmap.client.SqlMapClient;

import java.io.Reader;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.io.IOException;
import config.SqlMapper;

public class modMemberEx extends ActionSupport {
	public static SqlMapClient sqlMapper;

	private modMemberVO paramClass; //파라미터를 저장할 객체
	private int currentPage;//현재 페이지
	private String id;
	private String ex;
	private String encodedID;
	private String decodedID;
	private String option="2";//기본값
	
	public modMemberEx() throws IOException {
		sqlMapper = SqlMapper.getMapper();
	}
	public String execute() throws Exception {
		modMemberVO paramClass = new modMemberVO();
		
		encodedID = URLEncoder.encode(getId(),"euc-kr");//내부에서 실행되기 위해 id를 인코딩
		decodedID = URLDecoder.decode(getId(),"euc-kr");
		paramClass.setId(decodedID);
		paramClass.setEx(getEx());
		if(getOption().equals("1")){//받아온게 1이라면 수정
		sqlMapper.update("modMemberEx",paramClass);//수정
		}else{//아니면 입력
		sqlMapper.insert("inMemberEx",paramClass);//입력
		}
		return SUCCESS;
	}
	public modMemberVO getParamClass() {
		return paramClass;
	}
	public void setParamClass(modMemberVO paramClass) {
		this.paramClass = paramClass;
	}
	public String getEncodedID() {
		return encodedID;
	}
	public void setEncodedID(String encodedID) {
		this.encodedID = encodedID;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEx() {
		return ex;
	}
	public void setEx(String ex) {
		this.ex = ex;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}	
	
}
