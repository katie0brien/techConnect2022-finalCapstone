package com.techelevator.model.dto;

import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.AssertFalse;
import javax.validation.constraints.AssertTrue;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

public class Itinerary {

    //what the class knows

    private String name;

    private List<String> landmarkIds;

    private String irineraryId;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate fromDate;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate toDate;

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

    public LocalDate getFromDate() {
        return fromDate;
    }

    public void setFromDate(LocalDate fromDate) {
        this.fromDate = fromDate;
    }

    public LocalDate getToDate() {
        return toDate;
    }

    public void setToDate(LocalDate toDate) {
        this.toDate = toDate;
    }


    public boolean  isPast(){
        return toDate.isBefore(LocalDate.now());
    }

}
