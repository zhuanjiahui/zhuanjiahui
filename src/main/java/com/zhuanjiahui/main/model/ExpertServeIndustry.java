package com.zhuanjiahui.main.model;

import com.frame.organization.model.User;
import com.zhuanjiahui.character.model.Expert;

/**
 * Created by Administrator on 2015/7/20.
 */
public class ExpertServeIndustry {
    private ExpertServe expertServe;
    private String industry;
    private Expert expert;

    public ExpertServeIndustry(ExpertServe expertServe, String industry,Expert expert) {
        this.expertServe = expertServe;
        this.industry = industry;
        this.expert=expert;
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

    public ExpertServe getExpertServe() {
        return expertServe;
    }

    public void setExpertServe(ExpertServe expertServe) {
        this.expertServe = expertServe;
    }
}
