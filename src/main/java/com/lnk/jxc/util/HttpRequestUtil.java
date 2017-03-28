package com.lnk.jxc.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.WebRequest;

/**
 * HTTP请求工具类包
 * @author Administrator
 */
public class HttpRequestUtil {

    /**
     * 判断是否为ajax请求
     * @param request
     * @return
     */
    public static boolean isAjax(HttpServletRequest request) {
        return request.getHeader("X-Requested-With") != null
                && "XMLHttpRequest".equals(request.getHeader("X-Requested-With").toString());
    }

    /**
     * @param webRequest
     * @return
     */
    public static boolean isAjaxRequest(WebRequest webRequest) {
        String requestedWith = webRequest.getHeader("X-Requested-With");
        return requestedWith != null ? "XMLHttpRequest".equals(requestedWith) : false;
    }

}
