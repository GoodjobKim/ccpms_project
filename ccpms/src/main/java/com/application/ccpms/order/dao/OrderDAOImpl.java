package com.application.ccpms.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.ccpms.goods.dto.GoodsDTO;
import com.application.ccpms.member.dto.MemberDTO;
import com.application.ccpms.order.dto.OrderDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO selectOneOrder(String memberId) {
		return sqlSession.selectOne("order.selectOneOrder", memberId);
	}

	@Override
	public GoodsDTO selectOneCartGoods(int goodsCd) throws Exception {
		return sqlSession.selectOne("order.selectOneCartGoods", goodsCd);
	}

	@Override
	public void insertOrder(OrderDTO orderDTO) throws Exception {
		sqlSession.insert("order.insertOrder", orderDTO);
	}

	@Override
	public void updateGoodsStock(Map<String, Object> orderMap) throws Exception {
		sqlSession.update("order.updateGoodsStock", orderMap);
	}

	@Override
	public void updateMemberPoint(Map<String, Object> orderMap) throws Exception {
		sqlSession.update("order.updateMemberPoint", orderMap);
	}

	@Override
	public List<GoodsDTO> selectListCartGoods(int[] goodsCdList) throws Exception {
		return sqlSession.selectList("order.selectListCartGoods", goodsCdList);
	}

	@Override
	public void updateMemberPointByCart(Map<String, Object> memberMap) throws Exception {
		sqlSession.update("order.updateMemberPointByCart", memberMap);
	}

	@Override
	public void updateGoodsStockCntByCart(List<Map<String, Integer>> goodsMapList) throws Exception {
		sqlSession.update("order.updateGoodsStockCntByCart", goodsMapList);
	}

	@Override
	public void insertOrderByCart(List<OrderDTO> orderList) throws Exception {
		sqlSession.insert("order.insertOrderByCart", orderList);
	}

	@Override
	public void deleteCartByOrder(int[] cartCdList) throws Exception {
		sqlSession.insert("order.deleteCartByOrder", cartCdList);
	}
}
