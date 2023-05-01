package com.application.ccpms.goods.service;

import java.util.List;
import java.util.Map;

import com.application.ccpms.goods.dto.GoodsDTO;

public interface GoodsService {

	public GoodsDTO getGoodsDetail(int goodsCd) throws Exception;

	public List<GoodsDTO> getRelatedGoodsList(GoodsDTO goodsDTO) throws Exception;

	public List<GoodsDTO> getCategoryGoods(GoodsDTO goodsDTO) throws Exception;

	public List<GoodsDTO> getSearchGoodsList(Map<String, Object> searchMap) throws Exception;

}
