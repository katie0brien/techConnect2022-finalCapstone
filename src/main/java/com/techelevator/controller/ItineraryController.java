package com.techelevator.controller;

import com.techelevator.model.dao.ItineraryDAO;
import com.techelevator.model.dao.LandmarkDAO;
import com.techelevator.model.dto.Itinerary;
import com.techelevator.model.dto.Landmark;
import org.bouncycastle.ocsp.Req;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/itinerary")
public class ItineraryController {

    ItineraryDAO itineraryDAO;
    LandmarkDAO landmarkDAO;
    @Autowired
    public ItineraryController(ItineraryDAO itineraryDAO, LandmarkDAO landmarkDAO) {
        this.itineraryDAO = itineraryDAO;
        this.landmarkDAO = landmarkDAO;
    }


    //note: id here is userName
    @RequestMapping(value = "/list/{id}", method = RequestMethod.GET)
    public String listItineraries(Model model, @PathVariable String id) {
        List<Itinerary> itineraries = itineraryDAO.getItinerariesByUserName(id);

        model.addAttribute("itineraries", itineraries);

        return "itineraryList"; //todo fill in appropriate page
    }

    @RequestMapping(value = "/create/{id}", method = RequestMethod.GET)
    public String createItinerary(@PathVariable String id, Model model, @Valid @ModelAttribute Itinerary itinerary) {
        model.addAttribute("itinerary", itinerary);
        return "createItinerary";
    }

    @RequestMapping(value = "/create/{id}", method = RequestMethod.POST)
    public String addItinerary(@PathVariable String id ,Model model ,@Valid @ModelAttribute Itinerary itinerary,BindingResult result) {
        if (result.hasErrors()) {
            return "createItinerary";
        }

        itineraryDAO.createItinerary(itinerary, Integer.parseInt(id));

        return "redirect:/itinerary/list/" + id; //todo fill in appropriate page
    }

    @RequestMapping(value = "/delete/{id}/{userId}", method = RequestMethod.POST)
    public  String deleteItinerary(@PathVariable int id, @PathVariable int userId) {
        itineraryDAO.deleteItinerary(id, userId);

        return "redirect:/itinerary/list/" + userId;
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String editItinerary(@PathVariable String id, Model model) {
        Itinerary itinerary = itineraryDAO.getItineraryBy(Integer.parseInt(id));
        model.addAttribute("itinerary", itinerary);
        return "editItinerary";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
    public String saveItinerary(@PathVariable String id, @Valid @ModelAttribute Itinerary itinerary) {

        itinerary.setIrineraryId(id);
        itineraryDAO.editItinerary(itinerary);

        return "redirect:/itinerary/list/1";
    }

//    ask about how to grab the id you want to assign on create itinerary and use the first request mapping above.
//    @RequestMapping(value="/create", method = RequestMethod.GET)
//    public String displayItineraryPage(){
//        return "createItinerary";
//    }


    @RequestMapping(value="edit/download/{id}", method = RequestMethod.GET)
    public void downloadItinerary(@PathVariable String id, HttpServletResponse response) throws IOException {
        response.setContentType("text/csv; charset=utf-8");

        List<String> landmarks = landmarkDAO.getLandmarkAddressByItineraryId(Integer.parseInt(id));

        for(int i = 0; i < landmarks.size() ; i++) {
            response.getWriter().println(landmarks.get(i));
        }

    }



}
