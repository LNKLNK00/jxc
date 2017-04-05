package com.lnk.jxc.service;

import java.util.List;

import com.lnk.jxc.model.Product;

/**
 * <p>title:商品数据访问类</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年4月4日 下午8:50:52
 */
public interface ProductService {

    /**
     * 添加商品
     * @param Product product
     * @return int
     */
    int addProduct(Product product);

    /**
     * 查询所有商品
     * @param
     * @return List<Product>
     */
    List<Product> selectAllProduct();

    /**
     * 根据ID修改商品信息
     * @param Product product
     * @return int
     */
    int updateProductById(Product product);

    /**
     * 上、下架商品
     * @param Integer status
     * @return int
     */
    int updateStatusById(Integer status);

    /**
     * 修改库存
     * @param Integer num
     * @return int
     */
    int updateNumById(Integer num);
}