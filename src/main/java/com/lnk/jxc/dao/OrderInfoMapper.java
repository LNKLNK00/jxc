package com.lnk.jxc.dao;

import com.lnk.jxc.model.OrderInfo;
import com.lnk.jxc.response.HomeChartDto;
import com.lnk.jxc.response.HomeReportDto;

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

    /**
     * 统计订单汇总信息
     * @param
     * @return HomeReportDto
     */
    HomeReportDto selectTotal();

    /**
     * 根据日期查询订单汇总信息
     * @param
     * @return HomeChartDto
     */
    HomeChartDto selectTotalByDate(String date);
}