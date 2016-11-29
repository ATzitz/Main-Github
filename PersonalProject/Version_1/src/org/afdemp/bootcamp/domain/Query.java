package org.afdemp.bootcamp.domain;


public class Query {
	
	protected String keyword;
	protected String searchby;

	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearchby() {
		return searchby;
	}

	public void setSearchby(String searchby) {
		this.searchby = searchby;
	}

	public Query (){}
	
	public Query(String searchby, String keyword) {

		this.searchby = searchby;
		this.keyword = keyword;

	}
}