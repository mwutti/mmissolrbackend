package edu.aau.mmsi.solr;

import org.junit.Test;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import java.io.*;

/**
 * Created by Michael on 23.06.2017.
 */
public class TextFileTest {


    @Test
    public void testTextFile() throws IOException {

        indexFromFile("results/classify_results.txt");

    }

    public void indexFromFile(String filename) throws IOException {
        Resource resource = new ClassPathResource("results/" + filename);
        String line;
        String cvsSplitBy = " ";

        try (BufferedReader br = new BufferedReader(new FileReader(resource.getFile()))) {
            while ((line = br.readLine()) != null) {
                String[] result = line.split(cvsSplitBy);



            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
