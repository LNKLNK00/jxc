package com.lnk.jxc.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lnk.jxc.response.HomeChartDto;
import com.lnk.jxc.response.HomeReportDto;
import com.lnk.jxc.response.OrderProductDto;
import com.lnk.jxc.service.OrderService;
import com.lnk.jxc.service.ProductService;

/**
 * <p>title:首页控制类</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年3月28日 下午4:23:32
 */
@Controller
public class IndexController {

    private final static Logger LOG = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    private ProductService productService;
    @Autowired
    private OrderService orderService;

    @RequestMapping("/index.html")
    public String login() {
        LOG.info("进入首页");
        return "index";
    }

    @RequestMapping("/home.html")
    public String home(ModelMap map) {
        LOG.info("进入主页");
        List<OrderProductDto> productList = productService.getTop5();
        HomeReportDto home = orderService.getTotal();
        int saleCount = productService.getTotalNum();
        int onLineCount = productService.getOnLineCount();
        home.setSaleCount(saleCount);
        home.setOnLineCount(onLineCount);
        List<HomeChartDto> chartList = orderService.getTotalNearHalfMonth();
        map.addAttribute("productList", productList);
        map.addAttribute("home", home);
        map.addAttribute("chartList", chartList);
        return "home";
    }
}
