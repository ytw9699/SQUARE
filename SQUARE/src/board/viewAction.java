package board;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;

public class viewAction extends ActionSupport implements SessionAware{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private lineVO lineClass = new lineVO();
	private boardVO paramClass = new boardVO();
	private boardVO resultClass = new boardVO();
	
	private String line_num;
	private String currentPage;
	private String board_num;
	private String authorName;
	Map sessionMap;
	private like_boardVO likeClass = new like_boardVO();
	int checkNumber;
	int memberAuthority;
	//댓글추가부분 시작
	   private List<commentVO> commentsList = new ArrayList<commentVO>(); //하나의 코멘트
	   private List recommentSum = new ArrayList(); //해당코멘트에 달린 코멘트개수
	   private List regtimeTextList = new ArrayList(); //코멘트마다 달아놓는 방금전
	   private List commenterName = new ArrayList();
	   private List commenterImg = new ArrayList();
	   
	   public static final int SEC = 60;
	   public static final int MIN = 60;
	   public static final int HOUR = 24;
	   public static final int DAY = 30;
	   public static final int MONTH = 12;
	   //댓글추가부분 끝
	
	
	public viewAction() throws IOException{
		sqlMapper = SqlMapper.getMapper();
	}
	
	
	public String execute() throws Exception{
		
		String currentID = (String)sessionMap.get("logonID");
		memberAuthority = (int)sessionMap.get("logonAuthority");
		
	
		
		int line_num = Integer.parseInt(getLine_num());
		int board_num = Integer.parseInt(getBoard_num());
		//담아두기 확인부분
		likeClass.setLike_id(currentID);
		likeClass.setOrg_board_num(board_num);
		checkNumber = (Integer)sqlMapper.queryForObject("selectLike",likeClass);
		
		
		paramClass.setBoard_num(board_num);
		paramClass.setLine_num(line_num);
		sqlMapper.update("updateReadCount",paramClass);
		
		resultClass = (boardVO)sqlMapper.queryForObject("selectView",board_num);
		lineClass = (lineVO)sqlMapper.queryForObject("lineInfo",line_num);
		
		authorName = (String) sqlMapper.queryForObject("selectCommenterName", resultClass.getBoard_author());
		
		//댓글추가부분 시작
	      commentsList = sqlMapper.queryForList("selectCommentList", board_num);
	      for(int i = 0 ; i < commentsList.size() ; i++) {
	         int adder = (int) sqlMapper.queryForObject("selectCountRecomment",commentsList.get(i).getComment_ref());
	         recommentSum.add(adder-1);
	      }
	      for(int i = 0 ; i < commentsList.size() ; i++) {
	    	  commenterName.add(sqlMapper.queryForObject("selectCommenterName", commentsList.get(i).getComment_author()));
	      }
	      for(int i = 0 ; i < commentsList.size() ; i++) {
	    	  commenterImg.add(sqlMapper.queryForObject("selectCommenterImg", commentsList.get(i).getComment_author()));
	      }
	      
	      
	      for(int i = 0 ; i < commentsList.size() ; i++) {
	         
	         long curTime = System.currentTimeMillis();
	         long regTime = commentsList.get(i).getComment_regdate().getTime();
	         long diffTime = (curTime - regTime) / 1000;
	         if (diffTime < SEC) {
	            // sec
	            regtimeTextList.add("방금 전");
	         } else if ((diffTime /= SEC) < MIN) {
	            // min
	            regtimeTextList.add(diffTime + "분 전");
	         } else if ((diffTime /= MIN) < HOUR) {
	            // hour
	            regtimeTextList.add((diffTime) + "시간 전");
	         } else if ((diffTime /= HOUR) < DAY) {
	            // day
	            regtimeTextList.add((diffTime) + "일 전");
	         } else if ((diffTime /= DAY) < MONTH) {
	            // day
	            regtimeTextList.add((diffTime) + "달 전");
	         } else {
	            regtimeTextList.add((diffTime) + "년 전");
	         }
	         
	      }
	      
	      //댓글추가부분 끝
		
		
		
		
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


	public static Reader getReader() {
		return reader;
	}


	public static void setReader(Reader reader) {
		viewAction.reader = reader;
	}


	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}


	public static void setSqlMapper(SqlMapClient sqlMapper) {
		viewAction.sqlMapper = sqlMapper;
	}


	public List<commentVO> getCommentsList() {
		return commentsList;
	}


	public void setCommentsList(List<commentVO> commentsList) {
		this.commentsList = commentsList;
	}


	public List getRecommentSum() {
		return recommentSum;
	}


	public void setRecommentSum(List recommentSum) {
		this.recommentSum = recommentSum;
	}


	public List getRegtimeTextList() {
		return regtimeTextList;
	}


	public void setRegtimeTextList(List regtimeTextList) {
		this.regtimeTextList = regtimeTextList;
	}


	public static int getSec() {
		return SEC;
	}


	public static int getMin() {
		return MIN;
	}


	public static int getHour() {
		return HOUR;
	}


	public static int getDay() {
		return DAY;
	}


	public static int getMonth() {
		return MONTH;
	}


	@Override
	public void setSession(Map arg0) {
		// TODO Auto-generated method stub
		this.sessionMap = arg0;
	}


	public Map getSessionMap() {
		return sessionMap;
	}


	public void setSessionMap(Map sessionMap) {
		this.sessionMap = sessionMap;
	}


	public like_boardVO getLikeClass() {
		return likeClass;
	}


	public void setLikeClass(like_boardVO likeClass) {
		this.likeClass = likeClass;
	}


	public int getCheckNumber() {
		return checkNumber;
	}


	public void setCheckNumber(int checkNumber) {
		this.checkNumber = checkNumber;
	}


	public List getCommenterName() {
		return commenterName;
	}


	public void setCommenterName(List commenterName) {
		this.commenterName = commenterName;
	}


	public List getCommenterImg() {
		return commenterImg;
	}


	public void setCommenterImg(List commenterImg) {
		this.commenterImg = commenterImg;
	}


	public String getAuthorName() {
		return authorName;
	}


	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}


	public int getMemberAuthority() {
		return memberAuthority;
	}


	public void setMemberAuthority(int memberAuthority) {
		this.memberAuthority = memberAuthority;
	}
	
	
	
	
}
