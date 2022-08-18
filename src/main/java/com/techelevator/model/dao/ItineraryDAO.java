package com.techelevator.model.dao;

import com.techelevator.model.dto.Itinerary;

import java.time.LocalDate;
import java.util.List;

public interface ItineraryDAO {

    List<Itinerary> getItinerariesByUserName(int userID);
    Itinerary getItineraryBy(int id);
    void editItinerary(Itinerary itinerary);
    void deleteLandmarkFromItinerary(int itineraryId, String landmarkId);
    void createItinerary(Itinerary itinerary, int userID);
    void addItineraryIdToRelatorTable(int itineraryId, int userId);
    void deleteItinerary(int id);
}
