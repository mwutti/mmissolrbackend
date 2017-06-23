package edu.aau.mmsi.solr.controller;

import edu.aau.mmsi.solr.service.ImageResultService;
import edu.aau.mmsi.solr.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

/**
 * Created by Michael on 23.06.2017.
 */
@Controller
public class MainController {
    private ProductService productService;
    private ImageResultService imageResultService;

    @RequestMapping("/deletalldataincoreandindexfromfilelol")
    @ResponseBody
    public void deletalldataincoreandindexfromfilelol() throws IOException {
        /**
         * Uncomment the lines to remove all data from solr_core and reindex all data in
         * /ressources/results/classify_results.txt
         *
         *
         *
         * imageResultService.deleteAll();
         + imageResultService.indexFromFile("classify_results.txt");
         */
    }


    @Autowired
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    @Autowired
    public void setImageResultService(ImageResultService imageResultService) {
        this.imageResultService = imageResultService;
    }
}
