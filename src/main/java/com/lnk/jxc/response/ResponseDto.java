package com.lnk.jxc.response;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.lnk.jxc.enums.EnumResultCode;

/**
 * <p>title:响应模板类</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年3月28日 下午5:09:53
 */
public class ResponseDto<T> implements Serializable {

    private static final long serialVersionUID = -5720909953535692753L;
    private Integer code = EnumResultCode.RERULT_CODE_SUCCESS.getCode();
    private String message = "请求响应成功";
    private T data;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("code", code).append("message", message)
                .append("data", data).toString();
    }
}
