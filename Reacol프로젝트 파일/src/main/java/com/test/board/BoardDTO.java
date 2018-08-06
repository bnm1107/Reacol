package com.test.board;

import java.util.Date;

public class BoardDTO {
	private int no;
	private String title;
	private String id;
	private Date time;
	private int hits;
	private String context;
	
	public BoardDTO() {
		
	}
	public BoardDTO(int no, String title, String id, Date time, int hits,String context) {
		this.no = no;
		this.title = title;
		this.id = id;
		this.time = time;
		this.hits = hits;
		this.context = context;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public void prt() {
		System.out.println("no = "+this.no);
		System.out.println("title = "+this.title);
		System.out.println("id = "+this.id);
		System.out.println("time = "+this.time);
		System.out.println("hits = "+this.hits);
		System.out.println("context = "+this.context);
		
	}
}
