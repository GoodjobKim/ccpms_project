package com.application.ccpms.admin.member.service;

import java.util.List;

import com.application.ccpms.admin.member.dto.AdminDTO;
import com.application.ccpms.member.dto.MemberDTO;

public interface AdminMemberService {

	public boolean adminLogin(AdminDTO adminDTO) throws Exception;

	public List<MemberDTO> getMemberList() throws Exception;

}
