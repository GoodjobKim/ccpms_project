package com.application.ccpms.contact.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class Contact_replyDTO {
	
	private long replyId;
	private String adminId;
	private String memberId;
	private String content;
	private String passwd;
	private Date enrollDt;
	private long boardId;
	public long getReplyId() {
		return replyId;
	}
	public void setReplyId(long replyId) {
		this.replyId = replyId;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	public long getBoardId() {
		return boardId;
	}
	public void setBoardId(long boardId) {
		this.boardId = boardId;
	}
	@Override
	public String toString() {
		return "Contact_ReplyDTO [replyId=" + replyId + ", adminId=" + adminId + ", memberId=" + memberId + ", content="
				+ content + ", passwd=" + passwd + ", enrollDt=" + enrollDt + ", boardId=" + boardId + "]";
	}
	
}
