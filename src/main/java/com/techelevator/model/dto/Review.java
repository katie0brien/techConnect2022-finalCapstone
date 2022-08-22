package com.techelevator.model.dto;

public class Review {

    private int id;
    private boolean isThumbsUp;
    private Integer userId;
    private String landmarkId;

    private String longitude;
    private String latitude;
    public Review() {
    }

    public Review(Integer id, boolean isThumbsUp, Integer userId, String landmarkId, String longitude, String latitude) {
        this.id = id;
        this.isThumbsUp = isThumbsUp;
        this.userId = userId;
        this.landmarkId = landmarkId;
        this.longitude = longitude;
        this.latitude = latitude;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isThumbsUp() {
        return isThumbsUp;
    }

    public void setThumbsUp(boolean thumbsUp) {
        isThumbsUp = thumbsUp;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getLandmarkId() {
        return landmarkId;
    }

    public void setLandmarkId(String landmarkId) {
        this.landmarkId = landmarkId;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }
}
