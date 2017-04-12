package com.lnk.jxc.dao;

import java.util.List;

import com.lnk.jxc.model.Stock;

/**
 * <p>title:库存数据访问类</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年4月12日 下午12:22:47
 */
public interface StockMapper {

    /**
     * 新增进货记录
     * @param
     * @return int
     */
    int insert(Stock record);

    /**
     * 进货明细列表
     * @param
     * @return List<Stock>
     */
    List<Stock> selectAll();
}