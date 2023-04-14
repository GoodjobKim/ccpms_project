package com.application.ccpms.goods.dao;

import java.util.List;
import java.util.Map;

import com.application.ccpms.goods.dto.GoodsDTO;

public interface GoodsDAO {

	public List<GoodsDTO> selectListGoods(GoodsDTO goodsDTO) throws Exception;

	public List<GoodsDTO> selectListSearchGoods(Map<String, Object> searchMap) throws Exception;

	public GoodsDTO selectOneGoodsDetail(int goodsCd) throws Exception;

	public List<GoodsDTO> selectRelatedGoodsList(GoodsDTO goodsDTO) throws Exception;

}
