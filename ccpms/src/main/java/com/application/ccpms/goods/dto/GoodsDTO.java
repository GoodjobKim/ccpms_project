package com.application.ccpms.goods.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;


@Component
public class GoodsDTO {
	private int goodsCd;		
	private String goodsNm;		
	private String actor;			
	private String location;
	private String sort;			
	private String part;			
	private String publishedDt;	
	private String publishedTime;	
	private String showtime;		
	private String grade;			
	private int price;
	private String startDt;
	private String endDt;
	private int point;			
	private String showIntro;		
	private String actorInfo;		
	private String contentsOrder;	
	private String goodsFileName;
	private Date	enrollDt;
	private int discountRate;	
	private int stock;			
	private String deliveryInfo;	
	private int deliveryPrice;
	private String genre;
	public int getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(int goodsCd) {
		this.goodsCd = goodsCd;
	}
	public String getGoodsNm() {
		return goodsNm;
	}
	public void setGoodsNm(String goodsNm) {
		this.goodsNm = goodsNm;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getPublishedDt() {
		return publishedDt;
	}
	public void setPublishedDt(String publishedDt) {
		this.publishedDt = publishedDt;
	}
	public String getPublishedTime() {
		return publishedTime;
	}
	public void setPublishedTime(String publishedTime) {
		this.publishedTime = publishedTime;
	}
	public String getShowtime() {
		return showtime;
	}
	public void setShowtime(String showtime) {
		this.showtime = showtime;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getStartDt() {
		return startDt;
	}
	public void setStartDt(String startDt) {
		this.startDt = startDt;
	}
	public String getEndDt() {
		return endDt;
	}
	public void setEndDt(String endDt) {
		this.endDt = endDt;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getShowIntro() {
		return showIntro;
	}
	public void setShowIntro(String showIntro) {
		this.showIntro = showIntro;
	}
	public String getActorInfo() {
		return actorInfo;
	}
	public void setActorInfo(String actorInfo) {
		this.actorInfo = actorInfo;
	}
	public String getContentsOrder() {
		return contentsOrder;
	}
	public void setContentsOrder(String contentsOrder) {
		this.contentsOrder = contentsOrder;
	}
	public String getGoodsFileName() {
		return goodsFileName;
	}
	public void setGoodsFileName(String goodsFileName) {
		this.goodsFileName = goodsFileName;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getDeliveryInfo() {
		return deliveryInfo;
	}
	public void setDeliveryInfo(String deliveryInfo) {
		this.deliveryInfo = deliveryInfo;
	}
	public int getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	@Override
	public String toString() {
		return "GoodsDTO [goodsCd=" + goodsCd + ", goodsNm=" + goodsNm + ", actor=" + actor + ", location=" + location
				+ ", sort=" + sort + ", part=" + part + ", publishedDt=" + publishedDt + ", publishedTime="
				+ publishedTime + ", showtime=" + showtime + ", grade=" + grade + ", price=" + price + ", startDt="
				+ startDt + ", endDt=" + endDt + ", point=" + point + ", showIntro=" + showIntro + ", actorInfo="
				+ actorInfo + ", contentsOrder=" + contentsOrder + ", goodsFileName=" + goodsFileName + ", enrollDt="
				+ enrollDt + ", discountRate=" + discountRate + ", stock=" + stock + ", deliveryInfo=" + deliveryInfo
				+ ", deliveryPrice=" + deliveryPrice + ", genre=" + genre + "]";
	}
	
	
	
	
}
