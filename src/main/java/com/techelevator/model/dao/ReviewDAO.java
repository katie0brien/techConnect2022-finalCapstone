package com.techelevator.model.dao;

import com.techelevator.model.dto.Review;

import java.util.List;
import java.util.Queue;

public interface ReviewDAO {

    void updateReview(int landmarkId, boolean liked);
}
