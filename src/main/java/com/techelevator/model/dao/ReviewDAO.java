package com.techelevator.model.dao;

import com.techelevator.model.dto.Review;

import java.util.List;

public interface ReviewDAO {

    List<Review> getAllReviews();
    List<Review> getAllReviewsDesc();
    Review getReviewByID();
}
