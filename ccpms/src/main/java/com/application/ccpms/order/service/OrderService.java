package com.application.ccpms.order.service;

import java.util.List;
import java.util.Map;

import com.application.ccpms.goods.dto.GoodsDTO;
import com.application.ccpms.member.dto.MemberDTO;
import com.application.ccpms.order.dto.OrderDTO;

public interface OrderService {

	public MemberDTO getOrdererDetail(String memberId) throws Exception;

	public GoodsDTO getGoodsDetail(int goodsCd) throws Exception;

	public void addOrder(OrderDTO orderDTO, int point) throws Exception;

	public List<GoodsDTO> getGoodsListByCart(int[] goodsCdList) throws Exception;

	public void addOrderByCart(Map<String, String> orderListMap) throws Exception;
	
	
}
