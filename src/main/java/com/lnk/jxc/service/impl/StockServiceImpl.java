package com.lnk.jxc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lnk.jxc.dao.ProductMapper;
import com.lnk.jxc.dao.StockMapper;
import com.lnk.jxc.model.Product;
import com.lnk.jxc.model.Stock;
import com.lnk.jxc.model.User;
import com.lnk.jxc.service.StockService;

@Service
public class StockServiceImpl implements StockService {

    @Autowired
    private StockMapper stockMapper;
    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<Stock> getStockList() {
        return stockMapper.selectAll();
    }

    @Override
    @Transactional
    public Boolean addStock(Product product, User user) {
        Product product2 = productMapper.selectById(product.getId());
        boolean result1 = productMapper.updateNumById(product) > 0;
        Stock stock = new Stock();
        stock.setProductId(product2.getId());
        stock.setProductName(product2.getNames());
        stock.setNum(product.getNum());
        stock.setUserId(user.getId());
        stock.setUserName(user.getUsername());
        boolean result2 = stockMapper.insert(stock) > 0;
        return result1 && result2;
    }

}
