package com.application.ccpms.myPage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccpms.member.dto.MemberDTO;
import com.application.ccpms.myPage.dto.CartDTO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map<String, Object>> selectListMyOrder(String memberId) throws Exception{
		return sqlSession.selectList("myPageMapper.selectListMyOrder", memberId);
	}

	@Override
	public void deleteMyOrder(long orderCheck) throws Exception {
		sqlSession.delete("myPageMapper.deleteMyOrder", orderCheck);
	}

	@Override
	public List<Map<String, Object>> selectListMyCart(String memberId) throws Exception {
		return sqlSession.selectList("myPageMapper.selectListMyCart", memberId);
	}

	@Override
	public int countMyCart(String memberId) throws Exception {
		return sqlSession.selectOne("myPageMapper.selectOneMyCart", memberId);
	}

	@Override
	public CartDTO selectDupleCart(CartDTO cartDTO) throws Exception {
		return sqlSession.selectOne("myPageMapper.selectDupleCart", cartDTO);
	}

	@Override
	public void insertCart(CartDTO cartDTO) throws Exception {
		sqlSession.insert("myPageMapper.insertCart", cartDTO);
	}

	@Override
	public void deleteCart(int[] deleteCartCdList) throws Exception {
		sqlSession.delete("myPageMapper.deleteCart", deleteCartCdList);
	}

	@Override
	public MemberDTO selectOneMyInfo(String memberId) throws Exception {
		return sqlSession.selectOne("myPageMapper.selectOneMyInfo", memberId);
	}

	@Override
	public void updateMyInfo(MemberDTO memberDTO) throws Exception {
		sqlSession.update("myPageMapper.updateMyInfo", memberDTO);
	}

	@Override
	public void deleteMember(String memberId) throws Exception {
		sqlSession.delete("myPageMapper.deleteMember", memberId);
	}

	@Override
	public void deleteCartListByRemoveMember(String memberId) throws Exception {
		sqlSession.delete("myPageMapper.deleteCartList", memberId);
	}

	@Override
	public void deleteOrderListByRemoveMember(String memberId) throws Exception {
		sqlSession.delete("myPageMapper.deleteOrderList", memberId);
	}
	
}
