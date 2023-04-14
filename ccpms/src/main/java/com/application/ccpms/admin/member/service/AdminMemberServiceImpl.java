package com.application.ccpms.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccpms.admin.member.dao.AdminMemberDAO;
import com.application.ccpms.admin.member.dto.AdminDTO;
import com.application.ccpms.member.dto.MemberDTO;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {

	@Autowired
	private AdminMemberDAO adminMemberDAO;

	@Override
	public boolean adminLogin(AdminDTO adminDTO) throws Exception {
		if(adminMemberDAO.selectAdminLogin(adminDTO) != null) {
			return true;
		}
		return false;
	}

	@Override
	public List<MemberDTO> getMemberList() throws Exception {
		return adminMemberDAO.selectListMember();
	}
}
