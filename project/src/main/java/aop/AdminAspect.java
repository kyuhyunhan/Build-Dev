package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import exception.LoginException;
import logic.User;

@Component
@Aspect
@Order(3)
public class AdminAspect {
	@Around("execution(* controller.Admin*.*(..))")
	public Object adminCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		User loginUser = null;
		for(Object o : joinPoint.getArgs()) {
			if(o instanceof HttpSession) {
				HttpSession session = (HttpSession)o;
				loginUser = (User)session.getAttribute("loginUser");
			}
		}
		if(loginUser == null) {
			throw new LoginException("로그인 후 이용하세요","../user/login.dev");
		}
		if(!loginUser.getId().equals("admin")) {
			throw new LoginException("관리자만 가능한 페이지입니다.","../user/main.shop?id="+loginUser.getId());
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
	
	@Around("execution(* controller.Coworking*.loginCheck*(..)) && args(..,session)")
	public Object userCoworkingLoginCheck(ProceedingJoinPoint joinPoint,
			HttpSession session) throws Throwable{
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LoginException
				("로그인 후 이용하세요", "../user/login.dev");
		}		
		return joinPoint.proceed();		
	}
	
	@Around("execution(* controller.TIL*.loginCheck*(..)) && args(..,session)")
	public Object userTILLoginCheck(ProceedingJoinPoint joinPoint,
			HttpSession session) throws Throwable{
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LoginException
				("로그인 후 이용하세요", "../user/login.dev");
		}		
		return joinPoint.proceed();		
	}
	
	@Around("execution(* controller.Group*.loginCheck*(..)) && args(..,session)")
	public Object userGroupLoginCheck(ProceedingJoinPoint joinPoint,
			HttpSession session) throws Throwable{
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LoginException
				("로그인 후 이용하세요", "../user/login.dev");
		}		
		return joinPoint.proceed();		
	}
	
	@Around("execution(* controller.User*.loginCheck*(..)) && args(..,session)")
	public Object userLoginCheck(ProceedingJoinPoint joinPoint,
			HttpSession session) throws Throwable{
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LoginException
				("로그인 후 이용하세요", "login.dev");
		}		
		return joinPoint.proceed();		
	}	
	@Around("execution(* controller.User*.check*(..)) && args(id,session)")
	public Object LoginCheck(ProceedingJoinPoint joinPoint, String id, 
			HttpSession session) throws Throwable{
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LoginException
				("로그인 후 이용하세요", "login.dev");
		}		
//		if(!loginUser.getId().equals("admin") && !id.equals(loginUser.getId())) {
//			throw new LoginException
//				("본인정보만 조회가능", "main.dev?id="+loginUser.getId());
//		}
		return joinPoint.proceed();		
	}
	
}
