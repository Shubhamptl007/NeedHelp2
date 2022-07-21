package com.tech.blog.entities;

public class Comment {


	private int idcom;
	private String comment;
	private String Cname;
	private String Cemail;
	private int commentid;
	
	
	
	public Comment(int idcom, String comment, String cname, String cemail) {
		super();
		this.idcom = idcom;
		this.comment = comment;
		Cname = cname;
		Cemail = cemail;
	}

	public Comment(String comment, String cname, String cemail, int commentid) {
		super();
		this.comment = comment;
		Cname = cname;
		Cemail = cemail;
		this.commentid = commentid;
	}

	public Comment(int idcom, String comment, String cname, String cemail, int commentid) {
		super();
		this.idcom = idcom;
		this.comment = comment;
		Cname = cname;
		Cemail = cemail;
		this.commentid = commentid;
	}

	public Comment() {
		super();
	}

	public int getIdcom() {
		return idcom;
	}

	public void setIdcom(int idcom) {
		this.idcom = idcom;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getCname() {
		return Cname;
	}

	public void setCname(String cname) {
		Cname = cname;
	}

	public String getCemail() {
		return Cemail;
	}

	public void setCemail(String cemail) {
		Cemail = cemail;
	}

	public int getCommentid() {
		return commentid;
	}

	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}

	@Override
	public String toString() {
		return "Comment [idcom=" + idcom + ", comment=" + comment + ", Cname=" + Cname + ", Cemail=" + Cemail
				+ ", commentid=" + commentid + "]";
	}
	
	
	
	
}
