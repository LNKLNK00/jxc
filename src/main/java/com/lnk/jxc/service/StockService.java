package com.lnk.jxc.service;

import java.util.List;

import com.lnk.jxc.model.Product;
import com.lnk.jxc.model.Stock;
import com.lnk.jxc.model.User;

/**
 * <p>title:库存接口服务类</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年4月12日 下午12:27:39
 */
public interface StockService {

    /**
     * 新增进货记录
     * @param
     * @return Boolean
     */
    Boolean addStock(Product product, User user);

    /**
     * 进货明细列表
     * @param
     * @return List<Stock>
     */
    List<Stock> getStockList();
}
