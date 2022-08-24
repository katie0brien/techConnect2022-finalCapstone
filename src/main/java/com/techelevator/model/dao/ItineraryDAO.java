package com.techelevator.model.dao;

import com.techelevator.model.dto.Itinerary;

import java.time.LocalDate;
import java.util.List;

public interface ItineraryDAO {

    List<Itinerary> getItinerariesByUserName(String userName);
    Itinerary getItineraryBy(int id);
    void editItinerary(Itinerary itinerary);
    void deleteLandmarkFromItinerary(int itineraryId, String landmarkId);
    void createItinerary(Itinerary itinerary, String userID);
    void addItineraryIdToRelatorTable(int itineraryId, String userId);
    void deleteItinerary(int id, String userId);
}
