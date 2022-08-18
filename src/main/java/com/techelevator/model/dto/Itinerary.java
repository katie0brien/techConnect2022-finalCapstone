package com.techelevator.model.dto;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

public class Itinerary {

    //what the class knows

    private String name;

    private List<String> landmarkIds;

    private String irineraryId;

    private String fromDate;

    private String toDate;

    private LocalDate tempDate;
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

    public String getFromDate() {
        return fromDate;
    }

    public void setFromDate(String fromDate) {
        this.fromDate = fromDate;
    }

    public String getToDate() {
        return toDate;
    }

    public void setToDate(String toDate) {
        this.toDate = toDate;
    }

    public LocalDate getTempDate() {
        return tempDate;
    }

    public void setTempDate(LocalDate tempDate) {
        this.tempDate = tempDate;
    }

    public boolean isPast() {
        return tempDate.isBefore(LocalDate.now());
    }

    public String dateToString(LocalDate date) {
        String[] splitDate = date.toString().split("-");
        String newDate = splitDate[2] + "-" + splitDate[0] + "-" + splitDate[1];
        return newDate;
    }
}
