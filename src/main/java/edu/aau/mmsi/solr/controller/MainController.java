package edu.aau.mmsi.solr.controller;

import edu.aau.mmsi.solr.service.SolrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by Michael on 23.06.2017.
 */
@Controller
public class MainController {
    private final static Integer PAGE_SIZE = 50;
    @Autowired
    private SolrService solrService;

    @RequestMapping("/deletalldataincoreandindexfromfile")
    @ResponseBody
    public void deletalldataincoreandindexfromfilelol() throws IOException {
        solrService.deleteAll();
        solrService.indexFromFile("classify_results.txt");
    }

    @RequestMapping(method = RequestMethod.GET, value={"/", ""})
    public String showIndexPage(Model model, @RequestParam(value="searchTerm", required = false, defaultValue = "lake") String searchTerm,
                                @RequestParam(value = "page", defaultValue = "0") Integer page) {
        model.addAttribute("result", solrService.findByLabel1Contains(searchTerm, new PageRequest(page, PAGE_SIZE, new Sort(Sort.Direction.DESC, "p1"))));
        model.addAttribute("page", page);
        model.addAttribute("searchTerm", searchTerm);
        return "index";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/page")
    public String showSinglePage(Model model, @RequestParam("searchTerm") String searchTerm, @RequestParam("page") Integer page) {
        model.addAttribute("result", solrService.findByLabel1Contains(searchTerm, new PageRequest(page, PAGE_SIZE,  new Sort(Sort.Direction.DESC, "p1"))));
        return "page";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/labels")
    @ResponseBody
    public List<String> getLabelFacets() {
        return solrService.findImageResultP1Facets();
    }

    @RequestMapping(method = RequestMethod.GET, value = "/presentation")
    public String getPresentation() {
        return "presentation";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/label-data")
    @ResponseBody
    public List<Map<String,Long>> getLabelData() {
        return solrService.getLabelData();
    }
}
