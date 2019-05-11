package memberSearch;

import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;

public class memberSearch extends ActionSupport {

	SqlMapClient sqlMapper;
	
	private String search;
	private String writeSearch;
	private int searchKind = 0;
	
	private List<searchboardVO> boardSubjectList = new ArrayList<searchboardVO>();
	private List<String> boardSubjectLN = new ArrayList<String>();
	private int boardSubjectListsum;
	
	private List<searchboardVO> boardContentList = new ArrayList<searchboardVO>();
	private List<String> boardContentLN = new ArrayList<String>();
	private int boardContentListsum;
	
	private List<searchcommentVO> commentContentList = new ArrayList<searchcommentVO>();
	private List<String> commentContentLN = new ArrayList<String>();
	
	private List<searchboardVO> boardWriterList = new ArrayList<searchboardVO>();
	private List<String> boardWriterLN = new ArrayList<String>();
	private int boardWriterListsum;
	
	private List<searchcommentVO> commentWriterList = new ArrayList<searchcommentVO>();
	private List<String> commentWriterLN = new ArrayList<String>();
	
	public memberSearch() {
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String seachGolbang() throws Exception{
		
		return SUCCESS;
	}
	
	public String execute() throws Exception{
		String keyword = "%"+getSearch()+"%";
		if(getSearch().substring(0, 1).equals("@")) {
			//사용자검색로직
			writeSearch = getSearch().substring(1);
			//System.out.println(getSearch().substring(1));
			String writerKeyword = "%"+getSearch().substring(1)+"%";
			searchKind = 1;
			boardWriterList = sqlMapper.queryForList("boardWriterList",writerKeyword);
			boardWriterListsum = boardWriterList.size();
			if(boardWriterList.size() > 10)
				boardWriterList = boardWriterList.subList(0, 9);
			for(int i = 0 ; i < boardWriterList.size() ; i++)
				boardWriterLN.add((String) sqlMapper.queryForObject("selectLineSubjectForSearch",boardWriterList.get(i).getLine_num())); 
			
			commentWriterList = sqlMapper.queryForList("commentWriterList",writerKeyword);
			if(commentWriterList.size() > 10)
				commentWriterList = commentWriterList.subList(0, 9);
		}
		
		boardSubjectList = sqlMapper.queryForList("boardSubjectList",keyword);
		boardSubjectListsum = boardSubjectList.size();
		if(boardSubjectList.size() > 10)
			boardSubjectList = boardSubjectList.subList(0, 9);
		for(int i = 0 ; i < boardSubjectList.size() ; i++)
			boardSubjectLN.add((String) sqlMapper.queryForObject("selectLineSubjectForSearch",boardSubjectList.get(i).getLine_num())); 
		
		boardContentList = sqlMapper.queryForList("boardContentList",keyword);
		boardContentListsum = boardContentList.size();
		if(boardContentList.size() > 10)
			boardContentList = boardContentList.subList(0, 9);
		for(int i = 0 ; i < boardContentList.size() ; i++)
			boardContentLN.add((String) sqlMapper.queryForObject("selectLineSubjectForSearch",boardContentList.get(i).getLine_num())); 
		
		commentContentList = sqlMapper.queryForList("commentContentList",keyword);
		if(commentContentList.size() > 10)
			commentContentList = commentContentList.subList(0, 9);
		
		return SUCCESS;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getWriteSearch() {
		return writeSearch;
	}

	public void setWriteSearch(String writeSearch) {
		this.writeSearch = writeSearch;
	}

	public int getSearchKind() {
		return searchKind;
	}

	public void setSearchKind(int searchKind) {
		this.searchKind = searchKind;
	}

	public List<searchboardVO> getBoardSubjectList() {
		return boardSubjectList;
	}

	public void setBoardSubjectList(List<searchboardVO> boardSubjectList) {
		this.boardSubjectList = boardSubjectList;
	}

	public List<String> getBoardSubjectLN() {
		return boardSubjectLN;
	}

	public void setBoardSubjectLN(List<String> boardSubjectLN) {
		this.boardSubjectLN = boardSubjectLN;
	}

	public List<searchboardVO> getBoardContentList() {
		return boardContentList;
	}

	public void setBoardContentList(List<searchboardVO> boardContentList) {
		this.boardContentList = boardContentList;
	}

	public List<String> getBoardContentLN() {
		return boardContentLN;
	}

	public void setBoardContentLN(List<String> boardContentLN) {
		this.boardContentLN = boardContentLN;
	}

	public List<searchcommentVO> getCommentContentList() {
		return commentContentList;
	}

	public void setCommentContentList(List<searchcommentVO> commentContentList) {
		this.commentContentList = commentContentList;
	}

	public List<String> getCommentContentLN() {
		return commentContentLN;
	}

	public void setCommentContentLN(List<String> commentContentLN) {
		this.commentContentLN = commentContentLN;
	}

	public List<searchboardVO> getBoardWriterList() {
		return boardWriterList;
	}

	public void setBoardWriterList(List<searchboardVO> boardWriterList) {
		this.boardWriterList = boardWriterList;
	}

	public List<String> getBoardWriterLN() {
		return boardWriterLN;
	}

	public void setBoardWriterLN(List<String> boardWriterLN) {
		this.boardWriterLN = boardWriterLN;
	}

	public List<searchcommentVO> getCommentWriterList() {
		return commentWriterList;
	}

	public void setCommentWriterList(List<searchcommentVO> commentWriterList) {
		this.commentWriterList = commentWriterList;
	}

	public List<String> getCommentWriterLN() {
		return commentWriterLN;
	}

	public void setCommentWriterLN(List<String> commentWriterLN) {
		this.commentWriterLN = commentWriterLN;
	}

	public int getBoardSubjectListsum() {
		return boardSubjectListsum;
	}

	public void setBoardSubjectListsum(int boardSubjectListsum) {
		this.boardSubjectListsum = boardSubjectListsum;
	}

	public int getBoardContentListsum() {
		return boardContentListsum;
	}

	public void setBoardContentListsum(int boardContentListsum) {
		this.boardContentListsum = boardContentListsum;
	}

	public int getBoardWriterListsum() {
		return boardWriterListsum;
	}

	public void setBoardWriterListsum(int boardWriterListsum) {
		this.boardWriterListsum = boardWriterListsum;
	}
	
	
	
}
