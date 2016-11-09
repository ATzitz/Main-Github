package org.afdemp.bootcamp.domain;

public class QueryCat {
	
	
	
	private String bookimage;
	private String booktitle;
	private String bookcategory;
	private String authorsurname;
	private String authorname;
	private String averagerating;
	private String year;
	private String desc;
	private String bookid;
	
	
	public QueryCat(){};
	public QueryCat(String category){
		this.bookcategory=category;
	}
	
	public QueryCat(String bookimage, String booktitle, String bookcategory, String authorsurname, String authorname, String averagerating, String year,String desc,String bookid){
	
		this.bookimage=bookimage;
		this.booktitle=booktitle;
		this.bookcategory=bookcategory;
		this.authorsurname=authorsurname;
		this.authorname=authorname;
		this.averagerating=averagerating;
		this.year=year;
		this.desc=desc;
		this.bookid=bookid;
		}
	
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	public String getBookimage() {
		return bookimage;
	}
	public void setBookimage(String bookimage) {
		this.bookimage = bookimage;
	}
	public String getBooktitle() {
		return booktitle;
	}
	public void setBooktitle(String booktitle) {
		this.booktitle = booktitle;
	}
	public String getBookcategory() {
		return bookcategory;
	}
	public void setBookcategory(String bookcategory) {
		this.bookcategory = bookcategory;
	}
	public String getAuthorsurname() {
		return authorsurname;
	}
	public void setAuthorsurname(String authorsurname) {
		this.authorsurname = authorsurname;
	}
	public String getAuthorname() {
		return authorname;
	}
	public void setAuthorname(String authorname) {
		this.authorname = authorname;
	}
	public String getAveragerating() {
		return averagerating;
	}
	public void setAveragerating(String averagerating) {
		this.averagerating = averagerating;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	}