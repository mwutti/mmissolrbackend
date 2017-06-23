package edu.aau.mmsi.solr.rep;

import edu.aau.mmsi.solr.model.Product;
import edu.aau.mmsi.solr.model.SearchableProductDefinition;
import org.springframework.data.domain.Pageable;
import org.springframework.data.solr.core.query.result.FacetPage;
import org.springframework.data.solr.core.query.result.HighlightPage;
import org.springframework.data.solr.repository.Facet;
import org.springframework.data.solr.repository.Highlight;
import org.springframework.data.solr.repository.Query;
import org.springframework.data.solr.repository.SolrCrudRepository;

import java.util.Collection;

/**
 * Created by Michael on 23.06.2017.
 */
public interface ProductRepository extends SolrCrudRepository<Product, String> {
    @Highlight(prefix = "<b>", postfix = "</b>")
    @Query(fields = { SearchableProductDefinition.ID_FIELD_NAME, SearchableProductDefinition.NAME_FIELD_NAME,
            SearchableProductDefinition.PRICE_FIELD_NAME, SearchableProductDefinition.FEATURES_FIELD_NAME,
            SearchableProductDefinition.AVAILABLE_FIELD_NAME }, defaultOperator = org.springframework.data.solr.core.query.Query.Operator.AND)
    HighlightPage<Product> findByNameIn(Collection<String> names, Pageable page);

    @Facet(fields = { SearchableProductDefinition.NAME_FIELD_NAME })
    FacetPage<Product> findByNameStartsWith(Collection<String> nameFragments, Pageable pagebale);
}
