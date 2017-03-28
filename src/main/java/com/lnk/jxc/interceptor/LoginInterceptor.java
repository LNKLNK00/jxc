package com.lnk.jxc.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.lnk.jxc.util.HttpRequestUtil;

/**
 * <p>title:登录拦截器</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年3月28日 下午5:02:55
 */
public class LoginInterceptor implements HandlerInterceptor {

    private final static Logger LOG = LoggerFactory.getLogger(LoginInterceptor.class);

    /**
     * 验证是否登陆
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("USERINFO") == null) {
            //不符合条件的，跳转到登录界面 
            boolean isAjax = HttpRequestUtil.isAjax(request);
            LOG.info("isAjax=" + isAjax);
            if (isAjax) {
                request.getRequestDispatcher("/ajaxLogin").forward(request, response);
            } else {
                request.getRequestDispatcher("/login.html").forward(request, response);
            }
            return false;
        }
        return true;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {

    }

}
