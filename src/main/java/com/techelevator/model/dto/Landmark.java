package com.techelevator.model.dto;

import javax.swing.*;

public class Landmark {

    private String id;
    private String latitude;
    private String longitude;
    private String name;
    private String streetAddress;
    private String city;
    private int zipOrPostal;
    private String stateOrRegion;
    private String country;

    public Landmark(String id, String latitude, String longitude, String name, String streetAddress, String city, int zipOrPostal, String stateOrRegion, String country) {
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

    public int getZipOrPostal() {
        return zipOrPostal;
    }

    public void setZipOrPostal(int zipOrPostal) {
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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
