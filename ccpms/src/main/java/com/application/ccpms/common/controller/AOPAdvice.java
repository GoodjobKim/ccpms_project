package com.application.ccpms.common.controller;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AOPAdvice {

	private static final Logger logger = LoggerFactory.getLogger(AOPAdvice.class);
	
	@Around("execution(* com.application.ccpms.order.controller.OrderController.orderGoods(..))")
	public Object logMethod1(ProceedingJoinPoint joinPoint) throws Throwable{
		//호출전
		logger.info("================주문전==================");
		long startTime = System.currentTimeMillis();
		
		
		Object result = joinPoint.proceed();
		
		//호출후
		long endTime = System.currentTimeMillis();
		logger.info("메소드 호출 시간 : " + (endTime - startTime) + "초");
		logger.info("================주문완료=================");
		
		return result;
	}
	
	
	@Around("execution(* com.application.ccpms.order.controller.OrderController.orderCartGoods(..))")
	public Object logMethod2(ProceedingJoinPoint joinPoint) throws Throwable{
		//호출전
		logger.info("================장바구니주문전==================");
		long startTime = System.currentTimeMillis();
		
		
		Object result = joinPoint.proceed();
		
		//호출후
		long endTime = System.currentTimeMillis();
		logger.info("메소드 호출 시간 : " + (endTime - startTime) + "초");
		logger.info("================장바구니주문완료=================");
		
		return result;
	}
			
	
}
