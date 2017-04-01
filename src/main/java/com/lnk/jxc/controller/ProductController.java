package com.lnk.jxc.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <p>title:产品控制类</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年4月1日 上午10:39:51
 */
@Controller
@RequestMapping("/product")
public class ProductController {

    private final static Logger LOG = LoggerFactory.getLogger(ProductController.class);

    @GetMapping("/index.html")
    public String index() {
        LOG.info("进入商品管理页面");
        return "product";
    }

}
