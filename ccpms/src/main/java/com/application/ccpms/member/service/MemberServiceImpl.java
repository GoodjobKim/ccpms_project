package com.application.ccpms.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.application.ccpms.member.dao.MemberDAO;
import com.application.ccpms.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public void addMember(MemberDTO memberDTO) throws Exception {
		memberDTO.setPasswd(bCryptPasswordEncoder.encode(memberDTO.getPasswd()));
		if(memberDTO.getSmsstsYn() == null)		memberDTO.setSmsstsYn("N");
		if(memberDTO.getEmailstsYn() == null)	memberDTO.setEmailstsYn("N");
		memberDAO.insertMember(memberDTO);
		
	}

	@Override
	public String checkDuplicated(String memberId) throws Exception {
		if(memberDAO.selectDuplicatedId(memberId) == null) {
			return "duplicate";
		}
		else {
			return "notDuplicate";
		}
	}

	@Override
	public boolean login(MemberDTO memberDTO) throws Exception {
		MemberDTO dbMember = memberDAO.selectLogin(memberDTO);
		if(dbMember != null) {
			if(bCryptPasswordEncoder.matches(memberDTO.getPasswd(), dbMember.getPasswd())) {
				return true;
			}
		}
		return false;
	}

	@Override
	public int getMyOrderCnt(String memberId) throws Exception {
		return memberDAO.selectMyOrderCnt(memberId);
	}

	@Override
	public int getMyCartCnt(String memberId) throws Exception {
		return memberDAO.selectMyCartCnt(memberId);
	}

	@Override
	public String findId(MemberDTO memberDTO) throws Exception {
		MemberDTO dbMember = memberDAO.selectId(memberDTO);
		if(dbMember != null) {
			return dbMember.getMemberId();
		}
		return "";
		
	}

	@Override
	public void resetPasswd(MemberDTO memberDTO) throws Exception{
		memberDTO.setPasswd(bCryptPasswordEncoder.encode(memberDTO.getPasswd()));
		memberDAO.resetPasswd(memberDTO);
	}
	
}
