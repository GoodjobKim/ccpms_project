package com.application.ccpms.common.dao;

import java.util.List;
import java.util.Map;

public interface CommonDAO {

	public List<Map<String, Object>> selectListGoodsBestConsert() throws Exception;

	public List<Map<String, Object>> selectListGoodsNewConsert() throws Exception;

}
