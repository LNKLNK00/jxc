package com.lnk.jxc.service;

import java.util.List;

import com.lnk.jxc.model.Product;
import com.lnk.jxc.response.OrderProductDto;

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
     * 查询商品是否上架
     * @param
     * @return Boolean
     */
    Boolean isOnline(Integer id);

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
     * 查询上架商品总数
     * @param
     * @return int
     */
    int getOnLineCount();

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
     * 获取销量前五名的商品
     * @param
     * @return List<OrderProductDto>
     */
    List<OrderProductDto> getTop5();

    /**
     * 查询已销售商品总数
     * @param
     * @return int
     */
    int getTotalNum();

}