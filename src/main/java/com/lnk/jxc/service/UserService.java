package com.lnk.jxc.service;

import com.lnk.jxc.model.User;

/**
 * <p>title:用户服务接口</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年3月28日 下午5:54:47
 */
public interface UserService {

    /**
     * 用户登录
     * @param User user
     * @return User
     */
    User login(User user);
}
