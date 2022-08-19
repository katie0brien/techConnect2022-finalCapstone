package com.techelevator.controller;

import com.techelevator.model.dao.ItineraryDAO;
import com.techelevator.model.dao.LandmarkDAO;
import com.techelevator.model.dto.Itinerary;
import com.techelevator.model.dto.Landmark;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/itinerary")
public class ItineraryController {

    ItineraryDAO itineraryDAO;
    @Autowired
    public ItineraryController(ItineraryDAO itineraryDAO, LandmarkDAO landmarkDAO) {
        this.itineraryDAO = itineraryDAO;
    }

    @RequestMapping("/list/{id}")
    public String listItineraries(Model model, @PathVariable int id) {
        List<Itinerary> itineraries = itineraryDAO.getItinerariesByUserName(id);

        model.addAttribute("itineraries", itineraries);

        return "itineraryList"; //todo fill in appropriate page
    }

    @RequestMapping(value = "/create/{id}", method = RequestMethod.GET)
    public String createItinerary(@PathVariable String id) {
        return "createItinerary";
    }

    @RequestMapping(value = "/create/{id}", method = RequestMethod.POST)
    public String addItinerary(Model model, @Valid @ModelAttribute Itinerary itinerary, @PathVariable String id, BindingResult result) {

        if (result.hasErrors()) {
            return "createItinerary";
        }

        itineraryDAO.createItinerary(itinerary, Integer.parseInt(id));

        model.addAttribute("itinerary", itinerary);

        return "redirect:itinerary/list/" + id; //todo fill in appropriate page
    }

    @RequestMapping(value = "/delete/{id}/{userId}", method = RequestMethod.POST)
    public String deleteItinerary(@PathVariable int id, @PathVariable int userId) {
        itineraryDAO.deleteItinerary(id, userId);
        return "redirect:itinerary/list/1";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String editItinerary(@PathVariable int id, Model model) {
        Itinerary itinerary = itineraryDAO.getItineraryBy(id);
        model.addAttribute("itinerary", itinerary);
        return "editItinerary";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.PUT)
    public String saveItinerary(@PathVariable int id, @RequestBody Itinerary itinerary) {

        itinerary.setIrineraryId(Integer.toString(id));
        itineraryDAO.editItinerary(itinerary);

        return "redirect:itinerary/list/1";
    }

//    @RequestMapping(value = "createPin", method = RequestMethod.GET)
//    public String createPin() {
//
//    }

}
