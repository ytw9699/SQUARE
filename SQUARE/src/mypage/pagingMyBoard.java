package mypage;

public class pagingMyBoard {
	
	private int currentPage; //현재페이지 - s
	private int totalCount; //전체 [게시물] 수 - s
	private int totalPage; //전체 [페이지] 수  - s.cal
	private int blockCount; //한페이지의 [게시물] 수 - s
	private int blockPage; //한페이지의 [페이지] 수 - s
	private int startCount; //한페이지에서 보여줄 [게시글] 시작번호
	private int endCount; //한페이지에서 보여줄 [게시글] 끝 번호
	private int startPage; //시작[페이지]
	private int endPage; //끝[페이지]
	
	private StringBuffer pagingHtml;
	
	public pagingMyBoard(int currentPage, int totalCount, int blockCount, int blockPage) {
		this.blockCount = blockCount;
		this.blockPage = blockPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;

		//전체페이지개수
		totalPage = (int)Math.ceil((double)totalCount / blockCount);
		if(totalPage == 0) {
			totalPage = 1;
		}
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		//현재 페이지당 게시물 가져오는거
		startCount = (currentPage - 1) * blockCount;
		endCount = startCount + blockCount - 1;
		
		//시작페이지 ~ 마지막페이지 가져오는거
		startPage = (int)((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;
		
		if(endPage > totalPage)
			endPage = totalPage;
		
		//이전페이지 찍기
		pagingHtml = new StringBuffer();
		
		if(currentPage > blockPage) {
			pagingHtml.append("<a href='myPage_myBoardList.action?currentPage="+(startPage-1)+"'>");
			pagingHtml.append("[이전]</a>");
		}
		
		pagingHtml.append("&nbsp;|&nbsp;");
		
		//페이지번호들 찍기
		for(int i = startPage ; i <= endPage ; i++) {
			if(i > totalPage) break;
			
			if(i == currentPage) {
				pagingHtml.append("&nbsp;<b><font color='red'>"+i+"</font></b>");
			}else
				pagingHtml.append("&nbsp;<a href='myPage_myBoardList.action?currentPage="+i+"'>"+i+"</a>");
			
			
			pagingHtml.append("&nbsp;");
		}
		
		pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");
		
		//다음찍기
		if(totalPage - startPage >= blockPage) {
				pagingHtml.append("<a href='myPage_myBoardList.action?currentPage="+(endPage+1)+"'>[다음]</a>");
				
		}
		
	}
	
	public StringBuffer getPagingHtml() {
		return pagingHtml;
	}
	public void setPagingHtml(StringBuffer pagingHtml) {
		this.pagingHtml = pagingHtml;
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
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
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
	public int getStartCount() {
		return startCount;
	}
	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}
	public int getEndCount() {
		return endCount;
	}
	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	
	

}
