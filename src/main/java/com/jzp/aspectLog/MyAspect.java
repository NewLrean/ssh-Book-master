package com.jzp.aspectLog;

import com.opensymphony.xwork2.ActionContext;
import com.jzp.entity.AdminLog;
import com.jzp.useroperation.AdminService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * Created by renba on 2017/6/13.
 */
@Aspect
@Component
public class MyAspect {
    @Autowired
    AdminService adminService;

    @Pointcut("execution(* com.jzp.dao.impl.*Impl.*(..))")
    private void myPointCut() {

    }

    //前置通知
    @Before("myPointCut()")
    public void myBefore(JoinPoint joinPoint) {
        System.out.println("前置通知:方法名称：");
        System.out.println(joinPoint.getSignature().getName());

    }

    //后置通知
    @AfterReturning("myPointCut()")
    public void myAfterReturning(JoinPoint joinPoint) {
        System.out.println("后置通知："+joinPoint.getSignature().getName());
        ActionContext context = ActionContext.getContext();
        String username = (String) context.getSession().get("username");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sdf.format(new Date());
        AdminLog adminLog = new AdminLog();
        adminLog.setUsername(username);
        adminLog.setOperation(joinPoint.getSignature().getName());
        adminLog.setTime(time);
        adminService.save(adminLog);


    }

    //环绕通知
    @Around("myPointCut()")
    public Object myAround(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        System.out.println("环绕开始");
        //执行当前目标方法
        Object object = proceedingJoinPoint.proceed();
        //结束
        System.out.println("环绕结束");
        return object;

    }

    //异常通知
    @AfterThrowing(value = "myPointCut()", throwing = "e")
    public void myAfterThrowing(JoinPoint joinPoint, Throwable e) {
        System.out.println(joinPoint.getSignature().getName());
        ActionContext context = ActionContext.getContext();
        String username = (String) context.getSession().get("username");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sdf.format(new Date());
        AdminLog adminLog = new AdminLog();
        adminLog.setUsername(username);
        adminLog.setOperation(joinPoint.getSignature().getName());
        adminLog.setTime(time);
        adminLog.setException(e.getMessage());
        adminService.save(adminLog);

    }

    //最终通知
    @After("myPointCut()")
    public void myAfter() {
        System.out.println("最终通知");
    }
}
