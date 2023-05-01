package com.application.ccpms.admin.goods.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.application.ccpms.admin.goods.service.AdminGoodsService;
import com.application.ccpms.goods.dto.GoodsDTO;
import com.application.ccpms.goods.service.GoodsService;

@Controller
@RequestMapping("/admin/goods")
public class AdminGoodsController {
	@Autowired
	private AdminGoodsService adminGoodsService;
	
	@Autowired
	private GoodsService goodsService;
	
//	private final String GOODS_IMAGE_REPO_PATH = "/Users/worish/Documents/file_repo/";
	
	//aws에 배포할떄 변경
	private final String GOODS_IMAGE_REPO_PATH = "/var/lib/tomcat9/file_repository/";      
	
	@GetMapping("/adminGoodsList")
	public ModelAndView adminGoodsList() throws Exception{
		ModelAndView mv = new ModelAndView("/admin/goods/adminGoodsList");
		
		mv.addObject("goodsList", adminGoodsService.getGoodsList());
		
		return mv;
	}
	
	@GetMapping("/adminGoodsAdd")
	public ModelAndView adminGoodsAdd () throws Exception {
		return new ModelAndView("/admin/goods/adminGoodsAdd");
	}
	
	@PostMapping("/adminGoodsAdd")
	public ResponseEntity<Object> adminGoodsAdd(MultipartHttpServletRequest multipartRequest) throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");
		
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		
		GoodsDTO goodsDTO = new GoodsDTO();
		goodsDTO.setGoodsNm(multipartRequest.getParameter("goodsNm"));
		goodsDTO.setActor(multipartRequest.getParameter("actor"));
		goodsDTO.setLocation(multipartRequest.getParameter("location"));
		goodsDTO.setPublishedDt(multipartRequest.getParameter("publishedDt"));
		goodsDTO.setPublishedTime(multipartRequest.getParameter("publishedTime"));
		goodsDTO.setShowtime(multipartRequest.getParameter("showtime"));
		goodsDTO.setGrade(multipartRequest.getParameter("grade"));
		goodsDTO.setPrice(Integer.parseInt(multipartRequest.getParameter("price")));
		goodsDTO.setStartDt(multipartRequest.getParameter("startDt"));
		goodsDTO.setEndDt(multipartRequest.getParameter("endDt"));
		goodsDTO.setPoint(Integer.parseInt(multipartRequest.getParameter("point")));
		goodsDTO.setShowIntro(multipartRequest.getParameter("showIntro"));
		goodsDTO.setActorInfo(multipartRequest.getParameter("actorInfo"));
		goodsDTO.setContentsOrder(multipartRequest.getParameter("contentsOrder"));
		goodsDTO.setDiscountRate(Integer.parseInt(multipartRequest.getParameter("discountRate")));
		goodsDTO.setStock(Integer.parseInt(multipartRequest.getParameter("stock")));
		goodsDTO.setDeliveryInfo(multipartRequest.getParameter("deliveryInfo"));
		goodsDTO.setDeliveryPrice(Integer.parseInt(multipartRequest.getParameter("deliveryPrice")));
		goodsDTO.setSort(multipartRequest.getParameter("sort"));
		goodsDTO.setGenre(multipartRequest.getParameter("genre"));
		goodsDTO.setPart(multipartRequest.getParameter("part"));
		Iterator<String> file = multipartRequest.getFileNames();
		if (file.hasNext()) {
			MultipartFile uploadFile = multipartRequest.getFile(file.next());
			if (!uploadFile.getOriginalFilename().isEmpty()) {
				String uploadFileName = UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				File f = new File(GOODS_IMAGE_REPO_PATH + uploadFileName);
				uploadFile.transferTo(f);
				goodsDTO.setGoodsFileName(uploadFileName);
			}
		}
		
		adminGoodsService.addGoods(goodsDTO);
		
