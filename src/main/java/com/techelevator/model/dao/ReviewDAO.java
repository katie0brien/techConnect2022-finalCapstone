package com.techelevator.model.dao;

import com.techelevator.model.dto.Review;

import java.util.List;
import java.util.Queue;

public interface ReviewDAO {

    List<Review> getAllReviews();
    List<Review> getAllReviewsByUser();
    List<Review> getAllReviewsLandmark();
    Queue<String> getAllCoordinatesDesc();
    List<Review>getAllReviewsDesc(Queue<String> order);
    Review getReviewByID(int id);
}
