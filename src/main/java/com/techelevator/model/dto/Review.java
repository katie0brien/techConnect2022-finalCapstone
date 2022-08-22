package com.techelevator.model.dto;

public class Review {

    private int id;
    private boolean isThumbsUp;
    private int userId;
    private int landmarkId;

    public Review(int id, boolean isThumbsUp, int userId, int landmarkId) {
        this.id = id;
        this.isThumbsUp = isThumbsUp;
        this.userId = userId;
        this.landmarkId = landmarkId;
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

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getLandmarkId() {
        return landmarkId;
    }

    public void setLandmarkId(int landmarkId) {
        this.landmarkId = landmarkId;
    }


}
