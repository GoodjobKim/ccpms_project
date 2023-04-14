package com.application.ccpms.contact.service;

import java.util.List;
import java.util.Map;

import com.application.ccpms.contact.dto.Contact_boardDTO;
import com.application.ccpms.contact.dto.Contact_replyDTO;

public interface ContactService {

	public int getAllBoardCnt(Map<String, String> searchCntMap) throws Exception;

	public List<Contact_boardDTO> getBoardList(Map<String, Object> searchMap) throws Exception;

	public void addBoard(Contact_boardDTO boardDTO) throws Exception;

	public Contact_boardDTO getBoardDetail(long boardId, boolean isIncreaseReadCnt) throws Exception;

	public boolean modifyBoard(Contact_boardDTO boardDTO) throws Exception;
	
	public boolean removeBoard(Contact_boardDTO boardDTO) throws Exception;
	
	
	public int getAllReplyCnt(long boardId) throws Exception;

	public List<Contact_replyDTO> getReplyList(long boardId) throws Exception;

	public void addReply(Contact_replyDTO replyDTO) throws Exception;

	public Contact_replyDTO getReplyDetail(long replyId) throws Exception;

	public boolean modifyReply(Contact_replyDTO replyDTO) throws Exception;

	public boolean removeReply(Contact_replyDTO replyDTO) throws Exception;



}
