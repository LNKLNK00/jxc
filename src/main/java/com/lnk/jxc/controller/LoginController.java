package com.lnk.jxc.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lnk.jxc.model.User;
import com.lnk.jxc.service.UserService;

/**
 * <p>title:登录控制类</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年3月28日 下午2:55:00
 */
@Controller
public class LoginController {

    private final static Logger LOG = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private UserService userService;

    @RequestMapping("/login.html")
    public String login(HttpSession session) {
        if (session.getAttribute("USERINFO") != null) {
            LOG.info("用户已登录，跳转到首页！");
            return "redirect:/index.html";
        }
        LOG.info("进入登录页面");
        return "login";
    }

    @PostMapping("/toLogin.html")
    public String toLogin(User user, HttpSession session, ModelMap model) {
        LOG.info("登录验证{" + user + "}");
        user = userService.login(user);
        if (user == null || user.getId() <= 0) {
            model.addAttribute("error_message", "用户名或密码错误！");
            LOG.info("登录失败，用户名或密码错误！");
            return "login";
        }
        session.setAttribute("USERINFO", user);
        LOG.info("用户:" + user.getUsername() + " 登录成功，跳转到首页！");
        return "redirect:/index.html";
    }

    @GetMapping("/logout.html")
    public String logout(HttpSession session) {
        session.removeAttribute("USERINFO");
        return "redirect:/index.html";
    }
}
