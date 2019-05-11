package board;

import java.io.IOException;
import java.io.Reader;
import java.util.Date;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;

public class modifyFormAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private boardVO paramClass;
	private boardVO resultClass;
	private lineVO lineClass;
	
	private int board_num;
	private int line_num;
	private int currentPage;


	
	
	
	
	public modifyFormAction() throws IOException{
		
		sqlMapper = SqlMapper.getMapper();
		
	}
	
	public String execute() throws Exception{
		 /* 아이디가 오면 맞는지 확인하고*/
		  
		  lineClass = new lineVO();
		  resultClass = new boardVO();
		  
		  
		  
		  resultClass= (boardVO)sqlMapper.queryForObject("selectView",getBoard_num());
		  lineClass = (lineVO)sqlMapper.queryForObject("lineInfo",getLine_num());
		  
		
		return SUCCESS;
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

	public lineVO getLineClass() {
		return lineClass;
	}

	public void setLineClass(lineVO lineClass) {
		this.lineClass = lineClass;
	}


}
