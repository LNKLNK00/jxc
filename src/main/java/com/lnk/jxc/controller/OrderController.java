package com.lnk.jxc.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lnk.jxc.model.Product;
import com.lnk.jxc.service.ProductService;

/**
 * <p>title:订单控制类</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年4月12日 下午4:44:51
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    private final static Logger LOG = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private ProductService productService;

    @GetMapping("/index.html")
    public String index(ModelMap map) {
        LOG.info("进入销售管理页面");
        List<Product> productList = productService.selectOnLineProduct();
        map.addAttribute("productList", productList);
        return "order";
    }
}
