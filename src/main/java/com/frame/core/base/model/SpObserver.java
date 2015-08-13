package com.frame.core.base.model;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-12-11
 * Time: 下午3:21
 * To change this template use File | Settings | File Templates.
 */
public class SpObserver {

    @SuppressWarnings("unchecked")
    //并不是线程，而是线程变量，为每个线程提供各自的值的副本的容器
    private static ThreadLocal<String> local = new ThreadLocal();

    @SuppressWarnings("unchecked")
    public static void putSp(String sp) {
//        System.out.println("set方法");
        local.set(sp);
    }

    public static String getSp() {
//        System.out.println("get方法");
        //获取变量值的副本
        return local.get();
    }
}
