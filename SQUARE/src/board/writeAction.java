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
	private boardVO resultClass; //���� ��� boardVO
	private lineVO lineClass; //lineInfo Class
	
	private int line_num; //
	private String currentPage;
	
	private String board_num; //�Խ��ǹ�ȣ
	private String board_subject; //�Խ��� ����
	private String board_author; //�Խ��� �ۼ���
	private String board_content; //����
	private Date board_regdate;  //��ϳ�¥
	private int board_up; //��õ��
	private int board_down; //���߼�
	private int board_dot; //��μ�
	private int board_singo; //�Ű� ��
	private int board_readcount; //��ȸ��
	private int board_status; //0 �� ù �ۼ� �ñ�� ������  ���°� 0�̴�.
	private String board_upload; //���� board_upload �÷��� ��..
	Calendar today = Calendar.getInstance(); 
	
	
	
	//������ ������ ���ε� ������ �̸�,����� �̸��� �Բ� ������ȣ ����
	private File upload; // ����ڰ� �ø� ���� ��ü
	private String uploadContentType; //����Ʈ Ÿ��
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
	     //������ �� line_num�� �̹� int��...
	
	   paramClass.setLine_num(getLine_num());
	   paramClass.setBoard_subject(getBoard_subject()); //����
	   paramClass.setBoard_author(currentID);
	   paramClass.setBoard_content(getBoard_content()); //���� 
	   paramClass.setBoard_dot(0);//dot��
	   paramClass.setBoard_up(0); //��õ
	   paramClass.setBoard_down(0);//���߼�
	   paramClass.setBoard_readcount(0);//��ȸ�� 
	   paramClass.setBoard_regdate(today.getTime());
	   paramClass.setBoard_singo(0);//�Ű��
	   paramClass.setBoard_status(1); //��������
	   
	   sqlMapper.insert("insertBoard", paramClass);
	   
	   //���� ÷�ΰ� �Ǿ��ִٸ�
	   if(getUpload() != null) {
		   
		  
		   //����� �� ��ȣ ��������
		   resultClass = (boardVO)sqlMapper.queryForObject("lastboardNum"); //���� ū �۹�ȣ
		   //����� �̸� 
		   String file_name = "file_board" + resultClass.getBoard_num();
		
		   //���� ���� Ȯ���� ������
		   String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf(".")+1,getUploadFileName().length());
		   
		   File destFile = new File(fileupload_path + file_name +"." + file_ext);
	       FileUtils.copyFile(getUpload(),destFile);
	
	       paramClass.setBoard_num(resultClass.getBoard_num());
	       paramClass.setBoard_upload(file_name+"."+file_ext); 
		    
	       //���� ���� ������Ʈ
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
