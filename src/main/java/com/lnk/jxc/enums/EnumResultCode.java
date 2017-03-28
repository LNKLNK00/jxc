package com.lnk.jxc.enums;

public enum EnumResultCode {
    //成功
    RERULT_CODE_SUCCESS(0), 
    //失败
    RERULT_CODE_ERROR(-1),
    //需要登陆
    RERULT_CODE_NEED_LOGIN(4);
    private int code;

    private EnumResultCode(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }
}
