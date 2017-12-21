package se.erikappelblad.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import se.erikappelblad.model.StatusUpdate;
import se.erikappelblad.service.StatusUpdateService;

@Controller
public class PageController {
	
	@Autowired
	StatusUpdateService statusUpdateService;

	@RequestMapping("/")
	ModelAndView home(ModelAndView mav) {
		StatusUpdate statusUpdate = statusUpdateService.getLatest();
		
		mav.getModel().put("latestStatusUpdate", statusUpdate);
		
		mav.setViewName("app.homepage");
		return mav;
	}

	@RequestMapping("/about")
	String about() {
		return "app.about";
	}

}
