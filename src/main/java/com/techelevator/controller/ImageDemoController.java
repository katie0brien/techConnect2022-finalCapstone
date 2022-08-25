package com.techelevator.controller;

import com.techelevator.model.dao.LandmarkDAO;
import com.techelevator.model.dto.Landmark;
import com.techelevator.services.uploads.UploadProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ImageDemoController
{
    private UploadProvider uploadProvider;
    private LandmarkDAO landmarkDAO;

    @Autowired
    public ImageDemoController(UploadProvider uploadProvider, LandmarkDAO landmarkDAO) {
        this.landmarkDAO = landmarkDAO;
        this.uploadProvider = uploadProvider;
    }

    @RequestMapping(value="/upload/{id}/{itineraryId}/{userName}", method = RequestMethod.GET)
    public String uploadImage(@PathVariable int id, @PathVariable int itineraryId, @PathVariable String userName)
    {
        return "landmarkDetails";
    }

    @RequestMapping(value="/upload/{id}/{itineraryId}/{userName}", method = RequestMethod.POST)
    public String uploadImage(@RequestParam(required = false) MultipartFile file, @PathVariable int id,
                              Model model, @PathVariable int itineraryId, @PathVariable String userName)
    {
        //save restaurant without image and get the restaurantid

        if(file != null && !file.isEmpty())
        {
            try
            {
                //come up with a file name first
                String defaultFileName = id + "-image";// should be the resaurant id


                //save the file with the chosen name
                String fileName = uploadProvider.uploadFile( file, defaultFileName );

                //update the database with the saved file name
                landmarkDAO.addImageName(defaultFileName, id);
            }
            catch(Throwable ex)
            {

            }
        }

        return "redirect:/landmark/details/" + id + "/" + itineraryId + "/" + userName;
    }

}
