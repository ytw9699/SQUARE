package mypage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import board.boardVO;
import board.commentVO;
import board.like_boardVO;
import config.SqlMapper;
import memberSearch.pagingAction;
import memberSearch.searchboardVO;
import memberSearch.searchcommentVO;

public class myLists extends ActionSupport implements SessionAware {

	SqlMapClient sqlMapper;
	Map sessionMap;
	
	private List<searchboardVO> myBoardList = new ArrayList<searchboardVO>();
	private List<searchcommentVO> myCommentList = new ArrayList<searchcommentVO>();
	private List<like_boardVO> myLikedList = new ArrayList<like_boardVO>();
	private List<searchboardVO> myLikedBoardList = new ArrayList<searchboardVO>();
	private List<Integer> commentCounting = new ArrayList<Integer>();
	private List<String> lineNameList = new ArrayList<String>();
	private int myBoardSum;
	private int myCommentSum;
	private int myLikedSum;
	
	//페이징
		private int currentPage = 1;
		private int totalCount;
		private int blockCount = 10;
		private int blockPage = 5;
		private String pagingHtml;
		private pagingMyBoard pagingMyBoard;
		private pagingMyComments pagingMyComments;
		private pagingMyLikedBoard pagingMyLikedBoard;
	
	public myLists() {
		sqlMapper = SqlMapper.getMapper();	
	}
	
