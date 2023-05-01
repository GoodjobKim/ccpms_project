package com.application.ccpms.member.dao;

import com.application.ccpms.member.dto.MemberDTO;

public interface MemberDAO {

	public String selectDuplicatedId(String memberId)throws Exception;

	public void insertMember(MemberDTO memberDTO)throws Exception;

	public MemberDTO selectLogin(MemberDTO memberDTO) throws Exception;

	public int selectMyOrderCnt(String memberId) throws Exception;

	public int selectMyCartCnt(String memberId) throws Exception;

	public MemberDTO selectId(MemberDTO memberDTO) throws Exception;

	public void resetPasswd(MemberDTO memberDTO) throws Exception;

}
