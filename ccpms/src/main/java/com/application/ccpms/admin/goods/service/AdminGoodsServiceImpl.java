package com.application.ccpms.admin.goods.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.application.ccpms.admin.goods.dao.AdminGoodsDAO;
import com.application.ccpms.goods.dto.GoodsDTO;

@Service
public class AdminGoodsServiceImpl implements AdminGoodsService {
	@Autowired
	private AdminGoodsDAO adminGoodsDAO;

	@Override
	public void addGoods(GoodsDTO goodsDTO) throws Exception {
		adminGoodsDAO.insertGoods(goodsDTO);
	}

	@Override
	public List<GoodsDTO> getGoodsList() throws Exception {
		return adminGoodsDAO.selectListGoods();
	}

	@Override
	public void removeGoods(int goodsCd) throws Exception {
		adminGoodsDAO.deleteGoods(goodsCd);
	}

	@Override
	public void modifyGoods(GoodsDTO goodsDTO) throws Exception {
		adminGoodsDAO.updateGoods(goodsDTO);
	}
	
	@Override
	@Scheduled(cron = "0 0 0 * * *")
	public void updateShowStatus() throws Exception{
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		List<GoodsDTO> showList = adminGoodsDAO.selectListGoods();
        for (GoodsDTO goodsDTO : showList) {
        	Date endDt = format.parse(goodsDTO.getEndDt());
            if (("ing".equals(goodsDTO.getPart()) || "tobe".equals(goodsDTO.getPart())) && endDt.before(new Date())) {
            	
                goodsDTO.setPart("signoff");
                adminGoodsDAO.updateShowStatus(goodsDTO);
            }

        }
	}	
	
	
}
