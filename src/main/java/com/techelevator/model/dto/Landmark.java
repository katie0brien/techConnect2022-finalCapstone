package com.techelevator.model.dto;

import javax.swing.*;

public class Landmark {

    private int id;
    private String latitude;
    private String longitude;
    private String name;
    private String streetAddress;
    private String city;
    private String zipOrPostal;
    private String stateOrRegion;
    private String country;
    private boolean liked;
    private String travelNotes;
    private String imageName;

    public Landmark(int id, String latitude, String longitude, String name, String streetAddress, String city, String zipOrPostal, String stateOrRegion, String country) {
        this.id = id;
        this.latitude = latitude;
        this.longitude = longitude;
        this.name = name;
        this.streetAddress = streetAddress;
        this.city = city;
        this.zipOrPostal = zipOrPostal;
        this.stateOrRegion = stateOrRegion;
        this.country = country;
    }

    public Landmark() {}

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStreetAddress() {
        return streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getZipOrPostal() {
        return zipOrPostal;
    }

    public void setZipOrPostal(String zipOrPostal) {
        this.zipOrPostal = zipOrPostal;
    }

    public String getStateOrRegion() {
        return stateOrRegion;
    }

    public void setStateOrRegion(String stateOrRegion) {
        this.stateOrRegion = stateOrRegion;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isLiked() {
        return liked;
    }

    public void setLiked(boolean liked) {
        this.liked = liked;
    }

    public String getTravelNotes() {
        return travelNotes;
    }

    public void setTravelNotes(String travelNotes) {
        this.travelNotes = travelNotes;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }
}
