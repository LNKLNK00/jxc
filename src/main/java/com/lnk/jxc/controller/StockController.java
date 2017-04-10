package com.lnk.jxc.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <p>title:进货控制类</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年4月10日 下午2:48:56
 */
@Controller
@RequestMapping("/stock")
public class StockController {

    private final static Logger LOG = LoggerFactory.getLogger(StockController.class);

    @GetMapping("/index.html")
    public String index(ModelMap map) {
        LOG.info("进入进货管理页面");
        //        List<Product> list = productService.selectAllProduct();
        //        map.addAttribute("productList", list);
        return "stock";
    }
}
