package com.lnk.jxc.response;

import java.util.List;

public class OrderPrintDto {

    private String orderNo;

    private Float price;

    private String createTime;

    private String userName;

    private List<OrderProductDto> productList;

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo == null ? null : orderNo.trim();
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public List<OrderProductDto> getProductList() {
        return productList;
    }

    public void setProductList(List<OrderProductDto> productList) {
        this.productList = productList;
    }
}