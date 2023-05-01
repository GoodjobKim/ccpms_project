package com.application.ccpms.admin.goods.dao;

import java.util.List;

import com.application.ccpms.goods.dto.GoodsDTO;

public interface AdminGoodsDAO {

	public void insertGoods(GoodsDTO goodsDTO) throws Exception;

	public List<GoodsDTO> selectListGoods() throws Exception;

	public void deleteGoods(int goodsCd) throws Exception;

	public void updateGoods(GoodsDTO goodsDTO) throws Exception;

	public void updateShowStatus(GoodsDTO goodsDTO) throws Exception;

}
