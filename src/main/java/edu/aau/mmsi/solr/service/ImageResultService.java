package edu.aau.mmsi.solr.service;

import edu.aau.mmsi.solr.model.ImageResult;

import java.io.IOException;
import java.util.List;

/**
 * Created by Michael on 23.06.2017.
 */
public interface ImageResultService {

    void indexFromFile(String filename) throws IOException;
    void index(List<ImageResult> results);
    void index(ImageResult result);
    void deleteAll();
}
