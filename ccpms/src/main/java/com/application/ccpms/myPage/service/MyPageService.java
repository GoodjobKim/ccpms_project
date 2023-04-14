package com.application.ccpms.myPage.service;

import java.util.List;
import java.util.Map;

import com.application.ccpms.member.dto.MemberDTO;
import com.application.ccpms.myPage.dto.CartDTO;

public interface MyPageService {

	public List<Map<String, Object>> getMyOrderList(String memberId) throws Exception;

	public void removeOrder(long orderCheck) throws Exception;

	public List<Map<String, Object>> getMyCartList(String memberId) throws Exception;

	public int countCartList(String memberId) throws Exception;

	public boolean checkDupleCart(CartDTO cartDTO) throws Exception;

	public void addCart(CartDTO cartDTO) throws Exception;

	public void removeCart(int[] deleteCartCdList) throws Exception;

	public MemberDTO getMyInfo(String memberId) throws Exception;

	public void modifyInfo(MemberDTO memberDTO) throws Exception;

	public void removeMember(String memberId) throws Exception;

}
