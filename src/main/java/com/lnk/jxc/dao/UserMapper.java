package com.lnk.jxc.dao;

import com.lnk.jxc.model.User;

/**
 * <p>title:用户数据访问对象</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年3月28日 下午5:52:25
 */
public interface UserMapper {

    /**
     * 用户登录
     * @param User user
     * @return User
     */
    User login(User user);
}