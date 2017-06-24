package edu.aau.mmsi.solr.model;

import org.apache.solr.client.solrj.beans.Field;
import org.springframework.data.annotation.Id;
import org.springframework.data.solr.core.mapping.Indexed;
import org.springframework.data.solr.core.mapping.SolrDocument;

/**
 * Created by Michael on 23.06.2017.
 */
@SolrDocument(solrCoreName = "core0")
public class ImageResult implements SearchableImageResultDefinition {
    @Id
    @Indexed
    private String id;

    @Field
    private String url_q;

    @Field
    private String url_o;

    @Indexed(LABEL1_FIELD_NAME)
    private String label1;

    @Field(LABEL2_FIELD_NAME)
    private String label2;

    @Field(LABEL3_FIELD_NAME)
    private String label3;

    @Indexed(P1_FIELD_NAME)
    private Double p1;

    @Field
    private Double p2;

    @Field
    private Double p3;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUrl_q() {
        return url_q;
    }

    public void setUrl_q(String url_q) {
        this.url_q = url_q;
    }

    public String getUrl_o() {
        return url_o;
    }

    public void setUrl_o(String url_o) {
        this.url_o = url_o;
    }

    public String getLabel1() {
        return label1;
    }

    public void setLabel1(String label1) {
        this.label1 = label1;
    }

    public String getLabel2() {
        return label2;
    }

    public void setLabel2(String label2) {
        this.label2 = label2;
    }

    public String getLabel3() {
        return label3;
    }

    public void setLabel3(String label3) {
        this.label3 = label3;
    }

    public Double getP1() {
        return p1;
    }

    public void setP1(Double p1) {
        this.p1 = p1;
    }

    public Double getP2() {
        return p2;
    }

    public void setP2(Double p2) {
        this.p2 = p2;
    }

    public Double getP3() {
        return p3;
    }

    public void setP3(Double p3) {
        this.p3 = p3;
    }
}
