package com.theme.entity;

public class Paging {
	private int articleCountPerPage;
	private int totalAticleCount;
	private int totalPagingCount;
	private int start;
	private int end;
	
	public Paging() {
		super();
	}

	public Paging(int articleCountPerPage, int totalAticleCount, int totalPagingCount, int start, int end) {
		super();
		this.articleCountPerPage = articleCountPerPage;
		this.totalAticleCount = totalAticleCount;
		this.totalPagingCount = totalPagingCount;
		this.start = start;
		this.end = end;
	}
	
	public Paging(int page, int totalAticleCount, int aticleCountPerPage) {
		this.totalAticleCount = totalAticleCount;
		this.articleCountPerPage = aticleCountPerPage;
		
		totalPagingCount = totalAticleCount/aticleCountPerPage;
		if (totalAticleCount%aticleCountPerPage!=0) {
			totalPagingCount+=1;
		}
		if(page > 2 && page < totalPagingCount-1) {;
			this.start = page - 2;
			this.end = page + 2;
		}else if(page <= 2) {
			this.start = 1;
			this.end = totalPagingCount >= 5 ? 5 : totalPagingCount;
		}else if(page >= totalPagingCount - 1) {
			this.start = totalPagingCount-4;
			this.end = totalPagingCount;
		}
	}

	public int getArticleCountPerPage() {
		return articleCountPerPage;
	}

	public void setArticleCountPerPage(int articleCountPerPage) {
		this.articleCountPerPage = articleCountPerPage;
	}

	public int getTotalAticleCount() {
		return totalAticleCount;
	}

	public void setTotalAticleCount(int totalAticleCount) {
		this.totalAticleCount = totalAticleCount;
	}

	public int getTotalPagingCount() {
		return totalPagingCount;
	}

	public void setTotalPagingCount(int totalPagingCount) {
		this.totalPagingCount = totalPagingCount;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "Paging [articleCountPerPage=" + articleCountPerPage + ", totalAticleCount=" + totalAticleCount
				+ ", totalPagingCount=" + totalPagingCount + ", start=" + start + ", end=" + end + "]";
	}
	

}
