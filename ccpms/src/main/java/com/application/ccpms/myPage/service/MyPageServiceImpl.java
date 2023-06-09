package com.application.ccpms.myPage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.application.ccpms.member.dao.MemberDAO;
import com.application.ccpms.member.dto.MemberDTO;
import com.application.ccpms.myPage.dao.MyPageDAO;
import com.application.ccpms.myPage.dto.CartDTO;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDAO myPageDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Override
	public List<Map<String, Object>> getMyOrderList(String memberId) throws Exception {
		return myPageDAO.selectListMyOrder(memberId);
	}

	@Override
	public void removeOrder(int[] deleteOrderCheckList) throws Exception{
		myPageDAO.deleteMyOrder(deleteOrderCheckList);
	}

	@Override
	public List<Map<String, Object>> getMyCartList(String memberId) throws Exception {
		return myPageDAO.selectListMyCart(memberId);
	}

	@Override
	public int countCartList(String memberId) throws Exception {
		return myPageDAO.countMyCart(memberId);
	}

	@Override
	public boolean checkDupleCart(CartDTO cartDTO) throws Exception {
		if(myPageDAO.selectDupleCart(cartDTO) == null) return false;
		else	return true;
	}

	@Override
	public void addCart(CartDTO cartDTO) throws Exception {
		myPageDAO.insertCart(cartDTO);
	}

	@Override
	public void removeCart(int[] deleteCartCdList) throws Exception {
		myPageDAO.deleteCart(deleteCartCdList);
	}

	@Override
	public MemberDTO getMyInfo(String memberId) throws Exception {
		return myPageDAO.selectOneMyInfo(memberId);
	}

	@Override
	public void modifyInfo(MemberDTO memberDTO) throws Exception {
		memberDTO.setPasswd(bCryptPasswordEncoder.encode(memberDTO.getPasswd()));
		if(memberDTO.getSmsstsYn() == null)		memberDTO.setSmsstsYn("N");
		if(memberDTO.getEmailstsYn() == null)	memberDTO.setEmailstsYn("N");
		myPageDAO.updateMyInfo(memberDTO);
	}

	@Override
	public void removeMember(String memberId) throws Exception {
		myPageDAO.deleteMember(memberId);
		myPageDAO.deleteCartListByRemoveMember(memberId);
		myPageDAO.deleteOrderListByRemoveMember(memberId);
	}
	
}
