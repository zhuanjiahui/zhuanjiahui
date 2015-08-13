package com.frame.core.p.service;



import com.frame.core.p.model.Module;
import com.frame.core.p.model.StatusType;
import com.frame.core.p.model.Xentity;

import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-4-20
 * Time: 下午4:18
 * To change this template use File | Settings | File Templates.
 */
public interface ModuleManager {

    public StatusType fetchStatusType(String key);

    public String convertStatusTypeLabel(String key, String propertyValue);

}
