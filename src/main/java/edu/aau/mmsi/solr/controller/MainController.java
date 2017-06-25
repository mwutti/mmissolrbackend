package edu.aau.mmsi.solr.controller;

import edu.aau.mmsi.solr.service.SolrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    public String showIndexPage(Model model) {
//        PageRequest pageable = new PageRequest(0, 50, new Sort(Sort.Direction.DESC, "p1"));
//        Page<ImageResult> sorted = solrService.findByLabel1Contains(searchTerm, pageable);
        model.addAttribute("page", solrService.findAll(new PageRequest(0, 100)));
        return "index";
    }

}
