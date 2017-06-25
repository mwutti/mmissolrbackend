package edu.aau.mmsi.solr.service;

import edu.aau.mmsi.solr.model.ImageResult;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.io.IOException;
import java.util.List;

/**
 * Created by Michael on 23.06.2017.
 */
public interface SolrService {

    /**
     * Indexes all data located in source file
     * @param filename Filename of index data located at resources/results/
     * @throws IOException
     */
    void indexFromFile(String filename) throws IOException;

    /**
     * Indexes all ImageResult Objects
     * @param results ImageResults
     */
    void index(List<ImageResult> results);

    /**
     * Indexes a single ImageResult
     * @param result ImageResult
     */
    void index(ImageResult result);

    /**
     * Deletes all Data in core
     */
    void deleteAll();

    /**
     *
     * @param searchTerm searchTearm
     * @param pageable Pageable
     * @return All documents with Label1 == SearchTerm
     */
    Page<ImageResult> findByLabel1In(String searchTerm, Pageable pageable);

    /**
     *
     * @param searchTerm searchTearm
     * @param pageable Pageable
     * @return All documents that contains searchTerm in Label1
     */
    Page<ImageResult> findByLabel1Contains(String searchTerm, PageRequest pageable);

    /**
     *
     * @param pageable Pageable
     * @return All documents
     */
    Page<ImageResult> findAll(Pageable pageable);
}
