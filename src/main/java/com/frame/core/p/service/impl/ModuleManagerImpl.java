package com.frame.core.p.service.impl;

import com.frame.core.p.model.StatusType;
import com.frame.core.p.model.StatusTypeItem;
import com.frame.core.p.model.Xentity;
import com.frame.core.p.service.ModuleManager;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import java.io.IOException;
import java.util.*;


/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-4-19
 * Time: 下午2:35
 * To change this template use File | Settings | File Templates.
 */

public class ModuleManagerImpl implements ModuleManager {

    private static final String STATUS_TYPE_XML = "/setting/statusTypes.xml";
    private static Map<String, Xentity> entityMap = new HashMap();

    public static void readXmlFiles() {

        Resource statusResource = new ClassPathResource(STATUS_TYPE_XML);
        Document infoDocument = null;
        try {
            infoDocument = new SAXReader().read(statusResource.getInputStream());
        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (infoDocument != null) {
            List<Node> entityNodeList = infoDocument.selectNodes("statusTypes/entity");
            for (Node entityNode : entityNodeList) {
                Xentity xentity=new Xentity();
                String name = entityNode.selectSingleNode("@name").getText();
                String label = entityNode.selectSingleNode("@label").getText();
                List<Node> statusNodeList = entityNode.selectNodes("statusType");
                LinkedHashMap<String,StatusType> statusMap = new LinkedHashMap<>();
                for (Node statusNode : statusNodeList) {
                    StatusType statusType = new StatusType();
                    String fileName = statusNode.selectSingleNode("@fileName").getText();
                    String required=statusNode.selectSingleNode("@required").getText();
                    List<Node> itemNodeList=statusNode.selectNodes("item");
                    List<StatusTypeItem> items=new ArrayList<>();
                    for (Node item:itemNodeList){
                        StatusTypeItem statusTypeItem=new StatusTypeItem();
                        String itemLabel=item.selectSingleNode("@label").getText();
                        String itemValue=item.selectSingleNode("@value").getText();
                        statusTypeItem.setLabel(itemLabel);
                        statusTypeItem.setValue(itemValue);
                        items.add(statusTypeItem);
                    }
                    statusType.setFieldName(fileName);
                    statusType.setRequired(required);
                    statusType.setStatusTypeItemList(items);
                    statusMap.put(fileName, statusType);
                }
                xentity.setName(name);
                xentity.setLabel(label);
                xentity.setStatusMap(statusMap);
                entityMap.put(name,xentity);
            }
        }
    }




    @Override
    public StatusType fetchStatusType(String key) {

        String[] keys = key.split("\\.");
        Xentity xentity = entityMap.get(keys[0]);
        if (xentity != null) {
            return  xentity.getStatusMap().get(keys[1]);

        }
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public String convertStatusTypeLabel(String key, String propertyValue) {

        String[] keys = key.split("\\.");
        Xentity xentity = entityMap.get(keys[0]);

        if (xentity != null) {
            StatusType statusType = (StatusType) xentity.getStatusMap().get(keys[1]);
            if (statusType != null) {
                for (StatusTypeItem statusTypeItem : statusType.getStatusTypeItemList()) {
                    if (statusTypeItem.getValue().equals(propertyValue)) {
                        return statusTypeItem.getLabel();
                    }
                }
            }
        }
        return "";
    }

}
