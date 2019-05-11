package admin;

import com.opensymphony.xwork2.ActionSupport;

import admin.pagingAction;
import admin.lineVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import config.SqlMapper;
import java.util.*;
import java.io.Reader;
import java.io.IOException;

import java.io.File;
import org.apache.commons.io.FileUtils;

import admin.pagingAction;

public class line extends ActionSupport {

	SqlMapClient sqlMapper;
	public static Reader reader; //�뙆�씪 �뒪�듃由쇱쓣 �쐞�븳 由щ뜑 
	
	private List<lineVO> list = new ArrayList<lineVO>();
	private String searchKeyword;
	private int searchNum;
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private pagingAction page;
	private int num = 0;
	
	private int line_num;
	private Calendar line_regdate;
	private String line_subject;
	private String line_img;
	
	
	Calendar today = Calendar.getInstance();
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath = getClass().getResource("/").getPath().substring(0, (getClass().getResource("/").getPath()).indexOf(".metadata"))+"/SQUARE/WebContent/static/img/line_img/";
	
	
	private lineVO paramClass; // �뙆�씪誘명꽣瑜� ���옣�븷 媛앹껜
	private lineVO resultClass; //荑쇰━ 寃곌낵 媛믪쓣 ���옣�븷 媛앹껜 
	
	public line() throws Exception {
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception{
		return SUCCESS;
	}
	
	public String list() throws Exception{
		if(getSearchKeyword() != null)
		{
			return search();
		}
		
		list = sqlMapper.queryForList("selectAll");
		totalCount = list.size(); // �쟾泥� 湲� 媛��닔瑜� 援ы븳�떎. 
		
		//pagingAction 媛앹껜 �깮�꽦. 
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, num, "");
		pagingHtml = page.getPagingHtml().toString(); // �럹�씠吏� HTML�깮�꽦. 
		// �쁽�옱 �럹�씠吏��뿉�꽌 蹂댁뿬以� 留덉�留� 湲��쓽 踰덊샇 �꽕�젙.
		int lastCount = totalCount;

		// �쁽�옱 �럹�씠吏��쓽 留덉�留� 湲��쓽 踰덊샇媛� �쟾泥댁쓽 留덉�留� 湲� 踰덊샇蹂대떎 �옉�쑝硫� 
		//lastCount瑜� +1 踰덊샇濡� �꽕�젙.
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		// �쟾泥� 由ъ뒪�듃�뿉�꽌 �쁽�옱 �럹�씠吏�留뚰겮�쓽 由ъ뒪�듃留� 媛��졇�삩�떎.
		list = list.subList(page.getStartCount(), lastCount);
		return SUCCESS;
	}
	
	
	
	public String form() throws Exception{
		return SUCCESS;
	}
	
	public String create() throws Exception{
		
		paramClass = new lineVO();
		resultClass = new lineVO();
		paramClass.setLine_subject(getLine_subject());
		paramClass.setLine_regdate(today.getTime());
		
		paramClass.setLine_img(upload.getName().substring(20)); // value too large for column "KH0905"."LINE"."LINE_IMG" (actual: 46, maximum: 30)
		sqlMapper.insert("insertLine",paramClass);
		
		if(getUpload() != null)
		{
			resultClass = (lineVO) sqlMapper.queryForObject("selectLastLine_num");
			
			String file_name = "file_" + resultClass.getLine_num();
			String file_ext = getUploadFileName().substring(
					getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length()
					);
			String total_name = file_name+"."+file_ext;
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			paramClass.setLine_num(resultClass.getLine_num());
			paramClass.setLine_img(total_name);
//			paramClass.setLine_img(getUploadFileName());
			
			
			sqlMapper.update("updateFile", paramClass);
			
		}
		
		
		
		return SUCCESS;
	}
	public String detail() throws Exception{
		paramClass = new lineVO();
		resultClass = new lineVO();
		paramClass.setLine_num(getLine_num());
		resultClass = (lineVO)sqlMapper.queryForObject("selectOne",getLine_num());
		
		return SUCCESS;
	}
	
	public String modForm() throws Exception{
		paramClass = new lineVO();
		resultClass = new lineVO();
		
		paramClass.setLine_num(getLine_num());
		resultClass = (lineVO)sqlMapper.queryForObject("selectOne",getLine_num());

		return SUCCESS;
	}
	
