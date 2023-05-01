package com.application.ccpms.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccpms.goods.dao.GoodsDAO;
import com.application.ccpms.goods.dto.GoodsDTO;

@Service
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;

	@Override
	public GoodsDTO getGoodsDetail(int goodsCd) throws Exception {
		return goodsDAO.selectOneGoodsDetail(goodsCd);
	}

	@Override
	public List<GoodsDTO> getRelatedGoodsList(GoodsDTO goodsDTO) throws Exception {
		return goodsDAO.selectRelatedGoodsList(goodsDTO);
	}

	@Override
	public List<GoodsDTO> getCategoryGoods(GoodsDTO goodsDTO) throws Exception {
		return goodsDAO.selectListCategoryGoods(goodsDTO);
	}

	@Override
	public List<GoodsDTO> getSearchGoodsList(Map<String, Object> searchMap) throws Exception {
		return goodsDAO.selectListSearchGoods(searchMap);
	}
}
