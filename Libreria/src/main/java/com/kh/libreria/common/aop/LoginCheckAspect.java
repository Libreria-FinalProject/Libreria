package com.kh.libreria.common.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Component
@Aspect
public class LoginCheckAspect {
	private Logger logger = LoggerFactory.getLogger(LoginCheckAspect.class);
	
	
	@Before("execution(* com.kh.libreria.member.controller..*(..))")
	public void loggerAdvice( HttpServletRequest request) throws Throwable {
		
		logger.debug("url : "+request.getRequestURL().toString());

		
//		ModelAndView mv = new ModelAndView();
//		HttpSession session = request.getSession();
//		
//	
//		
//		if(session.getAttribute("loginUser") == null) {
//			System.out.println("LoginCheckAspect logger 시작");
//			mv.setViewName("redirect:/");
//		}
//		return mv;

	}
}
