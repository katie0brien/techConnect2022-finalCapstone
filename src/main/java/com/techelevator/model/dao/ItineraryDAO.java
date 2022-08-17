package com.techelevator.model.dao;

import com.techelevator.model.dto.Itinerary;

import java.util.List;

public interface ItineraryDAO {

    List<Itinerary> getItinerariesByUserName(String userName);
    void editItineraryName(String name);
    void deleteLandmarkFromItinerary(int itineraryId, String landmarkId);
    String createItinerary(String name);
    // void addItineraryIdToRelatorTable(String itineraryId, String userId);

}
