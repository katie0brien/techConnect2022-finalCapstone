package com.techelevator.controller;

import com.techelevator.model.dao.UserDAO;
import com.techelevator.model.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(path="/")
public class HomePageController {

    private UserDAO userDao;

    @Autowired
    public HomePageController(UserDAO userDao){
        this.userDao = userDao;
    }

    @RequestMapping(path="/home", method= RequestMethod.GET)
    public String displayHomePage(@ModelAttribute User user, HttpServletRequest request)
    {
        if ( userDao.userNamePasswordExist(user.getUserName(), user.getPassword()) ) {
            return "homePage";
        }
        return "login";
    }


}

