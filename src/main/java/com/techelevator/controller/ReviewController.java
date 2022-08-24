package com.techelevator.controller;

import com.techelevator.model.dao.LandmarkDAO;
import com.techelevator.model.dao.ReviewDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/review")
public class ReviewController {
    LandmarkDAO landmarkDAO;
    @Autowired
    public ReviewController(LandmarkDAO landmarkDAO) {
        this.landmarkDAO = landmarkDAO;
    }

    @RequestMapping(value = "/new/{landmarkId}/{liked}/{itinerary_id}", method = RequestMethod.POST)
    public String addReview(@PathVariable int landmarkId, @PathVariable Boolean liked, @PathVariable int itinerary_id) {
        landmarkDAO.updateThumbsUp(liked, landmarkId);
        return "redirect:/landmark/list/" + itinerary_id;
    }
}
