package com.lnk.jxc.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <p>title:首页控制类</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年3月28日 下午4:23:32
 */
@Controller
public class IndexController {

    private final static Logger LOG = LoggerFactory.getLogger(LoginController.class);

    @RequestMapping("/index.html")
    public String login() {
        LOG.info("进入首页");
        return "index";
    }

    @RequestMapping("/home.html")
    public String home() {
        LOG.info("进入主页");
        return "home";
    }
}
