package com.techelevator.model.dto;

import java.util.List;

public class Itinerary {

    //what the class knows

    private String name;

    private List<String> landmarkIds;

    private String irineraryId;

    //constructor -- use default

    //what the class can do -- methods


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<String> getLandmarkIds() {
        return landmarkIds;
    }

    public void addLandmarkId(String landmarkId) {
        this.landmarkIds.add(landmarkId);
    }

    public String getIrineraryId() {
        return irineraryId;
    }

    public void setIrineraryId(String irineraryId) {
        this.irineraryId = irineraryId;
    }
}
