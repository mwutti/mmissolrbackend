package edu.aau.mmsi.solr.controller;

import edu.aau.mmsi.solr.service.SolrService;
import edu.aau.mmsi.solr.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

/**
 * Created by Michael on 23.06.2017.
 */
@Controller
public class MainController {
    private ProductService productService;
    private SolrService solrService;

    @RequestMapping("/deletalldataincoreandindexfromfile")
    @ResponseBody
    public void deletalldataincoreandindexfromfilelol() throws IOException {
        solrService.deleteAll();
        solrService.indexFromFile("classify_results.txt");
    }

    @RequestMapping(method = RequestMethod.GET, value="/index")
    public String showIndexPage() {
        solrService.findByLabel1In("cat", new PageRequest(0,50));
        return "index";
    }

    @Autowired
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    @Autowired
    public void setSolrService(SolrService solrService) {
        this.solrService = solrService;
    }
}
