package com.techelevator.controller;

import com.techelevator.model.dao.ReviewDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewController {

    ReviewDAO reviewDAO;

    @Autowired
    public ReviewController(ReviewDAO reviewDAO) {
        this.reviewDAO = reviewDAO;
    }

    @RequestMapping(value = "review/new/{userId}/{landmarkId}", method = RequestMethod.POST)
    public String addReview(@PathVariable int userId, @PathVariable String landmarkId) {
        return " ";
    }
}
