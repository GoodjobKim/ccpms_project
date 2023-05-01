package com.application.ccpms.myPage.dao;

import java.util.List;
import java.util.Map;

import com.application.ccpms.member.dto.MemberDTO;
import com.application.ccpms.myPage.dto.CartDTO;

public interface MyPageDAO {

	public List<Map<String, Object>> selectListMyOrder(String memberId) throws Exception;

	public void deleteMyOrder(int[] deleteOrderCheckList) throws Exception;

	public List<Map<String, Object>> selectListMyCart(String memberId) throws Exception;

	public int countMyCart(String memberId) throws Exception;

	public CartDTO selectDupleCart(CartDTO cartDTO) throws Exception;

	public void insertCart(CartDTO cartDTO) throws Exception;

	public void deleteCart(int[] deleteCartCdList) throws Exception;

	public MemberDTO selectOneMyInfo(String memberId) throws Exception;

	public void updateMyInfo(MemberDTO memberDTO) throws Exception;

	public void deleteMember(String memberId) throws Exception;

	public void deleteCartListByRemoveMember(String memberId) throws Exception;

	public void deleteOrderListByRemoveMember(String memberId) throws Exception;

	

}
