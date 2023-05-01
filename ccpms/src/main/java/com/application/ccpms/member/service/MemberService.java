package com.application.ccpms.member.service;

import com.application.ccpms.member.dto.MemberDTO;

public interface MemberService {

	public String checkDuplicated(String memberId)throws Exception;

	public void addMember(MemberDTO memberDTO)throws Exception;

	public boolean login(MemberDTO memberDTO) throws Exception;

	public int getMyOrderCnt(String memberId) throws Exception;

	public int getMyCartCnt(String attribute) throws Exception;

	public String findId(MemberDTO memberDTO) throws Exception;

	public void resetPasswd(MemberDTO memberDTO) throws Exception;

}
