package com.lnk.jxc.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lnk.jxc.dao.ProductMapper;
import com.lnk.jxc.model.Product;
import com.lnk.jxc.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

    private final static Logger LOG = LoggerFactory.getLogger(ProductService.class);

    @Autowired
    private ProductMapper productMapper;

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
    public int updateStatusById(Integer status) {
        return productMapper.updateStatusById(status);
    }

    @Override
    public int updateNumById(Integer num) {
        return productMapper.updateNumById(num);
    }

}
