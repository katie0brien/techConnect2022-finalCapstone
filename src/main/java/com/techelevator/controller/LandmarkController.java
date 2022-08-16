package com.techelevator.controller;

import com.techelevator.model.dao.LandmarkDAO;
import com.techelevator.model.dao.jdbc.JDBCLandMarkDAO;
import com.techelevator.model.dto.Landmark;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
}
