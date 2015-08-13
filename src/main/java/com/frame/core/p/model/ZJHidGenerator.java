package com.frame.core.p.model;

import java.io.Serializable;
import java.util.Properties;


import org.hibernate.HibernateException;
import org.hibernate.MappingException;
import org.hibernate.dialect.Dialect;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.id.*;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-4-3
 * Time: 上午9:16
 * To change this template use File | Settings | File Templates.
 */
public class ZJHidGenerator implements IdentifierGenerator, Configurable {


    private static String serial;



    public Serializable generate(SessionImplementor session,
                                 Object object) throws HibernateException {


        String dateId = Long.toString(System.currentTimeMillis(), 36);


        Double numIds = Math.random();
        String numIds3 = numIds.toString().substring(2, 8);
        String numId = Integer.toString(Integer.parseInt(numIds3), 36);

        StringBuilder stringBuilder = new StringBuilder(16);

        stringBuilder
                //.append(fillWithZero(branchId, 4))
                .append(fillWithZero(dateId, 8))
                .append(fillWithZero(numId, 8));

        return stringBuilder.toString();

    }

    public void configure(org.hibernate.type.Type type, Properties params,
                          Dialect d) throws MappingException {
    }

    private String fillWithZero(String str, Integer length) {

        StringBuilder stringBuilder = new StringBuilder(length);

        stringBuilder.append(str);
        if (str.length() > length) {
            stringBuilder.deleteCharAt(length);
        } else if (str.length() < length) {
            int tempLength = length - str.length();
            for (int i = 0; i < tempLength; i++) {
                stringBuilder.insert(0, "0");
            }
        }

        return stringBuilder.toString();
    }


    public static String getSerial() {
        return serial;
    }

    public static void setSerial(String serial) {
        ZJHidGenerator.serial = serial;
    }

}
