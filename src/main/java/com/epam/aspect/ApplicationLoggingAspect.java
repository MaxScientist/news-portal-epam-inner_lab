package com.epam.aspect;


import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class ApplicationLoggingAspect {

    private static final Logger LOGGER = LoggerFactory.getLogger(ApplicationLoggingAspect.class);
    private static final String beforeMessageStatement = "Method invoked: %s : %s arguments : %s";
    private static final String afterMessageStatement = "Method executed: %s";
    private static final String afterReturningMessageStatement = "\t Returned: %s from method: %s";
    private static final String afterThrowingMessageStatement = "Method %s has thrown exception: %s";


    @Pointcut("execution(* com.epam.config.*.*(..))")
    private void forConfigPackage() {
    }

    @Pointcut("execution(* com.epam.controller.*.*(..))")
    private void forControllerPackage() {
    }

    @Pointcut("execution(* com.epam.dto.*.*(..))")
    private void forDTOPackage() {
    }

    @Pointcut("execution(* com.epam.entity.*.*(..))")
    private void forEntityPackage() {
    }

    @Pointcut("execution(* com.epam.repository.*.*(..))")
    private void forRepositoryPackage() {
    }

    @Pointcut("execution(* com.epam.service.*.*(..))")
    private void forServicePackage() {
    }

    @Pointcut("forConfigPackage() || forControllerPackage() || forDTOPackage() " +
            "|| forEntityPackage() || forRepositoryPackage() || forServicePackage()")
    private void forAppFlow() {
    }

    @Before("forAppFlow()")
    private void before(JoinPoint joinPoint) {
        String methodSignature = joinPoint.getSignature().toShortString();
        String className = joinPoint.getTarget().getClass().getName();

        StringBuilder stringArgList = new StringBuilder();
        Object[] args = joinPoint.getArgs();

        for (Object tempArg : args) {
            stringArgList.append(" ").append(tempArg);
        }
        LOGGER.info(String.format(beforeMessageStatement, className, methodSignature, stringArgList));
    }

    @After("forAppFlow()")
    private void after(JoinPoint joinPoint) {
        String methodSignature = joinPoint.getSignature().toShortString();
        LOGGER.info(String.format(afterMessageStatement, methodSignature));
    }

    @AfterReturning(pointcut = "forAppFlow()", returning = "result")
    private void afterReturningResult(JoinPoint joinPoint, Object result) {
        String methodSignature = joinPoint.getSignature().toShortString();
        String shortResult = (result != null ? result.getClass().getName() : "null");
        LOGGER.info(String.format(afterReturningMessageStatement, shortResult, methodSignature));
    }

    @AfterThrowing(pointcut = "forAppFlow()", throwing = "error")
    private void afterThrowing(JoinPoint joinPoint, Throwable error) {
        String methodSignature = joinPoint.getSignature().toShortString();
        LOGGER.error(String.format(afterThrowingMessageStatement, methodSignature, error));
    }
}
