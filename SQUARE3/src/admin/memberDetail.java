package admin;

import com.opensymphony.xwork2.ActionSupport;

import com.ibatis.sqlmap.client.SqlMapClient;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import config.SqlMapper;

public class memberDetail extends ActionSupport {
	public static SqlMapClient sqlMapper;

	private memberVO resultClass = new memberVO(); 
	private modMemberVO resultClass2 = new modMemberVO(); 
	 
	private int currentPage;
	private String id;
	private String encodedID;//내부에서 실행되기 위해 id를 인코딩
	private String decodedID;
	
	public memberDetail() throws IOException {
		sqlMapper = SqlMapper.getMapper();
	}
	
public String execute() throws Exception {
	
	encodedID = URLEncoder.encode(getId(),"euc-kr");//내부에서 실행되기 위해 id를 인코딩
	decodedID = URLDecoder.decode(getId(),"euc-kr");
resultClass = (memberVO) sqlMapper.queryForObject("selectMemberOne", getId());

resultClass2 = (modMemberVO) sqlMapper.queryForObject("selectEx", getId());

System.out.println(getId());
	return SUCCESS;
}

	public modMemberVO getResultClass2() {
	return resultClass2;
	}

	public void setResultClass2(modMemberVO resultClass2) {
	this.resultClass2 = resultClass2;
	}

	public memberVO getResultClass() {
		return resultClass;
	}
	public void setResultClass(memberVO resultClass) {
		this.resultClass = resultClass;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	//나중에 삭제필요
	public String getEncodedID() {
		return encodedID;
	}
	public void setEncodedID(String encodedID) {
		this.encodedID = encodedID;
	}
}
