package admin;

import com.opensymphony.xwork2.ActionSupport;

import com.ibatis.sqlmap.client.SqlMapClient;

import java.io.Reader;
import java.net.URLEncoder;
import java.io.IOException;
import config.SqlMapper;

public class memberStatus extends ActionSupport {
	public static SqlMapClient sqlMapper;

	private memberVO paramClass; //파라미터를 저장할 객체

	private int currentPage;//현재 페이지
	private String id;
	private String status;
	private String encodedID;
	
	public memberStatus() throws IOException {
		sqlMapper = SqlMapper.getMapper();
	}
	public String execute() throws Exception {
		
		encodedID = URLEncoder.encode(getId(),"euc-kr");//내부에서 실행되기 위해 id를 인코딩
		
		paramClass = new memberVO();
		paramClass.setId(getId());
		paramClass.setStatus(getStatus());// 기본값 0 설정
		if(status.equals("0")){
			sqlMapper.update("restoringMember", paramClass);
		}else if (status.equals("1")) {
			sqlMapper.update("limitingBoard", paramClass);	
		}else if (status.equals("2")) {
			sqlMapper.update("limitingLogin", paramClass);	
		}
		return SUCCESS;
	}	
	
	public String getEncodedID() {
		return encodedID;
	}
	public void setEncodedID(String encodedID) {
		this.encodedID = encodedID;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public memberVO getParamClass() {
		return paramClass;
	}
	public void setParamClass(memberVO paramClass) {
		this.paramClass = paramClass;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
}
