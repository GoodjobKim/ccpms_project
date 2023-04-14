package com.application.ccpms.myPage.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class CartDTO {
	private long cartCd;
	private String	memberId;
	private int goodsCd;
	private int cartGoodsQty;
	private Date enrollDt;
	
	public long getCartCd() {
		return cartCd;
	}
	public void setCartCd(long cartCd) {
		this.cartCd = cartCd;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(int goodsCd) {
		this.goodsCd = goodsCd;
	}
	public int getCartGoodsQty() {
		return cartGoodsQty;
	}
	public void setCartGoodsQty(int cartGoodsQty) {
		this.cartGoodsQty = cartGoodsQty;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	
	@Override
	public String toString() {
		return "CartDTO [cartCd=" + cartCd + ", memberId=" + memberId + ", goodsCd=" + goodsCd + ", cartGoodsQty="
				+ cartGoodsQty + ", enrollDt=" + enrollDt + "]";
	}
	
	
}
