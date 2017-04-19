package com.lnk.jxc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lnk.jxc.enums.EnumResultCode;
import com.lnk.jxc.model.OrderInfo;
import com.lnk.jxc.response.OrderProductDto;
import com.lnk.jxc.response.ReportOrderMonthDto;
import com.lnk.jxc.response.ReportProductSalesRankDto;
import com.lnk.jxc.response.ResponseDto;
import com.lnk.jxc.service.OrderService;
import com.lnk.jxc.service.ProductService;

/**
 * <p>title:报表控制类</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年4月19日 上午9:59:31
 */
@Controller
@RequestMapping("/report")
public class ReportController {

    private final static Logger LOG = LoggerFactory.getLogger(ReportController.class);
    @Autowired
    private OrderService orderService;
    @Autowired
    private ProductService productService;

    @GetMapping("/index.html")
    public String index(ModelMap map) {
        LOG.info("进入销售报表页面");
        List<OrderInfo> orderList = orderService.getOrderList();
        List<OrderProductDto> productList = productService.getOrderProductList();
        map.addAttribute("orderList", orderList);
        map.addAttribute("productList", productList);
        return "report";
    }

    @PostMapping("/saleQuery")
    @ResponseBody
    public ResponseDto<List<ReportProductSalesRankDto>> saleQuery(String startDate, String endDate) {
        LOG.info("{call 商品销售排行查询:startDate=" + startDate + "，endDate=" + endDate + "}");
        ResponseDto<List<ReportProductSalesRankDto>> response = new ResponseDto<List<ReportProductSalesRankDto>>();
        response.setCode(EnumResultCode.RERULT_CODE_SUCCESS.getCode());
        response.setMessage("商品销售排行查询成功");
        Map<String, String> param = new HashMap<String, String>();
        param.put("startDate", startDate);
        param.put("endDate", endDate);
        try {
            List<ReportProductSalesRankDto> data = productService.salesRank(param);
            response.setData(data);
        } catch (Exception e) {
            LOG.error("商品销售排行查询失败：" + e.getMessage());
            response.setCode(EnumResultCode.RERULT_CODE_ERROR.getCode());
            response.setMessage("商品销售排行查询失败：" + e.getMessage());
        }
        LOG.info("{接口/report/saleQuery,响应结果：" + response.getMessage() + "}");
        return response;
    }

    @PostMapping("/monthQuery")
    @ResponseBody
    public ResponseDto<List<ReportOrderMonthDto>> monthQuery(String startDate, String endDate) {
        LOG.info("{call 月度统计报表查询:startDate=" + startDate + "，endDate=" + endDate + "}");
        ResponseDto<List<ReportOrderMonthDto>> response = new ResponseDto<List<ReportOrderMonthDto>>();
        response.setCode(EnumResultCode.RERULT_CODE_SUCCESS.getCode());
        response.setMessage("月度统计报表查询成功");
        Map<String, String> param = new HashMap<String, String>();
        param.put("startDate", startDate);
        param.put("endDate", endDate);
        try {
            List<ReportOrderMonthDto> data = orderService.getTotalByMonth(param);
            response.setData(data);
        } catch (Exception e) {
            LOG.error("月度统计报表查询失败：" + e.getMessage());
            response.setCode(EnumResultCode.RERULT_CODE_ERROR.getCode());
            response.setMessage("月度统计报表查询失败：" + e.getMessage());
        }
        LOG.info("{接口/report/monthQuery,响应结果：" + response.getMessage() + "}");
        return response;
    }

}
