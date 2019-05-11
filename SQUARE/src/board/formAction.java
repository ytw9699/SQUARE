package board;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import config.SqlMapper;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;


public class formAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
		
	private lineVO lineClass;
	private String line_num;
	
	public formAction() throws IOException{
		sqlMapper = SqlMapper.getMapper();
	} 
	
	public String execute() throws Exception{
		   
		int a = Integer.parseInt(getLine_num());
		lineClass = (lineVO)sqlMapper.queryForObject("lineInfo", a);
		
		
		
		
		
		
		return SUCCESS;
		
	}

	public lineVO getLineClass() {
		return lineClass;
	}

	public void setLineClass(lineVO lineClass) {
		this.lineClass = lineClass;
	}

	public String getLine_num() {
		return line_num;
	}

	public void setLine_num(String line_num) {
		this.line_num = line_num;
	}
	
	
	
}
