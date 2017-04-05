package com.lnk.jxc.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lnk.jxc.enums.EnumResultCode;
import com.lnk.jxc.model.Product;
import com.lnk.jxc.response.ResponseDto;
import com.lnk.jxc.service.ProductService;

/**
 * <p>title:产品控制类</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年4月1日 上午10:39:51
 */
@Controller
@RequestMapping("/product")
public class ProductController {

    private final static Logger LOG = LoggerFactory.getLogger(ProductController.class);

    @Autowired
    private ProductService productService;

    @GetMapping("/index.html")
    public String index(ModelMap map) {
        LOG.info("进入商品管理页面");
        List<Product> list = productService.selectAllProduct();
        map.addAttribute("productList", list);
        return "product";
    }

    @PostMapping("/selectAllProduct")
    @ResponseBody
    public ResponseDto<List<Product>> selectAllProduct() {
        LOG.info("{call 查询所有商品}");
        ResponseDto<List<Product>> response = new ResponseDto<List<Product>>();
        response.setCode(EnumResultCode.RERULT_CODE_SUCCESS.getCode());
        response.setMessage("查询成功");
        try {
            List<Product> list = productService.selectAllProduct();
            response.setData(list);
        } catch (Exception e) {
            LOG.error("查询所有商品失败：" + e.getMessage());
            response.setCode(EnumResultCode.RERULT_CODE_ERROR.getCode());
            response.setMessage("查询所有商品失败：" + e.getMessage());
        }
        LOG.info("{查询所有商品,响应结果：" + response.getMessage() + "}");
        return response;
    }

}
