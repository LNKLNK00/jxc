package com.lnk.jxc.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import com.lnk.jxc.util.HttpRequestUtil;

/**
 * 登陆状态拦截器
 * @author Administrator
 */
public class LoginInterceptor implements HandlerInterceptor {

    private final static Logger LOG = LoggerFactory.getLogger(LoginInterceptor.class);

    @Autowired
    private RequestMappingHandlerMapping requestMappingHandlerMapping;

    /**
     * 验证是否登陆
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("userId") == null) {
            //不符合条件的，跳转到登录界面 
            boolean isAjax = HttpRequestUtil.isAjax(request);
            LOG.info("isAjax------------" + isAjax);
            if (isAjax) {
                requestMappingHandlerMapping.getHandlerMethods();
                //request.getRequestURI();
                request.getRequestDispatcher("/login-need-login").forward(request, response);
            } else {
                request.getRequestDispatcher("/login-index.html").forward(request, response);
            }
            return false;
        } else {
            return true;
        }
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {

    }

}
