package edu.aau.mmsi.solr.rep;

import edu.aau.mmsi.solr.model.ImageResult;
import edu.aau.mmsi.solr.model.SearchableImageResultDefinition;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.solr.core.query.result.FacetPage;
import org.springframework.data.solr.repository.Facet;
import org.springframework.data.solr.repository.Query;
import org.springframework.data.solr.repository.SolrCrudRepository;

import java.util.Collection;

/**
 * Created by Michael on 23.06.2017.
 */
public interface ImageResultRepository extends SolrCrudRepository<ImageResult, String> {

    Page<ImageResult> findByLabel1In(Collection<String> strings, Pageable pageable);

    Page<ImageResult> findByLabel1Contains(Collection<String> strings, Pageable pageable);

    @Query(value = "*:*")
    @Facet(fields = SearchableImageResultDefinition.LABEL1_FIELD_NAME, limit = 5000)
    FacetPage<ImageResult> findImageResultP1Facets(Pageable pageable);
}
