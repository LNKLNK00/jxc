package com.lnk.jxc.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lnk.jxc.dao.OrderProductMapper;
import com.lnk.jxc.dao.ProductMapper;
import com.lnk.jxc.model.Product;
import com.lnk.jxc.response.OrderProductDto;
import com.lnk.jxc.response.ReportProductSalesRankDto;
import com.lnk.jxc.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

    private final static Logger LOG = LoggerFactory.getLogger(ProductService.class);

    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private OrderProductMapper orderProductMapper;

    @Override
    public int addProduct(Product product) {
        return productMapper.addProduct(product);
    }

    @Override
    public List<Product> selectAllProduct() {
        return productMapper.selectAllProduct();
    }

    @Override
    public int updateProductById(Product product) {
        return productMapper.updateProductById(product);
    }

    @Override
    public int updateStatusById(Product product) {
        return productMapper.updateStatusById(product);
    }

    @Override
    public List<Product> selectOnLineProduct() {
        return productMapper.selectOnLineProduct();
    }

    @Override
    public Boolean isOnline(Integer id) {
        Product product = productMapper.selectById(id);
        if (product != null && product.getStatus() == 1) {
            return true;
        }
        return false;
    }

    @Override
    public List<OrderProductDto> getTop5() {
        return orderProductMapper.selectTop5();
    }

    @Override
    public int getTotalNum() {
        return orderProductMapper.selectTotalNum();
    }

    @Override
    public int getOnLineCount() {
        return productMapper.selectOnLineCount();
    }

    @Override
    public List<ReportProductSalesRankDto> salesRank(Map<String, String> param) {
        return orderProductMapper.selectSalesRank(param);
    }

    @Override
    public List<OrderProductDto> getOrderProductList() {
        return orderProductMapper.selectAll();
    }

}
