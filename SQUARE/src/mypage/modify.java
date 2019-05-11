package mypage;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;
import main.memberVO;

public class modify extends ActionSupport implements SessionAware, RequestAware, ServletRequestAware {

	
	SqlMapClient sqlMapper;
	Map sessionMap;
	Map requestMap;
	HttpServletRequest request;
	HttpServletResponse response;
	String currentID;
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String realPath = getClass().getResource("/").getPath().substring(0, (getClass().getResource("/").getPath()).indexOf(".metadata"))+"/SQUARE/WebContent/static/img/profile_img/";
	private File realFile;
	
	private String id;
	private String email;
	private String name;
	private String phone_num;
	private String zipcode;
	private String address;
	private String account;
	private memberVO member = new memberVO();
	
	public modify() {
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String profile() throws Exception{
		
		memberVO profileMod = new memberVO();
		
		currentID = (String) sessionMap.get("logonID");
		String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
		System.out.println(file_ext);
		System.out.println(file_ext.equals("jpg"));
		
		
		if(file_ext.equals("jpg") || file_ext.equals("png") || file_ext.equals("jpeg") || file_ext.equals("gif") || file_ext.equals("JPG") || file_ext.equals("GIF") || file_ext.equals("PNG") || file_ext.equals("JPEG")) {
			realFile = new File(realPath+currentID+"."+file_ext);
			FileUtils.copyFile(getUpload(), realFile);
			
			profileMod.setProfile_img(currentID+"."+file_ext);
			profileMod.setId(currentID);
			
			sqlMapper.update("updateMyProfile", profileMod);
			
			return SUCCESS;
		}else {
			return ERROR;
		}
	}
	
	public String execute() throws Exception{
		
		member.setId(getId());
		member.setEmail(getEmail());
		member.setName(getName());
		member.setPhone_num(getPhone_num());
		member.setZipcode(getZipcode());
		member.setAddress(getAddress());
		member.setAccount(getAccount());
		
		sqlMapper.update("updateMyInfo",member);

		return SUCCESS;
	}
	
	public String profileDefault() throws Exception{
		currentID = (String) sessionMap.get("logonID");
		sqlMapper.update("updateMyProfileDefault",currentID);
		
		return SUCCESS;
	}
	//SessionAware의 setSession 구현
			public void setSession(Map session) {
				this.sessionMap = session;
			}	
				//RequestAware의 setRequest 구현
			public void setRequest(Map requestMap) {
				this.requestMap = requestMap;
			}	
				//ServletRequestAware의 serServletRequest 구현
			public void setServletRequest(HttpServletRequest request) {
				this.request = request;
			}

	public SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public void setSqlMapper(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone_num() {
		return phone_num;
	}

	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public memberVO getMember() {
		return member;
	}

	public void setMember(memberVO member) {
		this.member = member;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getRealPath() {
		return realPath;
	}

	public void setRealPath(String realPath) {
		this.realPath = realPath;
	}

	public File getRealFile() {
		return realFile;
	}

	public void setRealFile(File realFile) {
		this.realFile = realFile;
	}

	public String getCurrentID() {
		return currentID;
	}

	public void setCurrentID(String currentID) {
		this.currentID = currentID;
	}
	
	


	
	
	
}
