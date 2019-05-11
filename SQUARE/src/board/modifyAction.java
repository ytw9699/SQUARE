package board;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.io.FileUtils;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;

public class modifyAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private boardVO paramClass;
	private boardVO beforeupdateClass;
	private lineVO lineClass;
	private int board_num;
	private int line_num;
	private int currentPage;
	

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
	
	
	private File lastupload; //�̸�����Ǿ��ִ� ����..
	private File upload; // ����ڰ� �ø� ���� ��ü
	private String uploadContentType; //����Ʈ Ÿ��
	private String fileupload_path = getClass().getResource("/").getPath().substring(0, (getClass().getResource("/").getPath()).indexOf(".metadata"))
			+"/SQUARE/WebContent/static/img/file_upload/";
	private String uploadFileName; 
	
	public modifyAction() throws IOException{
		
		sqlMapper = SqlMapper.getMapper();
		
	}
	
	public String execute() throws Exception{
		 /* ���̵� ���� �´��� Ȯ���ϰ�*/
		
		paramClass = new boardVO();  
		beforeupdateClass = new boardVO();
		lineClass =new lineVO();
		lineClass = (lineVO)sqlMapper.queryForObject("lineInfo",line_num);
		beforeupdateClass =(boardVO)sqlMapper.queryForObject("selectView",getBoard_num());
		String dfile_name = beforeupdateClass.getBoard_upload(); //������ ���ε� �Ǿ��ִ� file��
		
		
		paramClass.setLine_num(getLine_num()); //�״��
		paramClass.setBoard_num(getBoard_num()); //�״��
		paramClass.setBoard_subject(getBoard_subject()); //�ٲ�
		paramClass.setBoard_author(getBoard_author()); //�״��
		paramClass.setBoard_content(getBoard_content()); //�ٲ�
	    paramClass.setBoard_dot(getBoard_dot());//dot�� �״��
		paramClass.setBoard_up(getBoard_up()); //�״��
		paramClass.setBoard_down(getBoard_down()); //�״�� 
		paramClass.setBoard_regdate(today.getTime()); //������¥�� �ٲ��.
		paramClass.setBoard_readcount(getBoard_readcount());//��ȸ��  �״��
		paramClass.setBoard_singo(getBoard_singo()); //�״��
		paramClass.setBoard_status(getBoard_status()); //�״��
       
		sqlMapper.update("updateBoard",paramClass);
		
		if(getUploadFileName() != null) {
			
			  
			  
			  lastupload = new File(fileupload_path + dfile_name );
			  lastupload.delete(); //���� ���� ��ü �����
			   
			  
			  //���� ����
			  String mfile_name = "file_board" + paramClass.getBoard_num(); 
			  String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf(".")+1,getUploadFileName().length()); 
			 
			  File destFile = new File(fileupload_path + mfile_name + "." + file_ext);
			  FileUtils.copyFile(getUpload(),destFile);
			
			  paramClass.setBoard_upload(mfile_name+"."+file_ext); 
			    
		       //���� ���� ������Ʈ
		      sqlMapper.update("updateFile2",paramClass);
			
		 }
		  
		
		
		
		
		return SUCCESS;
	}

	public boardVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(boardVO paramClass) {
		this.paramClass = paramClass;
	}

	

	public boardVO getBeforeupdateClass() {
		return beforeupdateClass;
	}

	public void setBeforeupdateClass(boardVO beforeupdateClass) {
		this.beforeupdateClass = beforeupdateClass;
	}

	public File getLastupload() {
		return lastupload;
	}

	public void setLastupload(File lastupload) {
		this.lastupload = lastupload;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public int getLine_num() {
		return line_num;
	}

	public void setLine_num(int line_num) {
		this.line_num = line_num;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		modifyAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		modifyAction.sqlMapper = sqlMapper;
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

	public String getBoard_upload() {
		return board_upload;
	}

	public void setBoard_upload(String board_upload) {
		this.board_upload = board_upload;
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

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getFileupload_path() {
		return fileupload_path;
	}

	public void setFileupload_path(String fileupload_path) {
		this.fileupload_path = fileupload_path;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public lineVO getLineClass() {
		return lineClass;
	}

	public void setLineClass(lineVO lineClass) {
		this.lineClass = lineClass;
	}


}
