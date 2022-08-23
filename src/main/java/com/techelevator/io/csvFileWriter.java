package com.techelevator.io;

import java.io.*;
import java.util.List;

import com.techelevator.model.dao.LandmarkDAO;
import org.springframework.beans.factory.annotation.Autowired;

public class csvFileWriter {

    public csvFileWriter() {}

    //bringing in dao objects so we can get data from the backend
    LandmarkDAO landmarkDAO;

    @Autowired
    public csvFileWriter(LandmarkDAO landmarkDAO) throws FileNotFoundException {
        this.landmarkDAO = landmarkDAO;
    }

    public void makeFile(int itineraryId) {

        // creating this new csv file
        String csvFilePath = "~/Downloads/itinerary-" + itineraryId + ".csv";
        File csvFile = new File(csvFilePath);

        //getting the data from the DAO
        List<String> addresses = landmarkDAO.getLandmarkAddressByItineraryId(itineraryId);

        //iterating through each line and adding it to csv file
        try (PrintWriter writer = new PrintWriter(csvFile)) {
            for (int i = 0; i < addresses.size(); i++) {
                String line = addresses.remove(i);
                writer.println(line);
            }

        } catch (IOException e) {
            System.out.println("error");
        }

    }

}
