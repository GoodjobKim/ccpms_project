package com.application.ccpms.contact.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccpms.contact.dto.Contact_boardDTO;
import com.application.ccpms.contact.dto.Contact_replyDTO;

@Repository
public class ContactDAOImpl implements ContactDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectOneAllBoardCnt(Map<String, String> searchCntMap) throws Exception {
		return sqlSession.selectOne("contactMapper.selectOneAllBoardCnt", searchCntMap);
	}

	@Override
	public List<Contact_boardDTO> selectListBoard(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("contactMapper.selectListBoard", searchMap);
	}

	@Override
	public void insertBoard(Contact_boardDTO boardDTO) throws Exception {
		sqlSession.insert("contactMapper.insertBoard", boardDTO);
	}

	@Override
	public Contact_boardDTO selectOneBoardDetail(long boardId) throws Exception {
		return sqlSession.selectOne("contactMapper.BoardDetail", boardId);
	}

	@Override
	public void updateReadCnt(long boardId) throws Exception {
		sqlSession.update("contactMapper.updateReadCnt", boardId);
	}

	@Override
	public String selectOneBoardCheckUser(long boardId) throws Exception {
		return sqlSession.selectOne("contactMapper.boardCheckUser", boardId);
	}
	
	@Override
	public void updateBoard(Contact_boardDTO boardDTO) throws Exception {
		sqlSession.update("contactMapper.updateBoard", boardDTO);
	}
	
	@Override
	public void deleteBoard(Contact_boardDTO boardDTO) throws Exception {
		sqlSession.delete("contactMapper.deleteBoard", boardDTO);
	}
	
	@Override
	public void adminDeleteBoard(Contact_boardDTO boardDTO) throws Exception {
		sqlSession.delete("contactMapper.adminDeleteBoard", boardDTO);
	}
	
	
	@Override
	public int selectOneAllReplyCnt(long boardId) throws Exception {
		return sqlSession.selectOne("contactMapper.selectOneAllReplyCnt", boardId);
	}

	@Override
	public List<Contact_replyDTO> selectListReply(long boardId) throws Exception {
		return sqlSession.selectList("contactMapper.selectListReply", boardId);
	}

	@Override
	public void insertReply(Contact_replyDTO replyDTO) throws Exception {
		sqlSession.insert("contactMapper.insertReply", replyDTO);
	}

	@Override
	public Contact_replyDTO selectOneReply(long replyId) throws Exception {
		return sqlSession.selectOne("contactMapper.selectOneReply", replyId);
	}

	@Override
	public String selectOneReplyCheckUser(long replyId) throws Exception {
		return sqlSession.selectOne("contactMapper.replyCheckUser", replyId);
	}

	@Override
	public void updateReply(Contact_replyDTO replyDTO) throws Exception {
		sqlSession.update("contactMapper.updateReply", replyDTO);
	}

	@Override
	public void deleteReply(Contact_replyDTO replyDTO) throws Exception {
		sqlSession.delete("contactMapper.removeReply", replyDTO);
	}

}
