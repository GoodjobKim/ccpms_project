package com.application.ccpms.contact.dao;

import java.util.List;
import java.util.Map;

import com.application.ccpms.contact.dto.Contact_boardDTO;
import com.application.ccpms.contact.dto.Contact_replyDTO;

public interface ContactDAO {

	public int selectOneAllBoardCnt(Map<String, String> searchCntMap) throws Exception;

	public List<Contact_boardDTO> selectListBoard(Map<String, Object> searchMap) throws Exception;

	public void insertBoard(Contact_boardDTO boardDTO) throws Exception;

	public Contact_boardDTO selectOneBoardDetail(long boardId) throws Exception;

	public void updateReadCnt(long boardId) throws Exception;
	
	public String selectOneBoardCheckUser(long boardId) throws Exception;
	
	public void updateBoard(Contact_boardDTO boardDTO) throws Exception;
	
	public void deleteBoard(Contact_boardDTO boardDTO) throws Exception;
	
	public void adminDeleteBoard(Contact_boardDTO boardDTO) throws Exception;

	
	public int selectOneAllReplyCnt(long boardId) throws Exception;

	public List<Contact_replyDTO> selectListReply(long boardId) throws Exception;

	public void insertReply(Contact_replyDTO replyDTO) throws Exception;

	public Contact_replyDTO selectOneReply(long replyId) throws Exception;

	public String selectOneReplyCheckUser(long replyId) throws Exception;

	public void updateReply(Contact_replyDTO replyDTO) throws Exception;

	public void deleteReply(Contact_replyDTO replyDTO) throws Exception;

	


}