		String jsScript = "<script>";
				jsScript += " alert('상품을 등록하였습니다.');";
				jsScript += " location.href='adminGoodsList';";
				jsScript += "</script>";

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/adminGoodsModify")
	public ModelAndView adminGoodsModify(@RequestParam("goodsCd") int goodsCd) throws Exception{
		
		ModelAndView mv = new ModelAndView("/admin/goods/adminGoodsModify");
		mv.addObject("goodsDTO", goodsService.getGoodsDetail(goodsCd));
		
		return mv;
	}
	
	@PostMapping("/adminGoodsModify")
	public ResponseEntity<Object> adminGoodsModify(MultipartHttpServletRequest multipartRequest) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		
		GoodsDTO goodsDTO = new GoodsDTO();
		goodsDTO.setGoodsCd(Integer.parseInt(multipartRequest.getParameter("goodsCd")));
		goodsDTO.setGoodsNm(multipartRequest.getParameter("goodsNm"));
		goodsDTO.setActor(multipartRequest.getParameter("actor"));
		goodsDTO.setLocation(multipartRequest.getParameter("location"));
		goodsDTO.setPublishedDt(multipartRequest.getParameter("publishedDt"));
		goodsDTO.setPublishedTime(multipartRequest.getParameter("publishedTime"));
		goodsDTO.setShowtime(multipartRequest.getParameter("showtime"));
		goodsDTO.setGrade(multipartRequest.getParameter("grade"));
		goodsDTO.setPrice(Integer.parseInt(multipartRequest.getParameter("price")));
		goodsDTO.setStartDt(multipartRequest.getParameter("startDt"));
		goodsDTO.setEndDt(multipartRequest.getParameter("endDt"));
		goodsDTO.setPoint(Integer.parseInt(multipartRequest.getParameter("point")));
		goodsDTO.setShowIntro(multipartRequest.getParameter("showIntro"));
		goodsDTO.setActorInfo(multipartRequest.getParameter("actorInfo"));
		goodsDTO.setContentsOrder(multipartRequest.getParameter("contentsOrder"));
		goodsDTO.setDiscountRate(Integer.parseInt(multipartRequest.getParameter("discountRate")));
		goodsDTO.setStock(Integer.parseInt(multipartRequest.getParameter("stock")));
		goodsDTO.setDeliveryInfo(multipartRequest.getParameter("deliveryInfo"));
		goodsDTO.setDeliveryPrice(Integer.parseInt(multipartRequest.getParameter("deliveryPrice")));
		goodsDTO.setSort(multipartRequest.getParameter("sort"));
		goodsDTO.setGenre(multipartRequest.getParameter("genre"));
		goodsDTO.setPart(multipartRequest.getParameter("part"));
		
		Iterator<String> file = multipartRequest.getFileNames();
		if (file.hasNext()) {
			MultipartFile uploadFile = multipartRequest.getFile(file.next());
			if (!uploadFile.getOriginalFilename().isEmpty()) {
				String uploadFileName = UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				File f = new File(GOODS_IMAGE_REPO_PATH + uploadFileName);
				uploadFile.transferTo(f);
				goodsDTO.setGoodsFileName(uploadFileName);
				
				new File(GOODS_IMAGE_REPO_PATH + goodsService.getGoodsDetail(Integer.parseInt(multipartRequest.getParameter("goodsCd"))).getGoodsFileName()).delete();
			}
		}
		
		adminGoodsService.modifyGoods(goodsDTO);
		
		String jsScript = "<script>";
				jsScript += " alert('상품을 수정하였습니다.');";
				jsScript += " location.href='adminGoodsList';";
				jsScript += "</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	
	@GetMapping("adminGoodsRemove")
	public ResponseEntity<Object> adminGoodsRemove(@RequestParam("goodsCd") int goodsCd) throws Exception{
		
		new File(GOODS_IMAGE_REPO_PATH + goodsService.getGoodsDetail(goodsCd).getGoodsFileName()).delete();
		adminGoodsService.removeGoods(goodsCd);
		
		String jsScript = "<script>";
				jsScript += " alert('상품을 삭제하였습니다.');";
				jsScript += " location.href='adminGoodsList';";	
				jsScript += "</script>";

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
}
