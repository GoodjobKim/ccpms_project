package com.application.ccpms.contact.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class Contact_boardDTO {
	private long boardId;
	private String memberId;
	private String subject;
	private String content;
	private String passwd;
	private int readCnt;
	private Date enrollDt;
	
	public long getBoardId() {
		return boardId;
	}
	public void setBoardId(long boardId) {
		this.boardId = boardId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	@Override
	public String toString() {
		return "Contact_BoardDTO [boardId=" + boardId + ", memberId=" + memberId + ", subject=" + subject + ", content="
				+ content + ", passwd=" + passwd + ", readCnt=" + readCnt + ", enrollDt=" + enrollDt + "]";
	}
	
	
	
}
