package main;


import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;

public class mainAction extends ActionSupport implements SessionAware, RequestAware, ServletRequestAware {

	SqlMapClient sqlMapper;
	Map sessionMap;
	Map requestMap;
	HttpServletRequest request;
	HttpServletResponse response;
	
	
	List mainList = new ArrayList();
	
	List hotList = new ArrayList();
	List hotSumList = new ArrayList();

	List boardBoundingList = new ArrayList();
	List<LineDTO> boardList = new ArrayList<LineDTO>();
	List<Integer> boardCommentSumList = new ArrayList<Integer>();
	List<Integer> boardCommentSumListWrap = new ArrayList<Integer>();
	
	List nomalListName = new ArrayList();
	
	List headerLineList = new ArrayList();
	memberVO myInfomation = new memberVO();
	String currentID;
	
	public mainAction() {
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception{
		/*System.out.println(getClass().getResource("/").getPath());
		System.out.println((getClass().getResource("/").getPath()).indexOf(".metadata"));
		System.out.println(getClass().getResource("/").getPath().substring(0,(getClass().getResource("/").getPath()).indexOf(".metadata")));*/
		
		//세션이 없으면 로그인으로 이동
		if(sessionMap.get("logonID") == null) {
			return LOGIN;
		}else {
		//세션이 있으면 메인페이지로	
			currentID = (String) sessionMap.get("logonID");
			myInfomation = (memberVO) sqlMapper.queryForObject("memberOne",currentID);
			//모든페이지에서 다쓸거라 세션에 올립니다
			sessionMap.put("logonName", myInfomation.getName());
			sessionMap.put("logonImg", myInfomation.getProfile_img());
			sessionMap.put("logonAuthority", myInfomation.getAuthority());
			sessionMap.put("logonStatus", myInfomation.getStatus());
			
			headerLineList = sqlMapper.queryForList("headerLineList");
			sessionMap.put("headerLineList", headerLineList);
			//모든페이지에서 다쓸거라 세션에 올릴게요
			mainList = sqlMapper.queryForList("mainList");
			//System.out.println(mainList.size());
			for(int i = 0 ; i < 8 ; i++) {
				if(i == mainList.size())break;
				
				lineVO linevo = new lineVO();
				int hotLineSum = 0;
				linevo = (lineVO) sqlMapper.queryForObject("hotLine",mainList.get(i));
				hotLineSum = (int) sqlMapper.queryForObject("hotLineSum", mainList.get(i));
				hotList.add(linevo);
				hotSumList.add(hotLineSum);
			}
			
			if(mainList.size() > 8) {
			//System.out.println(mainList.size());
			for(int i = 8 ; i < mainList.size() ; i++) {
				String listName = "";
				//System.out.println(mainList.get(i));
				boardList = sqlMapper.queryForList("subList", mainList.get(i));
				for(int j=0 ; j < boardList.size(); j++){
				//System.out.println(boardList.get(0).getBoard_subject().length());
				if(boardList.get(j).getBoard_subject().length() > 15) {
					String cuttingSubject = boardList.get(j).getBoard_subject().substring(0, 15);
					boardList.get(j).setBoard_subject(cuttingSubject + "...");
				}
				}
				for(int h = 0 ; h < boardList.size() ; h++)
					boardCommentSumList.add((Integer) sqlMapper.queryForObject("selectCountingCommentList", boardList.get(h).getBoard_num()));
				
			
				listName =  (String) sqlMapper.queryForObject("subListName", mainList.get(i));
				
				nomalListName.add(listName);
				boardBoundingList.add(boardList);
				
				}

			//서브리스트 개수제한
			if(boardBoundingList.size() > 9) {
				boardBoundingList = boardBoundingList.subList(0, 9);
			}
			}

			return SUCCESS;
		}
	}
	
	//SessionAware의 setSession 구현
		public void setSession(Map session) {
			this.sessionMap = session;
		}	
			//RequestAware의 setRequest 구현
		public void setRequest(Map requestMap) {
			this.requestMap = requestMap;
		}	
			//ServletRequestAware의 serServletRequest 구현
		public void setServletRequest(HttpServletRequest request) {
			this.request = request;
		}

		

		public List getHeaderLineList() {
			return headerLineList;
		}

		public void setHeaderLineList(List headerLineList) {
			this.headerLineList = headerLineList;
		}

		public memberVO getMyInfomation() {
			return myInfomation;
		}

		public void setMyInfomation(memberVO myInfomation) {
			this.myInfomation = myInfomation;
		}

		public String getCurrentID() {
			return currentID;
		}

		public void setCurrentID(String currentID) {
			this.currentID = currentID;
		}

		public List getMainList() {
			return mainList;
		}

		public void setMainList(List mainList) {
			this.mainList = mainList;
		}

		public List getBoardBoundingList() {
			return boardBoundingList;
		}

		public void setBoardBoundingList(List boardBoundingList) {
			this.boardBoundingList = boardBoundingList;
		}

		public List<LineDTO> getBoardList() {
			return boardList;
		}

		public void setBoardList(List<LineDTO> boardList) {
			this.boardList = boardList;
		}

		public List getHotList() {
			return hotList;
		}

		public void setHotList(List hotList) {
			this.hotList = hotList;
		}

		public List getHotSumList() {
			return hotSumList;
		}

		public void setHotSumList(List hotSumList) {
			this.hotSumList = hotSumList;
		}

		public List getNomalListName() {
			return nomalListName;
		}

		public void setNomalListName(List nomalListName) {
			this.nomalListName = nomalListName;
		}

		public List<Integer> getBoardCommentSumList() {
			return boardCommentSumList;
		}

		public void setBoardCommentSumList(List<Integer> boardCommentSumList) {
			this.boardCommentSumList = boardCommentSumList;
		}

		public List<Integer> getBoardCommentSumListWrap() {
			return boardCommentSumListWrap;
		}

		public void setBoardCommentSumListWrap(List<Integer> boardCommentSumListWrap) {
			this.boardCommentSumListWrap = boardCommentSumListWrap;
		}

		
		
		
		
		
	
}
