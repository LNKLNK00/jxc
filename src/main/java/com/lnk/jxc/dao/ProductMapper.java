package com.lnk.jxc.dao;

import java.util.List;

import com.lnk.jxc.model.Product;

/**
 * <p>title:商品数据访问类</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年4月4日 下午8:50:52
 */
public interface ProductMapper {

    /**
     * 添加商品
     * @param Product product
     * @return int
     */
    int addProduct(Product product);

    /**
     * 根据ID查询商品
     * @param
     * @return List<Product>
     */
    Product selectById(Integer id);

    /**
     * 查询所有商品
     * @param
     * @return List<Product>
     */
    List<Product> selectAllProduct();

    /**
     * 查询所有上架商品
     * @param
     * @return List<Product>
     */
    List<Product> selectOnLineProduct();

    /**
     * 根据ID修改商品信息
     * @param Product product
     * @return int
     */
    int updateProductById(Product product);

    /**
     * 上、下架商品
     * @param Product product
     * @return int
     */
    int updateStatusById(Product product);

    /**
     * 添加库存
     * @param Product product
     * @return int
     */
    int addNumById(Product product);

    /**
     * 减少库存
     * @param Product product
     * @return int
     */
    int subNumById(Product product);
}