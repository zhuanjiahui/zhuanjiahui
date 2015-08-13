package com.frame.core.taglib;



import com.frame.core.p.model.StatusType;
import com.frame.core.p.model.StatusTypeItem;
import com.frame.core.p.service.impl.ModuleManagerImpl;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;




public class StatusTag extends TagSupport {
    private String name;
    private String type;                //select radio
    private String dataType;
    private String checkedValue;        //选中值
    private String defaultValue;        //默认值
    private String onclick;
    private String onchange;
    private String htmlTag;
    private String required;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    public String getCheckedValue() {
        return checkedValue;
    }

    public void setCheckedValue(String checkedValue) {
        this.checkedValue = checkedValue;
    }

    public String getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }

    public String getOnclick() {
        return onclick;
    }

    public void setOnclick(String onclick) {
        this.onclick = onclick;
    }

    public String getOnchange() {
        return onchange;
    }

    public void setOnchange(String onchange) {
        this.onchange = onchange;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getRequired() {
        return required;
    }

    public void setRequired(String required) {
        this.required = required;
    }

    @Override
    public int doStartTag() {
        this.getHtmlTag();
        return SKIP_BODY;   //忽略对body的处理
    }

    @Override
    public int doEndTag() throws JspException {
        JspWriter out = pageContext.getOut();
        try {
            out.println(htmlTag); //页面中显示的内容
        } catch (IOException e) {
            throw new JspException(e);
        }
        return EVAL_PAGE; //继续处理页面内容
    }


    private void getHtmlTag() {
        if (type == null) {
            htmlTag = this.getSelectTag();
        } else {
            switch (type) {
                case "line":
                    htmlTag = this.getLineTag();
                    break;
                case "list":
                    htmlTag = this.getListTag();
                    break;
                case "select":
                    htmlTag = this.getSelectTag();
                    break;
                case "radio":
                    htmlTag = this.getRadioTag();
                    break;
                case "normal":
                    htmlTag = this.getNormalTag();
                    break;
                default:
                    htmlTag = this.getSelectTag();
                    break;
            }
        }
    }


    public String getSelectTag() {
        ModuleManagerImpl moduleManager = new ModuleManagerImpl();
        StatusType statusType = moduleManager.fetchStatusType(dataType);
        if (statusType == null || statusType.getStatusTypeItemList() == null) {
            return "无查询数据";
        }

        if (required == null || required.equals("")) {
            required = statusType.getRequired();
        }
        StringBuffer htmlTagBuffer = new StringBuffer();
        htmlTagBuffer.append("<select id=\"doc-select-1\" name=\"").append(name).append("\"");
        if (onclick != null) {
            htmlTagBuffer.append(" onclick=").append(onclick);
        }
        if (onchange != null) {
            htmlTagBuffer.append(" onchange=").append(onchange);
        }
        if (required.equals("true")) {
            htmlTagBuffer.append(" class=\"selectValidate\"");
        }

        htmlTagBuffer.append(">");
        htmlTagBuffer.append("<option value=\"\">请选择</option>");
        for (int i = 0; i < statusType.getStatusTypeItemList().size(); i++) {
            StatusTypeItem statusTypeItem = statusType.getStatusTypeItemList().get(i);
            htmlTagBuffer.append("<option value=\"")
                    .append(statusTypeItem.getValue())
                    .append("\"");
            if (checkedValue == null || checkedValue.equals("")) {
                if (defaultValue != null && Integer.parseInt(defaultValue) == i + 1) {
                    htmlTagBuffer.append(" selected=\"selected\"");
                }
            } else {
                if (checkedValue.equals(statusTypeItem.getValue())) {
                    htmlTagBuffer.append(" selected=\"selected\"");
                }
            }
            htmlTagBuffer.append(">")
                    .append(statusTypeItem.getLabel())
                    .append("</option>");
        }
        htmlTagBuffer.append("</select>");
        return htmlTagBuffer.toString();
    }

    public String getRadioTag() {
        ModuleManagerImpl moduleManager = new ModuleManagerImpl();
        StatusType statusType = moduleManager.fetchStatusType(dataType);

        if (statusType == null || statusType.getStatusTypeItemList() == null) {
            return "无查询数据";
        }

        if (required == null || required.equals("")) {
            required = statusType.getRequired();
        }

        StringBuffer htmlTagBuffer = new StringBuffer();
        for (int i = 0; i < statusType.getStatusTypeItemList().size(); i++) {
            StatusTypeItem statusTypeItem = statusType.getStatusTypeItemList().get(i);
            htmlTagBuffer.append("<input type=\"radio\" name=\"").append(name).append("\" value=\"").append(statusTypeItem.getValue()).append("\"");
            if (checkedValue == null || checkedValue.equals("")) {
                if (defaultValue != null && Integer.parseInt(defaultValue) == i + 1) {
                    htmlTagBuffer.append(" checked=\"checked\"");
                }
            } else {
                if (checkedValue != null && statusTypeItem.getValue().equals(checkedValue)) {
                    htmlTagBuffer.append(" checked=\"checked\"");
                }
            }
            if (onclick != null) {
                htmlTagBuffer.append(" onclick=").append(onclick);
            }

            if (i == 0 && required.equals("true")) {

                htmlTagBuffer.append(" class=\"radioValidate\"");
            }
            htmlTagBuffer.append(" />").append(statusTypeItem.getLabel()).append("&nbsp");
        }
        return htmlTagBuffer.toString();
    }

    public String getNormalTag() {
        ModuleManagerImpl moduleManager = new ModuleManagerImpl();
        String label = moduleManager.convertStatusTypeLabel(dataType, checkedValue);

        if (label == null) {
            label = "";
        }
        return label;
    }


    public String getListTag() {

        ModuleManagerImpl moduleManager = new ModuleManagerImpl();
        StatusType statusType = moduleManager.fetchStatusType(dataType);
        if (statusType == null || statusType.getStatusTypeItemList() == null) {
            return "无查询数据";
        }

        if (required == null || required.equals("")) {
            required = statusType.getRequired();
        }

        StringBuffer htmlTagBuffer = new StringBuffer();
        for (int i = 0; i < statusType.getStatusTypeItemList().size(); i++) {
            StatusTypeItem statusTypeItem = statusType.getStatusTypeItemList().get(i);
            if (checkedValue!=null&&checkedValue.equals(statusTypeItem.getValue())) {
                htmlTagBuffer
                .append("<li><a class='screeningChioce' href=" + onclick + statusTypeItem.getValue() + ">" + statusTypeItem.getLabel() + "</a></li>");
            } else {
                htmlTagBuffer
                        .append("<li><a href=" + onclick + statusTypeItem.getValue() + ">" + statusTypeItem.getLabel() + "</a></li>");
            }
        }
        return htmlTagBuffer.toString();
    }


    public String getLineTag() {

        ModuleManagerImpl moduleManager = new ModuleManagerImpl();
        StatusType statusType = moduleManager.fetchStatusType(dataType);
        if (statusType == null || statusType.getStatusTypeItemList() == null) {
            return "无查询数据";
        }


        if (required == null || required.equals("")) {
            required = statusType.getRequired();
        }

        StringBuffer htmlTagBuffer = new StringBuffer();
        System.out.println(statusType.getStatusTypeItemList().size());
        for (int i = 0; i < statusType.getStatusTypeItemList().size(); i++) {
            StatusTypeItem statusTypeItem = statusType.getStatusTypeItemList().get(i);
            if (checkedValue.equals(statusTypeItem.getValue())) {
                htmlTagBuffer
                        .append("<a class='cur' href='" + onclick+"_"+ statusTypeItem.getValue() + "'>" + statusTypeItem.getLabel() + "</a>");
            } else {
                htmlTagBuffer
                        .append("<a  href='" + onclick+"_"+ statusTypeItem.getValue() + "'>" + statusTypeItem.getLabel() + "</a>");
            }
        }
        System.out.println(htmlTagBuffer.toString());
        return htmlTagBuffer.toString();
    }


}
