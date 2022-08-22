package com.techelevator.controller;

import com.techelevator.model.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(path="/")
public class HomePageController {

    private UserDAO userDao;

    @Autowired
    public HomePageController(UserDAO userDao){
        this.userDao = userDao;
    }

    @RequestMapping(path="/home", method= RequestMethod.POST)
    public String displayHomePage(@RequestParam String userName, @RequestParam String password)
    {
        if ( userDao.userNamePasswordExist(userName, password) ) {
            return "homePage";
        }
        return "login";
    }


}

