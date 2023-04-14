package com.application.ccpms.admin.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccpms.admin.member.dto.AdminDTO;
import com.application.ccpms.member.dto.MemberDTO;

@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public AdminDTO selectAdminLogin(AdminDTO adminDTO) throws Exception {
		return sqlSession.selectOne("adminMember.selectAdminLogin", adminDTO);
	}

	@Override
	public List<MemberDTO> selectListMember() throws Exception {
		return sqlSession.selectList("adminMember.selectListMember");
	}
}
