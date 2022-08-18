package com.techelevator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path="/")
public class HomePageController {

    @RequestMapping(path="/home", method= RequestMethod.GET)
    public String displayHomePage(){ return "homePage";}


}

