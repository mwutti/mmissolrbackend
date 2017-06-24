package edu.aau.mmsi.solr.service;

import edu.aau.mmsi.solr.model.ImageResult;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.io.IOException;
import java.util.List;

/**
 * Created by Michael on 23.06.2017.
 */
public interface SolrService {

    void indexFromFile(String filename) throws IOException;
    void index(List<ImageResult> results);
    void index(ImageResult result);
    void deleteAll();
    Page<ImageResult> findByLabel1In(String searchTerm, Pageable pageable);
}
