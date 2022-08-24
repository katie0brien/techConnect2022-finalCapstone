package com.techelevator.model.dao;

import com.techelevator.model.dto.Landmark;

import java.util.List;

public interface LandmarkDAO {

    List<Landmark> getAllLandmarks();
    List<Landmark> getLandmarksByCity(String city);
    List<Landmark> getLandmarksByCountry(String country);
    List<Landmark> getLandmarksByState(String stateOrRegion);
    List<Landmark> getLandmarksByUser(int userID);
    List<Landmark> getLandmarkByItineraryId(int itineraryId);
    Landmark getLandmarkByID(int id);
    void editLandmark(Landmark landmark);
    void deleteLandmark(long id);
    int addLandmark(Landmark landmark);
    void addLandmarkToRelatorTable(int landmarkId, int itineraryId);
    List<String> getLandmarkAddressByItineraryId(int itineraryId);
    void updateThumbsUp(Boolean choice, int landmark_id);
    List<Landmark> getFavorites(String userName);
    void editTravelNotes(String notes, int id);
    void addImageName(String imageName, int id);
}
