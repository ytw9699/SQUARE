package board;
import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;
import config.SqlMapper;


public class writeAction extends ActionSupport implements SessionAware {
	
	Map sessionMap;
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private boardVO paramClass; //parameter boardVO
	private boardVO resultClass; //최종 결과 boardVO
	private lineVO lineClass; //lineInfo Class
	
	private int line_num; //
	private String currentPage;
	
	private String board_num; //게시판번호
	private String board_subject; //게시판 제목
	private String board_author; //게시판 작성자
	private String board_content; //내용
	private Date board_regdate;  //등록날짜
	private int board_up; //추천수
	private int board_down; //비추수
	private int board_dot; //기부수
	private int board_singo; //신고 수
	private int board_readcount; //조회수
	private int board_status; //0 글 첫 작성 시기기 때문에  상태가 0이다.
	private String board_upload; //실제 board_upload 컬럼에 들어갈..
	Calendar today = Calendar.getInstance(); 
	
	
	
	//서버에 저장할 업로드 파일의 이름,사용자 이름과 함께 고유번호 구분
	private File upload; // 사용자가 올린 파일 객체
	private String uploadContentType; //컨텐트 타입
	private String fileupload_path = getClass().getResource("/").getPath().substring(0, (getClass().getResource("/").getPath()).indexOf(".metadata"))
			+"/SQUARE/WebContent/static/img/file_upload/";
	private String uploadFileName; 
	
	public writeAction() throws IOException {
		sqlMapper = SqlMapper.getMapper();
	}
	
	
   
	public String execute() throws Exception{
	   
		
		String currentID = (String) sessionMap.get("logonID");
	   paramClass = new boardVO();
	   resultClass= new boardVO(); 
	     //가지고 온 line_num은 이미 int형...
	
	   paramClass.setLine_num(getLine_num());
	   paramClass.setBoard_subject(getBoard_subject()); //제목
	   paramClass.setBoard_author(currentID);
	   paramClass.setBoard_content(getBoard_content()); //내용 
	   paramClass.setBoard_dot(0);//dot수
	   paramClass.setBoard_up(0); //추천
	   paramClass.setBoard_down(0);//비추수
	   paramClass.setBoard_readcount(0);//조회수 
	   paramClass.setBoard_regdate(today.getTime());
	   paramClass.setBoard_singo(0);//신고수
	   paramClass.setBoard_status(1); //계정상태
	   
	   sqlMapper.insert("insertBoard", paramClass);
	   
	   //파일 첨부가 되어있다면
	   if(getUpload() != null) {
		   
		  
		   //등록한 글 번호 가져오기
		   resultClass = (boardVO)sqlMapper.queryForObject("lastboardNum"); //가장 큰 글번호
		   //저장될 이름 
		   String file_name = "file_board" + resultClass.getBoard_num();
		
		   //원래 파일 확장자 빼오기
		   String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf(".")+1,getUploadFileName().length());
		   
		   File destFile = new File(fileupload_path + file_name +"." + file_ext);
	       FileUtils.copyFile(getUpload(),destFile);
	
	       paramClass.setBoard_num(resultClass.getBoard_num());
	       paramClass.setBoard_upload(file_name+"."+file_ext); 
		    
	       //파일 정보 업데이트
	       sqlMapper.update("updateFile2",paramClass);	   
		   
	   }
		return SUCCESS;
	}
	
	@Override
	public void setSession(Map arg0) {
		
		this.sessionMap = arg0;
		
	}

  
	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	

	public boardVO getParamClass() {
		return paramClass;
	}



	public void setParamClass(boardVO paramClass) {
		this.paramClass = paramClass;
	}

	public boardVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(boardVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getLine_num() {
		return line_num;
	}

	public void setLine_num(int line_num) {
		this.line_num = line_num;
	}

	public String getBoard_upload() {
		return board_upload;
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


	public String getFileupload_path() {
		return fileupload_path;
	}



	public void setFileupload_path(String fileupload_path) {
		this.fileupload_path = fileupload_path;
	}



	public lineVO getLineClass() {
		return lineClass;
	}



	public void setLineClass(lineVO lineClass) {
		this.lineClass = lineClass;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setBoard_upload(String board_upload) {
		this.board_upload = board_upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}



	public String getCurrentPage() {
		return currentPage;
	}



	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}



	public String getBoard_num() {
		return board_num;
	}



	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}



	


	
	
}
