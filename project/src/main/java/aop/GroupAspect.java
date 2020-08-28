package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import exception.LoginException;
import logic.User;

@Component	//객체화
@Aspect		//AOP 실행 클래스
@Order(1)	//AOP 실행 순서
public class GroupAspect {
	@Around("execution(* controller.Group*.loginCheck*(..)) && args(..,session)")
	public Object userLoginCheck(ProceedingJoinPoint joinPoint,
			HttpSession session) throws Throwable{
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LoginException
				("로그인 후 이용하세요", "../user/login.dev");
		}		
		return joinPoint.proceed();		
	}	
}
