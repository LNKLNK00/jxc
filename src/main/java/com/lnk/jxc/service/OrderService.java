package com.lnk.jxc.service;

import java.util.List;

import com.lnk.jxc.model.OrderInfo;
import com.lnk.jxc.model.Product;
import com.lnk.jxc.model.User;
import com.lnk.jxc.response.OrderPrintDto;

/**
 * <p>title:订单服务接口</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年4月17日 下午3:05:20
 */
public interface OrderService {

    /**
     * 下单
     * @param
     * @return boolean
     */
    OrderInfo toOrder(List<Product> productList, User user);

    /**
     * 根据订单ID查询订单打印信息
     * @param
     * @return OrderPrintDto
     */
    OrderPrintDto getPrintList(Integer orderId);
}
