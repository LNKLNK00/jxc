package com.lnk.jxc.response;

public class HomeReportDto {
    private Integer total;
    private float totalPrice;
    private Integer onLineCount;
    private Integer saleCount;

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Integer getOnLineCount() {
        return onLineCount;
    }

    public void setOnLineCount(Integer onLineCount) {
        this.onLineCount = onLineCount;
    }

    public Integer getSaleCount() {
        return saleCount;
    }

    public void setSaleCount(Integer saleCount) {
        this.saleCount = saleCount;
    }
}
