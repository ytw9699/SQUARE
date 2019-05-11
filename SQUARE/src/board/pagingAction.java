package board;

public class pagingAction {
	private int currentPage; //현재 페이지
	private int totalCount; //전체 게시물 수
	private int totalPage; //전체 페이지수
	private int blockCount; // 한페이지의 게시물 수 10 
	private int blockPage; //한페이지의 페이지 수 5
	private int startCount; //한페이지에서 보여줄 게시글 시작번호
	private int endCount; //한페이지에서 보여줄 게시글 끝 번호
	private int startPage; //시작페이지
	private int endPage; //끝 페이지
	private int line_num; //라인넘버
	
	private StringBuffer pagingHtml;
							//2				1              12           10             5            
	public pagingAction(int line_num,int currentPage, int totalCount, int blockCount, int blockPage, int searchN, String searchKeyword) {

		this.line_num = line_num;
		this.blockCount = blockCount;
		this.blockPage = blockPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		
		//전체페이지개수
		totalPage = (int)Math.ceil((double)totalCount / blockCount);
		if(totalPage == 0) {
			totalPage = 1;
		}
		//12
		if(currentPage> totalPage)
				currentPage= totalPage;
		
		startCount = (currentPage - 1) * blockCount;
		endCount = startCount + blockCount-1;
		
		//현재 페이지당 게시물 가져옴.
		startPage = (int)((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;
		
		
		//이전 페이지 찍기
		pagingHtml = new StringBuffer();
		
		if(currentPage > blockPage) {
			if(searchN == 44) { //검색 안했을경우
				pagingHtml.append("<a href=listAction.action?currentPage="+(startPage-1)+">");
				pagingHtml.append("[이전]</a>");
			}else { //검색 
				pagingHtml.append("<a href=listAction.action?currentPage="+(startPage-1)+"&searchN="+searchN+"&searchKeyword="+searchKeyword+">");
				pagingHtml.append("[이전]</a>");
			}
		}
		
		
		pagingHtml.append("&nbsp;|&nbsp;");
		
		
		for(int i=startPage; i<=endPage; i++ ) {
			if(i> totalPage) break;
			//만약에 전체 페이지 수 보다 i가 크면 안되지
			
			
			if(i == currentPage) {
				pagingHtml.append("&nbsp;<b><font color='red'>"+i+"</font>");
			}else {
				pagingHtml.append("&nbsp;<a href='listAction.action?currentPage="+i+"&line_num="+line_num+"'>"+i+"</a>");
				
			}
			pagingHtml.append("&nbsp;");
		}
		pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");
		
		//다음 찍기
		if(totalPage - startPage >= blockPage) {
			if(searchN == 44)
				pagingHtml.append("<a href=listAction.action?currentPage="+(endPage+1)+"&line_num="+line_num+"'>[다음]</a>");
			else
				pagingHtml.append("<a href=listAction.action?currentPage="+(endPage+1) +"searchN="+searchN+"&searchKeyword="+searchKeyword+"&line_num="+line_num+"'>[다음]</a>");
		}
		
		
		
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

	public int getLine_num() {
		return line_num;
	}

	public void setLine_num(int line_num) {
		this.line_num = line_num;
	}

	public StringBuffer getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(StringBuffer pagingHtml) {
		this.pagingHtml = pagingHtml;
	}
		

		
}
