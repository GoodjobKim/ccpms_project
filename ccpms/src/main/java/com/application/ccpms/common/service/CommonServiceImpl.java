package com.application.ccpms.common.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccpms.common.dao.CommonDAO;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	private CommonDAO commonDAO;

	@Override
	public List<Map<String, Object>> getBestConsert() throws Exception {
		return commonDAO.selectListGoodsBestConsert();
	}

	@Override
	public List<Map<String, Object>> getNewConsert() throws Exception {
		return commonDAO.selectListGoodsNewConsert();
	}
}
