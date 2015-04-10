package a2team.yang.jae.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class MyAdvice {

	@Pointcut("execution(* a2team.yang.jae.*.MemberController.list(..))")
	public void advice() {
	}
	
	@Around("advice()")
	public Object checkSession(ProceedingJoinPoint joinPoint) throws Throwable {
		System.out.println("Around...");
		HttpServletRequest req = null;
	    Object[] ob = joinPoint.getArgs();
	    if (ob[0] instanceof HttpServletRequest) {
	        req = (HttpServletRequest) ob[0];
	    }
	    HttpSession session = req.getSession();
	    String uri = req.getRequestURI();
	    System.out.println("SESSION ID IS " + session.getId());
//		return "error/error";
		return joinPoint.proceed();
	}
	
	@Before("advice()")
	public void before(JoinPoint joinPoint) {
		System.out.println("Before...");
	}
	
	@After("advice()")
	public void after(JoinPoint joinPoint) {
		System.out.println("After...");
	}
}
