package com.application.ccpms.contact.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.application.ccpms.contact.dao.ContactDAO;
import com.application.ccpms.contact.dto.Contact_boardDTO;
import com.application.ccpms.contact.dto.Contact_replyDTO;

@Service
public class ContactServiceImpl implements ContactService {

	@Autowired
	private ContactDAO contactDAO;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public int getAllBoardCnt(Map<String, String> searchCntMap) throws Exception {
		return contactDAO.selectOneAllBoardCnt(searchCntMap);
	}

	@Override
	public List<Contact_boardDTO> getBoardList(Map<String, Object> searchMap) throws Exception {
		return contactDAO.selectListBoard(searchMap);
	}

	@Override
	public void addBoard(Contact_boardDTO boardDTO) throws Exception {
		boardDTO.setPasswd(bCryptPasswordEncoder.encode(boardDTO.getPasswd()));
		contactDAO.insertBoard(boardDTO);
	}
	
	@Override
	@Transactional
	public Contact_boardDTO getBoardDetail(long boardId, boolean isIncreaseReadCnt) throws Exception {
		if(isIncreaseReadCnt) {
			contactDAO.updateReadCnt(boardId);
		}
		return contactDAO.selectOneBoardDetail(boardId);
	}

	@Override
	public boolean modifyBoard(Contact_boardDTO boardDTO) throws Exception {
		boolean isUpdate = false;
		if(bCryptPasswordEncoder.matches(boardDTO.getPasswd(), contactDAO.selectOneBoardCheckUser(boardDTO.getBoardId()))) {
			isUpdate = true;
			contactDAO.updateBoard(boardDTO);
		}
		return isUpdate;
	}

	@Override
	public boolean removeBoard(Contact_boardDTO boardDTO) throws Exception {
		boolean isDelete = false;
		if(bCryptPasswordEncoder.matches(boardDTO.getPasswd(), contactDAO.selectOneBoardCheckUser(boardDTO.getBoardId()))) {
			isDelete = true;
			contactDAO.deleteBoard(boardDTO);
		}
		return isDelete;
	}
	
	
	@Override
	public int getAllReplyCnt(long boardId) throws Exception {
		return contactDAO.selectOneAllReplyCnt(boardId);
	}

	@Override
	public List<Contact_replyDTO> getReplyList(long boardId) throws Exception {
		return contactDAO.selectListReply(boardId);
	}

	@Override
	public void addReply(Contact_replyDTO replyDTO) throws Exception {
		replyDTO.setPasswd(bCryptPasswordEncoder.encode(replyDTO.getPasswd()));
		contactDAO.insertReply(replyDTO);
	}

	@Override
	public Contact_replyDTO getReplyDetail(long replyId) throws Exception {
		return contactDAO.selectOneReply(replyId);
	}

	@Override
	public boolean modifyReply(Contact_replyDTO replyDTO) throws Exception {
		boolean isUpdate = false;
		if(bCryptPasswordEncoder.matches(replyDTO.getPasswd(), contactDAO.selectOneReplyCheckUser(replyDTO.getReplyId()))) {
			isUpdate = true;
			contactDAO.updateReply(replyDTO);
		}
		return isUpdate;
	}

	@Override
	public boolean removeReply(Contact_replyDTO replyDTO) throws Exception {
		boolean isDelete = false;
		if(bCryptPasswordEncoder.matches(replyDTO.getPasswd(), contactDAO.selectOneReplyCheckUser(replyDTO.getReplyId()))) {
			isDelete = true;
			contactDAO.deleteReply(replyDTO);
		}
		return isDelete;
	}




}
