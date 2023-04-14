package com.application.ccpms.common.service;

import java.util.List;
import java.util.Map;

public interface CommonService {

	public List<Map<String,Object>> getBestConsert() throws Exception;

	public List<Map<String,Object>> getNewConsert() throws Exception;

}
