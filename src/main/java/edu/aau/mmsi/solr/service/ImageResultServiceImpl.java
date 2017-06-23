package edu.aau.mmsi.solr.service;

import edu.aau.mmsi.solr.model.ImageResult;
import edu.aau.mmsi.solr.rep.ImageResultRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by Michael on 23.06.2017.
 */
@Component
public class ImageResultServiceImpl implements ImageResultService {
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
}
