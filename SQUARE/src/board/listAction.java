package board;


import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;
import config.SqlMapper;

public class listAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private int currentPage = 1;
	private String line_num; //line_num -> 메인에서 받아옴 
	private int totalCount; 
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private pagingAction page;
	private int searchN;
	private String searchKeyword;
	
	//추가부분 시작
		private List<boardVO> readcountBestList = new ArrayList<boardVO>();
		private List readcountBestComment = new ArrayList();
		private List<boardVO> goodBestList = new ArrayList<boardVO>();
		private List goodBestComment = new ArrayList();
		private List<boardVO> donationBestList = new ArrayList<boardVO>();
		private List donationBestComment = new ArrayList();
		private List<boardVO> commentsBestList = new ArrayList<boardVO>();
		private List commentsBestComment = new ArrayList();
		
		private List<Integer> boardNumGroupCommentsList = new ArrayList<Integer>();
		private lineVO lineClass = new lineVO();
		private List nameList = new ArrayList();
		private List imgList = new ArrayList();
		//추가부분 끝
	
	//list 가져오는 list
	private List<boardVO> list = new ArrayList<boardVO>();
	//댓글개수 들어가는 list
	private List commentSumaryList = new ArrayList();
	
	/* sqlMapper 공통 부분*/
	public listAction() throws IOException{
		sqlMapper = SqlMapper.getMapper();
	}
	
	/* 검색 부분 */
	public String search() throws Exception{
		
		int a = Integer.parseInt(getLine_num());
		
		boardVO board = new boardVO();
		board.setLine_num(a);
		board.setBoard_subject("%"+getSearchKeyword()+"%");
		
		lineClass =(lineVO)sqlMapper.queryForObject("lineInfo",a);
		
		if(getSearchN() == 0 ) { //글쓴이
				list = sqlMapper.queryForList("SearchW",board);
		}
		else if(getSearchN() == 1) {  //글내용
			    list = sqlMapper.queryForList("SearchC",board);
			
		}else if(getSearchN() == 2) { //글제목
			 	list = sqlMapper.queryForList("SearchS",board);
			 	
		}
		
		
		
		totalCount = list.size(); //가져온 listsize;
		System.out.println(totalCount); //12맞는데..?
		
								 //12
	
		page = new pagingAction(a, currentPage, totalCount, blockCount, blockPage, 44, "");
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount; //마지막 카운트는 가져온 listsize
	
		
		//현재 페이지의 마지막 글의 번호가 전체의 마지막 글 번호보다 작으면
		//lastCount를 +1 번호 설정
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		//전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
		
		list = list.subList(page.getStartCount(), lastCount);
		for(int i = 0 ; i < list.size() ; i++) {
			commentSumaryList.add(sqlMapper.queryForObject("selectCountingCommentList", list.get(i).getBoard_num()));
		}
		for(int i = 0 ; i < list.size() ; i++) {
			nameList.add(sqlMapper.queryForObject("selectBoardListName",list.get(i).getBoard_author()));
		}
		for(int i = 0 ; i < list.size() ; i++) {
			imgList.add(sqlMapper.queryForObject("selectBoardListImg",list.get(i).getBoard_author()));
		}
		
		//글제목 자르기
				for(int i = 0 ; i < list.size() ; i++) {
					if(list.get(i).getBoard_subject().length() > 27) {
						list.get(i).setBoard_subject(list.get(i).getBoard_subject().substring(0, 26)+"...");
					}
				}
		

		//추가부분 시작
		//selectCommentsCounting
		//조회순 리스트+각게시물 댓글수
		readcountBestList = sqlMapper.queryForList("readcountBestList", a);
		for(int i = 0 ; i < readcountBestList.size() ; i++)
			readcountBestComment.add(sqlMapper.queryForObject("selectCommentsCounting", readcountBestList.get(i).getBoard_num()));
		if(readcountBestList.size() > 10)
			readcountBestList = readcountBestList.subList(0, 10);
		
		for(int i = 0 ; i < readcountBestList.size() ; i++) {
			if(readcountBestList.get(i).getBoard_subject().length() > 17) {
				readcountBestList.get(i).setBoard_subject(readcountBestList.get(i).getBoard_subject().substring(0, 17)+"...");
			}
		}
		
		
		//추천순 리스트+각게시물 댓글수
		goodBestList = sqlMapper.queryForList("goodBestList", a);
		for(int i = 0 ; i < goodBestList.size() ; i++)
			goodBestComment.add(sqlMapper.queryForObject("selectCommentsCounting", goodBestList.get(i).getBoard_num()));
		if(goodBestList.size() > 10)
			goodBestList = goodBestList.subList(0, 10);
		
		for(int i = 0 ; i < goodBestList.size() ; i++) {
			if(goodBestList.get(i).getBoard_subject().length() > 17) {
				goodBestList.get(i).setBoard_subject(goodBestList.get(i).getBoard_subject().substring(0, 17)+"...");
			}
		}
		
		
		//기부순 리스트+각게시물 댓글수
		donationBestList = sqlMapper.queryForList("donationBestList", a);
		for(int i = 0 ; i < donationBestList.size() ; i++)
			donationBestComment.add(sqlMapper.queryForObject("selectCommentsCounting", donationBestList.get(i).getBoard_num()));
		if(donationBestList.size() > 10)
			donationBestList = donationBestList.subList(0, 10);
		
		for(int i = 0 ; i < donationBestList.size() ; i++) {
			if(donationBestList.get(i).getBoard_subject().length() > 17) {
				donationBestList.get(i).setBoard_subject(donationBestList.get(i).getBoard_subject().substring(0, 17)+"...");
			}
		}
		
		
		//댓글순 리스트+각게시물 댓글수
		boardNumGroupCommentsList = sqlMapper.queryForList("boardNumGroupCommentsList", a);
		for(int i = 0 ; i < boardNumGroupCommentsList.size() ; i++)
			commentsBestList.add((boardVO) sqlMapper.queryForObject("commentsBestList", boardNumGroupCommentsList.get(i)));
		if(commentsBestList.size() > 10)
			commentsBestList = commentsBestList.subList(0, 10);
		
		for(int i = 0 ; i < commentsBestList.size() ; i++)
			commentsBestComment.add(sqlMapper.queryForObject("selectCommentsCounting", commentsBestList.get(i).getBoard_num()));
		
		for(int i = 0 ; i < commentsBestList.size() ; i++) {
			commentsBestComment.add(sqlMapper.queryForObject("selectCommentsCounting", commentsBestList.get(i).getBoard_num()));
		}
		
		for(int i = 0 ; i < commentsBestList.size() ; i++) {
			if(commentsBestList.get(i).getBoard_subject().length() > 17) {
				commentsBestList.get(i).setBoard_subject(commentsBestList.get(i).getBoard_subject().substring(0, 17)+"...");
			}
		}
		
		//추가부분 끝
		
		
		
		return SUCCESS;
	
      }
		
	  	
	
	

	
	 /* execute list 목록 보여주기*/
	public String execute() throws Exception{
		
		int a = Integer.parseInt(getLine_num());
		
		
		
		 if(getSearchKeyword() != null) {
			    return search();
		 }
		
	    lineClass =(lineVO)sqlMapper.queryForObject("lineInfo",a);
		list = sqlMapper.queryForList("selectAll2", a);
		totalCount = list.size(); //가져온 listsize;
		

		page = new pagingAction(a, currentPage, totalCount, blockCount, blockPage, 44, "");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
	
		list = list.subList(page.getStartCount(), lastCount);
		for(int i = 0 ; i < list.size() ; i++) {
			commentSumaryList.add(sqlMapper.queryForObject("selectCountingCommentList", list.get(i).getBoard_num()));
		}
		for(int i = 0 ; i < list.size() ; i++) {
			nameList.add(sqlMapper.queryForObject("selectBoardListName",list.get(i).getBoard_author()));
		}
		for(int i = 0 ; i < list.size() ; i++) {
			imgList.add(sqlMapper.queryForObject("selectBoardListImg",list.get(i).getBoard_author()));
		}
		
		//글제목 자르기
		for(int i = 0 ; i < list.size() ; i++) {
			if(list.get(i).getBoard_subject().length() > 27) {
				list.get(i).setBoard_subject(list.get(i).getBoard_subject().substring(0, 26)+"...");
			}
		}
		

		//추가부분 시작
		//selectCommentsCounting
		//조회순 리스트+각게시물 댓글수
		readcountBestList = sqlMapper.queryForList("readcountBestList", a);
		for(int i = 0 ; i < readcountBestList.size() ; i++)
			readcountBestComment.add(sqlMapper.queryForObject("selectCommentsCounting", readcountBestList.get(i).getBoard_num()));
		if(readcountBestList.size() > 10)
			readcountBestList = readcountBestList.subList(0, 10);
		
		for(int i = 0 ; i < readcountBestList.size() ; i++) {
			if(readcountBestList.get(i).getBoard_subject().length() > 17) {
				readcountBestList.get(i).setBoard_subject(readcountBestList.get(i).getBoard_subject().substring(0, 17)+"...");
			}
		}
		
		//추천순 리스트+각게시물 댓글수
		goodBestList = sqlMapper.queryForList("goodBestList", a);
		for(int i = 0 ; i < goodBestList.size() ; i++)
			goodBestComment.add(sqlMapper.queryForObject("selectCommentsCounting", goodBestList.get(i).getBoard_num()));
		if(goodBestList.size() > 10)
			goodBestList = goodBestList.subList(0, 10);
		
		for(int i = 0 ; i < goodBestList.size() ; i++) {
			if(goodBestList.get(i).getBoard_subject().length() > 17) {
				goodBestList.get(i).setBoard_subject(goodBestList.get(i).getBoard_subject().substring(0, 17)+"...");
			}
		}
		
		//기부순 리스트+각게시물 댓글수
		donationBestList = sqlMapper.queryForList("donationBestList", a);
		for(int i = 0 ; i < donationBestList.size() ; i++)
			donationBestComment.add(sqlMapper.queryForObject("selectCommentsCounting", donationBestList.get(i).getBoard_num()));
		if(donationBestList.size() > 10)
			donationBestList = donationBestList.subList(0, 10);

		for(int i = 0 ; i < donationBestList.size() ; i++) {
			if(donationBestList.get(i).getBoard_subject().length() > 17) {
				donationBestList.get(i).setBoard_subject(donationBestList.get(i).getBoard_subject().substring(0, 17)+"...");
			}
		}
		
		//댓글순 리스트+각게시물 댓글수 ///////////////////////////////////////여기보자
		boardNumGroupCommentsList = sqlMapper.queryForList("boardNumGroupCommentsList", a);
		
		for(int i = 0 ; i < boardNumGroupCommentsList.size() ; i++) {
			commentsBestList.add((boardVO) sqlMapper.queryForObject("commentsBestList", boardNumGroupCommentsList.get(i)));
			//System.out.println(commentsBestList.get(i).getBoard_subject()+"=="+commentsBestList.get(i).getBoard_num());
		}
		
		if(commentsBestList.size() > 10) {
			commentsBestList = commentsBestList.subList(0, 9);
		}
		
	
		for(int i = 0 ; i < commentsBestList.size() ; i++) {
			commentsBestComment.add(sqlMapper.queryForObject("selectCommentsCounting", commentsBestList.get(i).getBoard_num()));
		}
		
		for(int i = 0 ; i < commentsBestList.size() ; i++) {
			if(commentsBestList.get(i).getBoard_subject().length() > 17) {
				commentsBestList.get(i).setBoard_subject(commentsBestList.get(i).getBoard_subject().substring(0, 17)+"...");
			}
		}
		
		
		//추가부분 끝
		
		return SUCCESS;
		
		
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public String getLine_num() {
		return line_num;
	}


	public void setLine_num(String line_num) {
		this.line_num = line_num;
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


	public List<boardVO> getList() {
		return list;
	}


	public void setList(List<boardVO> list) {
		this.list = list;
	}


	public static Reader getReader() {
		return reader;
	}


	public static void setReader(Reader reader) {
		listAction.reader = reader;
	}


	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}


	public static void setSqlMapper(SqlMapClient sqlMapper) {
		listAction.sqlMapper = sqlMapper;
	}


	public int getSearchN() {
		return searchN;
	}


	public void setSearchN(int searchN) {
		this.searchN = searchN;
	}


	public String getSearchKeyword() {
		return searchKeyword;
	}


	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public List getCommentSumaryList() {
		return commentSumaryList;
	}

	public void setCommentSumaryList(List commentSumaryList) {
		this.commentSumaryList = commentSumaryList;
	}

	public List<boardVO> getReadcountBestList() {
		return readcountBestList;
	}

	public void setReadcountBestList(List<boardVO> readcountBestList) {
		this.readcountBestList = readcountBestList;
	}

	public List getReadcountBestComment() {
		return readcountBestComment;
	}

	public void setReadcountBestComment(List readcountBestComment) {
		this.readcountBestComment = readcountBestComment;
	}

	public List<boardVO> getGoodBestList() {
		return goodBestList;
	}

	public void setGoodBestList(List<boardVO> goodBestList) {
		this.goodBestList = goodBestList;
	}

	public List getGoodBestComment() {
		return goodBestComment;
	}

	public void setGoodBestComment(List goodBestComment) {
		this.goodBestComment = goodBestComment;
	}

	public List<boardVO> getDonationBestList() {
		return donationBestList;
	}

	public void setDonationBestList(List<boardVO> donationBestList) {
		this.donationBestList = donationBestList;
	}

	public List getDonationBestComment() {
		return donationBestComment;
	}

	public void setDonationBestComment(List donationBestComment) {
		this.donationBestComment = donationBestComment;
	}

	public List<boardVO> getCommentsBestList() {
		return commentsBestList;
	}

	public void setCommentsBestList(List<boardVO> commentsBestList) {
		this.commentsBestList = commentsBestList;
	}

	public List getCommentsBestComment() {
		return commentsBestComment;
	}

	public void setCommentsBestComment(List commentsBestComment) {
		this.commentsBestComment = commentsBestComment;
	}

	
	public List<Integer> getBoardNumGroupCommentsList() {
		return boardNumGroupCommentsList;
	}

	public void setBoardNumGroupCommentsList(List<Integer> boardNumGroupCommentsList) {
		this.boardNumGroupCommentsList = boardNumGroupCommentsList;
	}

	public List getNameList() {
		return nameList;
	}

	public void setNameList(List nameList) {
		this.nameList = nameList;
	}

	public List getImgList() {
		return imgList;
	}

	public void setImgList(List imgList) {
		this.imgList = imgList;
	}

	public lineVO getLineClass() {
		return lineClass;
	}

	public void setLineClass(lineVO lineClass) {
		this.lineClass = lineClass;
	}

	
	
	
	
}