	public String modify() throws Exception{
		//�뙆�씪誘명꽣�� 由ъ��듃 媛앹껜 �깮�꽦. 
		paramClass = new lineVO();
		resultClass = new lineVO();
	
		//�닔�젙�븷 �빆紐� �꽕�젙.
		paramClass.setLine_num(getLine_num());
		paramClass.setLine_subject(getLine_subject());
		
		//�씪�떒 �빆紐⑸쭔 �닔�젙�븳�떎.
		sqlMapper.update("updateLine", paramClass);
		
		//�닔�젙�븷 �뙆�씪�씠 �뾽濡쒕뱶 �릺�뿀�떎硫� �뙆�씪�쓣 �뾽濡쒕뱶�븯怨� DB�쓽 file�빆紐⑹쓣 �닔�젙�븿. 
		if(getUpload() != null) {
		
			String file_name = "file_" + getLine_num();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
			
			File deleteFile = new File(fileUploadPath + getLine_img());
			deleteFile.delete();
			//�씠�쟾 �뙆�씪 �궘�젣 
			
			File destFile = new File(fileUploadPath + file_name + "." +file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			//�깉 �뙆�씪 �뾽濡쒕뱶 
			
			paramClass.setLine_img(file_name + "." +file_ext);
			
			//�뙆�씪 �젙蹂� �뙆�씪誘명꽣 �꽕�젙. 
			
			sqlMapper.update("updateFile", paramClass);
			
			
		}
		
		resultClass = (lineVO)sqlMapper.queryForObject("selectOne",getLine_num());
		
		
		return SUCCESS;
	}
		
	
	public String delete() throws Exception{
		//�뙆�씪誘명꽣�� 由ъ��듃 媛앹껜 �깮�꽦. 
		paramClass = new lineVO();
		resultClass = new lineVO();
		
		// �빐�떦 踰덊샇�쓽 湲��쓣 媛��졇�삩�떎.
		resultClass = (lineVO) sqlMapper.queryForObject("selectOne", getLine_num());
		String file_name = "file_" +resultClass.getLine_num();
		String file_ext = resultClass.getLine_img().substring(resultClass.getLine_img().lastIndexOf('.')+1,resultClass.getLine_img().length());
		

		
		//�꽌踰� �뙆�씪 �궘�젣
		
		File deleteFile = new File(fileUploadPath + file_name + "." +file_ext);
	
		deleteFile.delete();
		
		// �궘�젣�븷 �빆紐� �꽕�젙.
		paramClass.setLine_num(getLine_num());
		
		
		// �궘�젣 荑쇰━ �닔�뻾.
		sqlMapper.update("deleteLine", paramClass.getLine_num());
		sqlMapper.update("deleteBoard", paramClass.getLine_num());
		sqlMapper.update("deleteComment", paramClass.getLine_num());
		
		return SUCCESS;
	}
	
	
public String search() throws Exception {
		

		if(searchNum == 0){
			list = sqlMapper.queryForList("selectSearchW", "%"+getSearchKeyword()+"%");
		}
		if(searchNum == 1){
			list = sqlMapper.queryForList("selectSearchS", "%"+getSearchKeyword()+"%");
		}
		
		totalCount = list.size();
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, searchNum, getSearchKeyword());
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		list = list.subList(page.getStartCount(), lastCount);
		return SUCCESS;
		
	}

	public List<lineVO> getList() {
		return list;
	}

	public void setList(List<lineVO> list) {
		this.list = list;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public pagingAction getPage() {
		return page;
	}

	public void setPage(pagingAction page) {
		this.page = page;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public int getSearchNum() {
		return searchNum;
	}

	public void setSearchNum(int searchNum) {
		this.searchNum = searchNum;
	}

	public int getLine_num() {
		return line_num;
	}

	public void setLine_num(int line_num) {
		this.line_num = line_num;
	}

	public String getLine_subject() {
		return line_subject;
	}

	public void setLine_subject(String line_subject) {
		this.line_subject = line_subject;
	}

	public String getLine_img() {
		return line_img;
	}

	public void setLine_img(String line_img) {
		this.line_img = line_img;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		line.reader = reader;
	}

	public SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public void setSqlMapper(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public Calendar getLine_regdate() {
		return line_regdate;
	}

	public void setLine_regdate(Calendar line_regdate) {
		this.line_regdate = line_regdate;
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

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

	public lineVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(lineVO paramClass) {
		this.paramClass = paramClass;
	}

	public lineVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(lineVO resultClass) {
		this.resultClass = resultClass;
	}

}


















