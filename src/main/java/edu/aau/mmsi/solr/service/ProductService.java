package edu.aau.mmsi.solr.service;

import edu.aau.mmsi.solr.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.solr.core.query.result.FacetPage;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

/**
 * Created by Michael on 23.06.2017.
 */

public interface ProductService {
    int DEFAULT_PAGE_SIZE = 3;

    Page<Product> findByName(String searchTerm, Pageable pageable);

    Product findById(String id);

    FacetPage<Product> autocompleteNameFragment(String fragment, Pageable pageable);
}
