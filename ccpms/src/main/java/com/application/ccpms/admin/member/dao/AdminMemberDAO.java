package com.application.ccpms.admin.member.dao;

import java.util.List;

import com.application.ccpms.admin.member.dto.AdminDTO;
import com.application.ccpms.member.dto.MemberDTO;

public interface AdminMemberDAO {

	public AdminDTO selectAdminLogin(AdminDTO adminDTO) throws Exception;

	public List<MemberDTO> selectListMember() throws Exception;

}
