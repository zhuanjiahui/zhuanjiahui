package com.zhuanjiahui.order.model;

import com.zhuanjiahui.basic.model.Activity;
import com.zhuanjiahui.character.model.Expert;
import com.zhuanjiahui.main.model.ExpertServe;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/7/3.
 *预算单
 */
public class PurchaseGuide {

    private BigDecimal total;//总价格
    /*private List<PurchaseOrder> purchaseOrderList;*/
    private PurchaseOrder purchaseOrder;

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal tol) {
            total=tol;
    }

  /*  public List<PurchaseOrder> getPurchaseOrderList() {
        return purchaseOrderList;
    }

    public void setPurchaseOrderList(List<PurchaseOrder> purchaseOrderList) {
        this.purchaseOrderList = purchaseOrderList;
    }*/

    public PurchaseOrder getPurchaseOrder() {
        return purchaseOrder;
    }

    public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
        this.purchaseOrder = purchaseOrder;
    }
}
