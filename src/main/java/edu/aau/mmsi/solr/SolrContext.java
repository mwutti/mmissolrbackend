package edu.aau.mmsi.solr;

import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.data.solr.repository.config.EnableSolrRepositories;

import javax.annotation.Resource;

/**
 * Created by Michael on 23.06.2017.
 */
@Configuration
@EnableSolrRepositories(basePackages={"edu.aau.mmsi.solr.rep"}, multicoreSupport=true)
public class SolrContext {
    static final String SOLR_HOST = "solr.host";

    @Resource
    private Environment environment;

    @Bean
    public HttpSolrServer solrServer() {
        String solrHost = environment.getRequiredProperty(SOLR_HOST);
        return new HttpSolrServer(solrHost);
    }

    @Bean
    public SolrClient solrClient() {
        String solrHost = environment.getRequiredProperty(SOLR_HOST);
        return new HttpSolrClient(solrHost);
    }
}
