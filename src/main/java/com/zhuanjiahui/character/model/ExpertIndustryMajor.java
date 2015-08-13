package com.zhuanjiahui.character.model;

/**
 * Created by Administrator on 2015/7/9.
 * 级联查询的中间实体
 */
public class ExpertIndustryMajor {
    private Expert expert;
    private String industry;
    private String major;


    public ExpertIndustryMajor(Expert expert, String industry, String major) {
        this.expert = expert;
        this.industry = industry;
        this.major = major;
    }

    public Expert getExpert() {
        return expert;
    }

    public void setExpert(Expert expert) {
        this.expert = expert;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }
}
