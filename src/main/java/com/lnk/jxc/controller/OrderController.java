package com.lnk.jxc.controller;

import java.util.ArrayList;
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

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.lnk.jxc.enums.EnumResultCode;
import com.lnk.jxc.model.OrderInfo;
import com.lnk.jxc.model.Product;
import com.lnk.jxc.model.User;
import com.lnk.jxc.response.OrderPrintDto;
import com.lnk.jxc.response.ResponseDto;
import com.lnk.jxc.service.OrderService;
import com.lnk.jxc.service.ProductService;

/**
 * <p>title:订单控制类</p>
 * <p>description:</p>
 * @author Nick Liu
 * @createTime 2017年4月12日 下午4:44:51
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    private final static Logger LOG = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private ProductService productService;
    @Autowired
    private OrderService orderService;

    @GetMapping("/index.html")
    public String index(ModelMap map) {
        LOG.info("进入销售管理页面");
        List<Product> productList = productService.selectOnLineProduct();
        map.addAttribute("productList", productList);
        return "order";
    }

    @PostMapping("/toOrder")
    @ResponseBody
    public ResponseDto<OrderInfo> toOrder(String products, HttpSession session) {
        LOG.info("{call 下单:" + products + "}");
        JSONArray array = JSONArray.parseArray(products);
        ResponseDto<OrderInfo> response = new ResponseDto<OrderInfo>();
        List<Product> productList = new ArrayList<Product>();
        for (Object object : array) {
            JSONObject obj = (JSONObject) object;
            Product product = new Product();
            product.setId(obj.getInteger("id"));
            product.setNum(obj.getInteger("num"));
            productList.add(product);
        }
        response.setCode(EnumResultCode.RERULT_CODE_SUCCESS.getCode());
        response.setMessage("下单成功");
        try {
            OrderInfo orderInfo = orderService.toOrder(productList, (User) session.getAttribute("USERINFO"));
            if (orderInfo != null) {
                response.setData(orderInfo);
            } else {
                response.setCode(EnumResultCode.RERULT_CODE_ERROR.getCode());
                response.setMessage("下单失败");
            }
        } catch (Exception e) {
            response.setCode(EnumResultCode.RERULT_CODE_ERROR.getCode());
            response.setMessage("下单异常");
            LOG.error("下单异常：" + e.getMessage());
        }
        LOG.info("{接口/order/toOrder,响应结果：" + response.getMessage() + "}");
        return response;
    }

    @GetMapping("/print.html")
    public String print(ModelMap map, Integer id) {
        LOG.info("进入订单打印页面");
        OrderPrintDto printDto = orderService.getPrintList(id);
        map.addAttribute("printDto", printDto);
        return "print";
    }
}
