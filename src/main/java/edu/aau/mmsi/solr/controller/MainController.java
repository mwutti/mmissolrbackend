package edu.aau.mmsi.solr.controller;

import edu.aau.mmsi.solr.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

/**
 * Created by Michael on 23.06.2017.
 */
@Controller
public class MainController {
    private ProductService productService;

    @RequestMapping("/hello")
    public String test() {
        System.out.println(productService.findById("1").getName());
        return "test";
    }

    @GetMapping("/test")
    public String test1(Map<String, Object> model) {
        return "test";
    }

    @Autowired
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }
}
