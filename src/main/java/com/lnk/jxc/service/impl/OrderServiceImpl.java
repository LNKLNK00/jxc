package com.lnk.jxc.service.impl;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lnk.jxc.dao.OrderInfoMapper;
import com.lnk.jxc.dao.OrderProductMapper;
import com.lnk.jxc.dao.ProductMapper;
import com.lnk.jxc.model.OrderInfo;
import com.lnk.jxc.model.OrderProduct;
import com.lnk.jxc.model.Product;
import com.lnk.jxc.model.User;
import com.lnk.jxc.response.HomeChartDto;
import com.lnk.jxc.response.HomeReportDto;
import com.lnk.jxc.response.OrderPrintDto;
import com.lnk.jxc.service.OrderService;
import com.lnk.jxc.util.DateUtil;

@Service
public class OrderServiceImpl implements OrderService {

    private final static Logger LOG = LoggerFactory.getLogger(OrderServiceImpl.class);

    @Autowired
    private OrderInfoMapper orderInfoMapper;
    @Autowired
    private OrderProductMapper orderProductMapper;
    @Autowired
    private ProductMapper productMapper;

    @Override
    @Transactional
    public OrderInfo toOrder(List<Product> productList, User user) {
        OrderInfo orderInfo = new OrderInfo();
        List<OrderProduct> orderProductList = new ArrayList<OrderProduct>();
        DecimalFormat fnum = new DecimalFormat("##0.00");
        //订单总价
        float price = 0;
        //订单收益
        float profit = 0;
        //计算订单信息
        for (Product product : productList) {
            if (productMapper.subNumById(product) > 0) {
                int num = product.getNum();
                product = productMapper.selectById(product.getId());
                price += Float.parseFloat(fnum.format(num * product.getPrice()));
                profit += Float.parseFloat(fnum.format(num * (product.getPrice() - product.getBid())));
                OrderProduct orderProduct = new OrderProduct();
                orderProduct.setNum(num);
                orderProduct.setPrice(product.getPrice());
                orderProduct.setBid(product.getBid());
                orderProduct.setProductId(product.getId());
                orderProduct.setRate(1f);
                orderProductList.add(orderProduct);
            } else {
                LOG.info("商品：" + product.getId() + "库存不足");
                return null;
            }
        }
        orderInfo.setPrice(price);
        orderInfo.setProfit(profit);
        orderInfo.setUserId(user.getId());
        orderInfo.setUserName(user.getUsername());
        orderInfo.setOrderNo("NO" + System.currentTimeMillis());
        orderInfoMapper.insert(orderInfo);
        for (OrderProduct orderProduct : orderProductList) {
            orderProduct.setOrderId(orderInfo.getId());
        }
        orderProductMapper.insertBatch(orderProductList);
        return orderInfo;
    }

    @Override
    public OrderPrintDto getPrintList(Integer orderId) {
        OrderInfo orderInfo = orderInfoMapper.selectByPrimaryKey(orderId);
        OrderPrintDto print = null;
        if (orderInfo != null) {
            print = new OrderPrintDto();
            print.setOrderNo(orderInfo.getOrderNo());
            print.setCreateTime(orderInfo.getCreateTime());
            print.setPrice(orderInfo.getPrice());
            print.setUserName(orderInfo.getUserName());
            print.setProductList(orderProductMapper.selectByOrderId(orderInfo.getId()));
        }
        return print;
    }

    @Override
    public HomeReportDto getTotal() {
        return orderInfoMapper.selectTotal();
    }

    @Override
    public List<HomeChartDto> getTotalNearHalfMonth() {
        List<HomeChartDto> list = new ArrayList<HomeChartDto>();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.DAY_OF_YEAR, -15);
        for (int i = 0; i < 15; i++) {
            calendar.add(Calendar.DAY_OF_YEAR, 1);
            HomeChartDto dto = orderInfoMapper.selectTotalByDate(DateUtil.format(calendar.getTime(), "YYYY-MM-dd"));
            dto.setDate(DateUtil.format(calendar.getTime(), "MM-dd"));
            list.add(dto);
        }
        return list;
    }

}
