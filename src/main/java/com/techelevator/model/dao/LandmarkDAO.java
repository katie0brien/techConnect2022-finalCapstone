package com.techelevator.model.dao;

import com.techelevator.model.dto.Landmark;

import java.util.List;

public interface LandmarkDAO {

    List<Landmark> getAllLandmarks();
    List<Landmark> getLandmarksByCity();
    Landmark getLandmarkByID();
    void editLandmark(Landmark landmark);
    void deleteLandmark(long id);
    void addLandmark(Landmark landmark);
}
