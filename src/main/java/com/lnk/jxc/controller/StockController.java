package com.lnk.jxc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.lnk.jxc.model.Stock;
import com.lnk.jxc.model.User;
import com.lnk.jxc.response.ResponseDto;
import com.lnk.jxc.service.ProductService;
import com.lnk.jxc.service.StockService;

/**
 * <p>title:进货控制类</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年4月10日 下午2:48:56
 */
@Controller
@RequestMapping("/stock")
public class StockController {

    private final static Logger LOG = LoggerFactory.getLogger(StockController.class);

    @Autowired
    private ProductService productService;

    @Autowired
    private StockService stockService;

    @GetMapping("/index.html")
    public String index(ModelMap map) {
        LOG.info("进入库存管理页面");
        List<Product> productList = productService.selectOnLineProduct();
        List<Stock> stockList = stockService.getStockList();
        map.addAttribute("productList", productList);
        map.addAttribute("stockList", stockList);
        return "stock";
    }

    @PostMapping("/addStock")
    @ResponseBody
    public ResponseDto<Boolean> addProduct(Product product, HttpSession session) {
        LOG.info("{call 进货:" + product + "}");
        ResponseDto<Boolean> response = new ResponseDto<Boolean>();
        response.setCode(EnumResultCode.RERULT_CODE_SUCCESS.getCode());
        response.setMessage("进货成功");
        if (product == null || product.getId() == null || product.getNum() == null || product.getNum() <= 0) {
            response.setCode(EnumResultCode.RERULT_CODE_ERROR.getCode());
            response.setMessage("参数为空！");
            return response;
        }
        try {
            if (!productService.isOnline(product.getId())) {
                response.setCode(EnumResultCode.RERULT_CODE_ERROR.getCode());
                response.setMessage("改商品已下架！");
                return response;
            }
            Boolean data = stockService.addStock(product, (User) session.getAttribute("USERINFO"));
            if (!data) {
                response.setCode(EnumResultCode.RERULT_CODE_ERROR.getCode());
                response.setMessage("进货失败！");
            }
        } catch (Exception e) {
            LOG.error("进货失败：" + e.getMessage());
            response.setCode(EnumResultCode.RERULT_CODE_ERROR.getCode());
            response.setMessage("进货失败！");
        }
        LOG.info("{接口/stock/addStock,响应结果：" + response.getMessage() + "}");
        return response;
    }
}
