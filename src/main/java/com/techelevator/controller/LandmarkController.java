package com.techelevator.controller;

import com.techelevator.model.dao.LandmarkDAO;
import com.techelevator.model.dao.jdbc.JDBCLandMarkDAO;
import com.techelevator.model.dto.Landmark;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.sql.DataSource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/landmark")
public class LandmarkController {

    LandmarkDAO landmarkDAO;

    @Autowired
    public LandmarkController(LandmarkDAO landmarkDAO) {
        this.landmarkDAO = landmarkDAO;
    }

    @RequestMapping("/list")
    public String listLandmarks(Model model ) {
        List<Landmark> landmarks = landmarkDAO.getAllLandmarks();

        model.addAttribute("landmarks", landmarks);

        return "landmarkList";
    }

    @RequestMapping("/details/{id}")
    public String landmarkDetail(@PathVariable String id, Model model) {
        Landmark landmark = landmarkDAO.getLandmarkByID(id);
        model.addAttribute("landmark", landmark);

        return "landmarkDetails";
    }

    @RequestMapping("/itinerary/{id}")
    public String viewItineraryLandmarks(@PathVariable int id, Model model) {
        List<Landmark> landmarks = landmarkDAO.getLandmarkByItineraryId(id);

        model.addAttribute("landmarks", landmarks);

        return "landmarkList";
    }

    //itinerary/1/landmark/create
    //itinerary/{/landmark/create
    //also need to get the longitude and latitude from pin if they click save
//    @RequestMapping(path="/itinerary/{id}/landmark/create/{landmarkName}/{longitude}/{latitude}", method=RequestMethod.POST)
    @RequestMapping(path="/itinerary/{id}/landmark/create", method=RequestMethod.POST)
    public @ResponseBody void addLandmarkAsPin(@RequestParam(required = false) String landmarkName,
                                               @RequestParam(required = false) String latitude,
                                               @RequestParam(required = false) String longitude,
                                               @RequestParam(required = false) String streetAddress

                                               ) { //@ModelAttribute Landmark landmark) {
        //creating new var using variables given from modal/pin -- find out how to set pin data need js probably
        Landmark landmark = new Landmark();
        landmark.setName(landmarkName);
        landmark.setLatitude(latitude);
        landmark.setLongitude(longitude);
        landmark.setStreetAddress(streetAddress);

        //saving that information in the data base
        landmarkDAO.addLandmark(landmark);

//        return "redirect:/itinerary/create/1";
    }

    @RequestMapping(path = "/review/{landmarkId}/{choice}")
    public String landmarkReview(@PathVariable String landmarkId, @PathVariable String choice) {
        landmarkDAO.updateThumbsUp(choice, landmarkId);

        return "redirect:/itinerary/list/1";
    }

}
