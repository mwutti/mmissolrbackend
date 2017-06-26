package edu.aau.mmsi.solr.controller;

import edu.aau.mmsi.solr.service.SolrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

/**
 * Created by Michael on 23.06.2017.
 */
@Controller
public class MainController {
    @Autowired
    private SolrService solrService;

    @RequestMapping("/deletalldataincoreandindexfromfile")
    @ResponseBody
    public void deletalldataincoreandindexfromfilelol() throws IOException {
        solrService.deleteAll();
        solrService.indexFromFile("classify_results.txt");
    }

    @RequestMapping(method = RequestMethod.GET, value="/index")
    public String showIndexPage(Model model, @RequestParam(value="searchTerm", required = false, defaultValue = "lake") String searchTerm,
                                @RequestParam(value = "page", defaultValue = "0") Integer page) {
//        PageRequest pageable = new PageRequest(0, 50, new Sort(Sort.Direction.DESC, "p1"));
//        Page<ImageResult> sorted = solrService.findByLabel1Contains(searchTerm, pageable);
        model.addAttribute("result", solrService.findByLabel1Contains(searchTerm, new PageRequest(page, 100)));
        model.addAttribute("page", page);
        model.addAttribute("searchTerm", searchTerm);
        return "index";
    }


    @RequestMapping(method = RequestMethod.GET, value = "/page")
    public String showSinglePage(Model model, @RequestParam("searchTerm") String searchTerm, @RequestParam("page") Integer page) {
        model.addAttribute("result", solrService.findByLabel1Contains(searchTerm, new PageRequest(page, 100)));
        return "page";
    }


}
