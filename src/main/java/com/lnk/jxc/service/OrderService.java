package com.lnk.jxc.service;

import java.util.List;
import java.util.Map;

import com.lnk.jxc.model.OrderInfo;
import com.lnk.jxc.model.Product;
import com.lnk.jxc.model.User;
import com.lnk.jxc.response.HomeChartDto;
import com.lnk.jxc.response.HomeReportDto;
import com.lnk.jxc.response.OrderPrintDto;
import com.lnk.jxc.response.ReportOrderMonthDto;

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

    /**
     * 统计订单汇总信息
     * @param
     * @return HomeReportDto
     */
    HomeReportDto getTotal();

    /**
     * 统计近15日销售汇总信息
     * @param
     * @return List
     */
    List<HomeChartDto> getTotalNearHalfMonth();

    /**
     * 月度销售报表统计
     * @param startDate endDate
     * @return List<ReportOrderMonthDto>
     */
    List<ReportOrderMonthDto> getTotalByMonth(Map<String, String> param);

    /**
     * 查询所有订单
     * @param
     * @return List<OrderInfo>
     */
    List<OrderInfo> getOrderList();
}
