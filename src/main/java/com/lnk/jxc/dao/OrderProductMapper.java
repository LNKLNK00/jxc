package com.lnk.jxc.dao;

import java.util.List;

import com.lnk.jxc.model.OrderProduct;
import com.lnk.jxc.response.OrderProductDto;

/**
 * <p>title:订单产品数据访问接口</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年4月17日 下午3:03:13
 */
public interface OrderProductMapper {

    /**
     * 批量插入订单产品
     * @param
     * @return int
     */
    int insertBatch(List<OrderProduct> list);

    /**
     * 根据订单ID查询订单产品列表
     * @param
     * @return List<OrderProductDto>
     */
    List<OrderProductDto> selectByOrderId(Integer orderId);

    /**
     * 查询销量前五名的商品
     * @param
     * @return List<OrderProductDto>
     */
    List<OrderProductDto> selectTop5();

    /**
     * 查询已销售商品总数
     * @param
     * @return int
     */
    int selectTotalNum();

}