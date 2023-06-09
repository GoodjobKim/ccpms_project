package com.application.ccpms.common.dao;

import java.util.List;
import java.util.Map;

import com.application.ccpms.goods.dto.GoodsDTO;

public interface CommonDAO {

	public List<Map<String, Object>> selectListGoodsBestConsert() throws Exception;

	public List<Map<String, Object>> selectListGoodsNewConsert() throws Exception;

	public List<Map<String, Object>> selectListMusicalRanking() throws Exception;

	public List<Map<String, Object>> selectListTheaterRanking() throws Exception;


}
