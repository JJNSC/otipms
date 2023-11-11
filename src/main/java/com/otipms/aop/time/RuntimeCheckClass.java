package com.otipms.aop.time;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Slf4j
public class RuntimeCheckClass {

	/*@Around("bean(*Controller)")
	public Object runtimeCheckAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
		
		StopWatch stopWatch = new StopWatch();
		stopWatch.start(String.valueOf(joinPoint.getSignature()));
		Object proceed = joinPoint.proceed();
		stopWatch.stop();
		
		log.info(stopWatch.prettyPrint());
		return proceed;
	}*/
	 @Around("@annotation(com.otipms.aop.time.RuntimeCheck)")
	    public Object runtimeCheckAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
	        StopWatch stopWatch = new StopWatch();
	        stopWatch.start(joinPoint.getSignature().toShortString());

	        Object result = joinPoint.proceed();

	        stopWatch.stop();
	        log.info("{} took {} ms", joinPoint.getSignature().toShortString(), stopWatch.getTotalTimeMillis());
	        return result;
	    }
}
