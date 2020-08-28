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
public class UserLoginAspect {
//pointcut: controller 패키지의 User이름으로 시작하는 클래스.
//			메서드의 이름이 loginCheck로 시작
//			매개변수는 상관없음
//args(..,session): 마지막 매개변수가 session인 메서드
	//기본메서드 실행 전, 후
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