	public String myBoardList() throws Exception{
		String currentID = (String) sessionMap.get("logonID");
		myBoardList = sqlMapper.queryForList("selectMyPage_boardList", currentID);
		myBoardSum = myBoardList.size();
		
		totalCount = myBoardList.size();
		pagingMyBoard = new pagingMyBoard(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = pagingMyBoard.getPagingHtml().toString();
		int lastCount = totalCount;
		if(pagingMyBoard.getEndCount() < totalCount)
			lastCount = pagingMyBoard.getEndCount() + 1;
		
		myBoardList = myBoardList.subList(pagingMyBoard.getStartCount(), lastCount);
		//댓글개수세기
		for(int i = 0 ; i < myBoardList.size() ; i++)
			commentCounting.add((Integer) sqlMapper.queryForObject("selectMyPageCommentCounting", myBoardList.get(i).getBoard_num()));
	
		//라인이름받기
		for(int i = 0 ; i < myBoardList.size(); i++)
			lineNameList.add((String) sqlMapper.queryForObject("selectMyPageLineName", myBoardList.get(i).getLine_num()));
		
		return SUCCESS;
	}
	
	public String myCommentList() throws Exception{
		String currentID = (String) sessionMap.get("logonID");
		myCommentList = sqlMapper.queryForList("selectMyPage_commentList", currentID);
		myCommentSum = myCommentList.size();
		
		totalCount = myCommentList.size();
		pagingMyComments = new pagingMyComments(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = pagingMyComments.getPagingHtml().toString();
		int lastCount = totalCount;
		if(pagingMyComments.getEndCount() < totalCount)
			lastCount = pagingMyComments.getEndCount() + 1;
		
		myCommentList = myCommentList.subList(pagingMyComments.getStartCount(), lastCount);
		//라인이름받기
		for(int i = 0 ; i < myCommentList.size(); i++)
			lineNameList.add((String) sqlMapper.queryForObject("selectMyPageLineName", myCommentList.get(i).getLine_num()));
		
		return SUCCESS;
	}
	
	public String myLikedList() throws Exception{
		String currentID = (String) sessionMap.get("logonID");
		myLikedList = sqlMapper.queryForList("selectMyPage_likedList", currentID);
		for(int i = 0 ; i < myLikedList.size() ; i++)
			myLikedBoardList.add((searchboardVO) sqlMapper.queryForObject("selectMyPage_likedBoardList", myLikedList.get(i).getOrg_board_num()));
		
		myLikedSum = myLikedBoardList.size();
		totalCount = myLikedBoardList.size();
		pagingMyLikedBoard = new pagingMyLikedBoard(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = pagingMyLikedBoard.getPagingHtml().toString();
		int lastCount = totalCount;
		if(pagingMyLikedBoard.getEndCount() < totalCount)
			lastCount = pagingMyLikedBoard.getEndCount() + 1;
		
		myLikedBoardList = myLikedBoardList.subList(pagingMyLikedBoard.getStartCount(), lastCount);
		//댓글개수 세기
		for(int i = 0 ; i < myLikedBoardList.size() ; i++)
			commentCounting.add((Integer) sqlMapper.queryForObject("selectMyPageCommentCounting", myLikedBoardList.get(i).getBoard_num()));
		//라인이름받기
			for(int i = 0 ; i < myLikedBoardList.size(); i++)
				lineNameList.add((String) sqlMapper.queryForObject("selectMyPageLineName", myLikedBoardList.get(i).getLine_num()));
		
		
		return SUCCESS;
	}

	@Override
	public void setSession(Map arg0) {
		// TODO Auto-generated method stub
		this.sessionMap = arg0;
	}

	public SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public void setSqlMapper(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

	public Map getSessionMap() {
		return sessionMap;
	}

	public void setSessionMap(Map sessionMap) {
		this.sessionMap = sessionMap;
	}

	

	public List<searchboardVO> getMyBoardList() {
		return myBoardList;
		}

	public void setMyBoardList(List<searchboardVO> myBoardList) {
		this.myBoardList = myBoardList;
	}

	
	
	public List<searchcommentVO> getMyCommentList() {
		return myCommentList;
	}

	public void setMyCommentList(List<searchcommentVO> myCommentList) {
		this.myCommentList = myCommentList;
	}

	public List<like_boardVO> getMyLikedList() {
		return myLikedList;
	}

	public void setMyLikedList(List<like_boardVO> myLikedList) {
		this.myLikedList = myLikedList;
	}

	public List<searchboardVO> getMyLikedBoardList() {
		return myLikedBoardList;
	}

	public void setMyLikedBoardList(List<searchboardVO> myLikedBoardList) {
		this.myLikedBoardList = myLikedBoardList;
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

	public pagingMyBoard getPagingMyBoard() {
		return pagingMyBoard;
	}

	public void setPagingMyBoard(pagingMyBoard pagingMyBoard) {
		this.pagingMyBoard = pagingMyBoard;
	}

	public pagingMyComments getPagingMyComments() {
		return pagingMyComments;
	}

	public void setPagingMyComments(pagingMyComments pagingMyComments) {
		this.pagingMyComments = pagingMyComments;
	}

	public pagingMyLikedBoard getPagingMyLikedBoard() {
		return pagingMyLikedBoard;
	}

	public void setPagingMyLikedBoard(pagingMyLikedBoard pagingMyLikedBoard) {
		this.pagingMyLikedBoard = pagingMyLikedBoard;
	}

	public int getMyBoardSum() {
		return myBoardSum;
	}

	public void setMyBoardSum(int myBoardSum) {
		this.myBoardSum = myBoardSum;
	}

	public int getMyCommentSum() {
		return myCommentSum;
	}

	public void setMyCommentSum(int myCommentSum) {
		this.myCommentSum = myCommentSum;
	}

	public int getMyLikedSum() {
		return myLikedSum;
	}

	public void setMyLikedSum(int myLikedSum) {
		this.myLikedSum = myLikedSum;
	}

	public List<Integer> getCommentCounting() {
		return commentCounting;
	}

	public void setCommentCounting(List<Integer> commentCounting) {
		this.commentCounting = commentCounting;
	}

	public List<String> getLineNameList() {
		return lineNameList;
	}

	public void setLineNameList(List<String> lineNameList) {
		this.lineNameList = lineNameList;
	}
	

	
	
	
	
	
	
}
