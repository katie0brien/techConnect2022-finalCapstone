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

    @RequestMapping("/list/{id}/{userName}")
    public String listLandmarks(@PathVariable Integer id, @PathVariable String userName, Model model ) {
        List<Landmark> landmarks = landmarkDAO.getLandmarkByItineraryId(id);

        model.addAttribute("landmarks", landmarks);
        model.addAttribute("itineraryId", id);
        model.addAttribute("userName", userName);

        return "landmarkList";
    }

    @RequestMapping("/details/{id}")
    public String landmarkDetail(@PathVariable int id, Model model) {
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
                                               @RequestParam(required = false) String streetAddress,
                                               @RequestParam(required = false) String city,
                                               @RequestParam(required = false) String stateOrRegion,
                                               @RequestParam(required = false) String zipOrPostal,
                                               @RequestParam(required = false) String country,
                                               @PathVariable int id
                                               ) { //@ModelAttribute Landmark landmark) {
        //creating new var using variables given from modal/pin -- find out how to set pin data need js probably
        Landmark landmark = new Landmark();
        landmark.setName(landmarkName);
        landmark.setLatitude(latitude);
        landmark.setLongitude(longitude);
        landmark.setStreetAddress(streetAddress);
        landmark.setCity(city);
        landmark.setStateOrRegion(stateOrRegion);
        landmark.setZipOrPostal(zipOrPostal);
        landmark.setCountry(country);

        //saving that information in the data base
        int landmarkId = landmarkDAO.addLandmark(landmark); //add landmark to table
        landmarkDAO.addLandmarkToRelatorTable(landmarkId, id); //create connection between landmark and itinerary

//        return "redirect:/itinerary/create/1";
    }

    @RequestMapping("/favorites/{userName}")
    public String viewFavorites(@PathVariable String userName, Model model) {
        model.addAttribute("landmarks", landmarkDAO.getFavorites(userName));
        return "favoritesPage";
    }


}
