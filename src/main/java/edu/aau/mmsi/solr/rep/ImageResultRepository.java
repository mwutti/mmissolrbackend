package edu.aau.mmsi.solr.rep;

import edu.aau.mmsi.solr.model.ImageResult;
import org.springframework.data.solr.repository.SolrCrudRepository;

/**
 * Created by Michael on 23.06.2017.
 */
public interface ImageResultRepository extends SolrCrudRepository<ImageResult, String> {

}
