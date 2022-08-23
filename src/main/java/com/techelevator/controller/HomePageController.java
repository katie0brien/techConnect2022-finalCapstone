package com.techelevator.controller;

import com.techelevator.model.dao.UserDAO;
import com.techelevator.model.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
//@RequestMapping(path="/")
public class HomePageController {

    private UserDAO userDao;

    @Autowired
    public HomePageController(UserDAO userDao){
        this.userDao = userDao;
    }

    @RequestMapping(path="/home/{id}", method = RequestMethod.GET)
    public String goToHomePage(@PathVariable String id, Model model) {
        model.addAttribute("user", (User)userDao.getUserByUserName(id));
        return "homePage";
    }

//    @RequestMapping(path="/home/{id}", method= RequestMethod.POST)
//    public String displayHomePage(HttpServletRequest request, Model model, @PathVariable String id)
//
//    {
//       // if ( userDao.userNamePasswordExist(user.getUserName(), user.getPassword()) ) {
//            model.addAttribute("id", id);
//            return "redirect:/home/" + id;
//      //  }
//
//      //  return "login";
//    }


}

