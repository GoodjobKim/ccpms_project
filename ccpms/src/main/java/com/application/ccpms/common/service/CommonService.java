package com.application.ccpms.common.service;

import java.util.List;
import java.util.Map;

import com.application.ccpms.goods.dto.GoodsDTO;

public interface CommonService {

	public List<Map<String,Object>> getBestConsert() throws Exception;

	public List<Map<String,Object>> getNewConsert() throws Exception;

	public List<Map<String, Object>> getBestConsertRanking() throws Exception;

	public List<Map<String, Object>> getBestTheaterRanking() throws Exception;


}
