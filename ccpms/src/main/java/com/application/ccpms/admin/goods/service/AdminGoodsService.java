package com.application.ccpms.admin.goods.service;

import java.util.List;

import com.application.ccpms.goods.dto.GoodsDTO;

public interface AdminGoodsService {

	public void addGoods(GoodsDTO goodsDTO) throws Exception;

	public List<GoodsDTO> getGoodsList() throws Exception;

	public void removeGoods(int goodsCd) throws Exception;

	public void modifyGoods(GoodsDTO goodsDTO) throws Exception;

	public void updateShowStatus() throws Exception;

}
