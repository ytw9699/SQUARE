package board;

import java.io.File;
import java.io.IOException;
import java.io.Reader;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;

public class deleteAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private String line_num;
	private String board_num;
	private boardVO paramClass = new boardVO();
	
	private String fileupload_path = getClass().getResource("/").getPath().substring(0, (getClass().getResource("/").getPath()).indexOf(".metadata"))
			+"/SQUARE/WebContent/static/img/file_upload/";
	public deleteAction() throws IOException{
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception{
		
		int line_num = Integer.parseInt(getLine_num());
	    int board_num = Integer.parseInt(getBoard_num());
	       
	    paramClass = (boardVO)sqlMapper.queryForObject("selectView",board_num);
	      
	    File deleteFile = new File(fileupload_path+paramClass.getBoard_upload());
	    deleteFile.delete();
	       
	    sqlMapper.delete("deleteBoard2",paramClass);
	    sqlMapper.delete("deleteBcomments",board_num); //댓글도 날리기 
	    sqlMapper.delete("deleteBoardLike",board_num); //담아두기도 날리기
	    
	    return SUCCESS;
	}

	public String getLine_num() {
		return line_num;
	}

	public void setLine_num(String line_num) {
		this.line_num = line_num;
	}

	public String getBoard_num() {
		return board_num;
	}

	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}
	
	
}
