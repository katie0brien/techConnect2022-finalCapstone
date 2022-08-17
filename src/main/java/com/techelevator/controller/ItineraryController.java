package com.techelevator.controller;

import com.techelevator.model.dao.ItineraryDAO;
import com.techelevator.model.dao.LandmarkDAO;
import com.techelevator.model.dto.Itinerary;
import com.techelevator.model.dto.Landmark;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/itinerary")
public class ItineraryController {

    ItineraryDAO itineraryDAO;

    @Autowired
    public ItineraryController(ItineraryDAO itineraryDAO) {
        this.itineraryDAO = itineraryDAO;
    }

    @RequestMapping("/list/{id}")
    public String listItineraries(Model model, @PathVariable String id) {
        List<Itinerary> itineraries = itineraryDAO.getItinerariesByUserName(id);

        model.addAttribute("itineraries", itineraries);

        return " "; //todo fill in appropriate page
    }

    @RequestMapping("/createItinerary/{id}")
    public String createItinerary(Model model, @PathVariable String id, @Valid @ModelAttribute Itinerary itinerary) {
        String newItineraryId = itineraryDAO.createItinerary(itinerary.getName());

//        model.addAttribute("itineraries", itineraries);

        return " "; //todo fill in appropriate page
    }

}
