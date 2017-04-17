package com.lnk.jxc.dao;

import com.lnk.jxc.model.OrderInfo;

/**
 * <p>title:订单数据访问接口</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年4月17日 下午2:47:12
 */
public interface OrderInfoMapper {

    /**
     * 根据主键查询订单
     * @param
     * @return OrderInfo
     */
    OrderInfo selectByPrimaryKey(Integer id);

    /**
     * 插入订单
     * @param
     * @return int
     */
    int insert(OrderInfo orderInfo);

}