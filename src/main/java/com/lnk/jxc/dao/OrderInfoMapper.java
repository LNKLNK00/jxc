package com.lnk.jxc.dao;

import java.util.List;
import java.util.Map;

import com.lnk.jxc.model.OrderInfo;
import com.lnk.jxc.response.HomeChartDto;
import com.lnk.jxc.response.HomeReportDto;
import com.lnk.jxc.response.ReportOrderMonthDto;

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

    /**
     * 月度销售报表统计
     * @param startDate endDate
     * @return List<ReportOrderMonthDto>
     */
    List<ReportOrderMonthDto> selectTotalByMonth(Map<String, String> param);

    /**
     * 查询所有订单
     * @param
     * @return List<OrderInfo>
     */
    List<OrderInfo> selectAll();
}