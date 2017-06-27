package edu.aau.mmsi.solr.service;

import edu.aau.mmsi.solr.model.ImageResult;
import edu.aau.mmsi.solr.rep.ImageResultRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.solr.core.query.result.FacetFieldEntry;
import org.springframework.data.solr.core.query.result.FacetPage;
import org.springframework.data.solr.core.query.result.SolrResultPage;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;
import java.util.regex.Pattern;

/**
 * Created by Michael on 23.06.2017.
 */
@Component
public class SolrServiceImpl implements SolrService {
    private static final Pattern IGNORED_CHARS_PATTERN = Pattern.compile("\\p{Punct}");
    private ImageResultRepository imageResultRepository;

    @Override
    public void index(List<ImageResult> results) {
        imageResultRepository.save(results);
    }

    @Override
    public void index(ImageResult result) {
        imageResultRepository.save(result);
    }

    @Override
    public void deleteAll() {
        imageResultRepository.deleteAll();
    }

    @Override
    public Page<ImageResult> findByLabel1In(String searchTerm, Pageable pageable) {
        if (StringUtils.isEmpty(searchTerm)) {
            return new SolrResultPage<>(Collections.emptyList());
        }

        return imageResultRepository.findByLabel1In(Arrays.asList(searchTerm.split(" ")), pageable);
    }

    @Override
    public Page<ImageResult> findByLabel1Contains(String searchTerm, PageRequest pageable) {
        if (StringUtils.isEmpty(searchTerm)) {
            return new SolrResultPage<>(Collections.emptyList());
        }

        return imageResultRepository.findByLabel1Contains(Arrays.asList(searchTerm.split(" ")), pageable);
    }

    @Override
    public Page<ImageResult> findAll(Pageable pageable) {
        return imageResultRepository.findAll(pageable);
    }

    @Override
    public List<String> findImageResultP1Facets() {
        List<String> result = new ArrayList<>();
        FacetPage<ImageResult> facetPage = imageResultRepository.findImageResultP1Facets(new PageRequest(0, 1000));

        List<FacetFieldEntry> facetFieldEntries = facetPage.getFacetResultPage("l1").getContent();

        for(FacetFieldEntry entry : facetFieldEntries) {
            result.add(entry.getValue());
        }


        return result;
    }

    @Override
    public List<Map<String, Long>> getLabelData() {
        List<Map<String, Long>> result = new ArrayList<>();
        FacetPage<ImageResult> facetPage = imageResultRepository.findImageResultP1Facets(new PageRequest(0, 1000));

        List<FacetFieldEntry> facetFieldEntries = facetPage.getFacetResultPage("l1").getContent();

        Map<String, Long> totalCount = new HashMap<>();
        totalCount.put("count", facetPage.getTotalElements());
        result.add(totalCount);

        Map<String, Long> termVector = new HashMap<>();
        for(FacetFieldEntry entry : facetFieldEntries) {
            termVector.put(entry.getValue(), entry.getValueCount());
        }

        result.add(sortByValue(termVector));

        return result;
    }

    @Override
    public void indexFromFile(String filename) throws IOException {
        Resource resource = new ClassPathResource("results/" + filename);
        String line;
        String cvsSplitBy = " ";

        try (BufferedReader br = new BufferedReader(new FileReader(resource.getFile()))) {
            List<ImageResult> imageResults = new ArrayList<>();
            int i = 0;

            while ((line = br.readLine()) != null) {
                String[] result = line.split(cvsSplitBy);
                ImageResult imageResult = new ImageResult();
                imageResult.setId(UUID.randomUUID().toString());
                imageResult.setUrl_q(result[0]);
                imageResult.setLabel1(result[1]);
                imageResult.setP1(Double.parseDouble(result[2]));
                imageResult.setLabel2(result[3]);
                imageResult.setP2(Double.parseDouble(result[4]));
                imageResult.setLabel3(result[5]);
                imageResult.setP3(Double.parseDouble(result[6]));
                imageResult.setUrl_o(result[7]);
                imageResults.add(imageResult);

                i++;

                if (i % 100 == 0) {
                    index(imageResults);
                    imageResults = new ArrayList<>();
                    System.out.println("i:" + i);
                }

            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Autowired
    public void setImageResultRepository(ImageResultRepository imageResultRepository) {
        this.imageResultRepository = imageResultRepository;
    }

    private static <K, V> Map<K, V> sortByValue(Map<K, V> map) {
        List<Map.Entry<K, V>> list = new LinkedList<>(map.entrySet());
        Collections.sort(list, new Comparator<Object>() {
            @SuppressWarnings("unchecked")
            public int compare(Object o1, Object o2) {
                return ((Comparable<V>) ((Map.Entry<K, V>) (o1)).getValue()).compareTo(((Map.Entry<K, V>) (o2)).getValue());
            }
        });

        Map<K, V> result = new LinkedHashMap<>();
        for (Iterator<Map.Entry<K, V>> it = list.iterator(); it.hasNext();) {
            Map.Entry<K, V> entry = (Map.Entry<K, V>) it.next();
            result.put(entry.getKey(), entry.getValue());
        }

        return result;
    }
}
