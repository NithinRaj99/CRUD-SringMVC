package CRUD.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	
	@RequestMapping("/model")
	public String model(Model model) {
		System.out.println("model page");
		model.addAttribute("name", "abcd");
		
	List<String> names = new ArrayList<String>();
	names.add("qwert");
	names.add("asdfg");
	names.add("zxcvb");
	
	model.addAttribute("n", names);
	
		return"model";
	}
	
	@RequestMapping("/mav")
	public ModelAndView mav(){
		System.out.println("ModelAndView exmaple");
		
		//ModelAndView object
		ModelAndView modelAndView = new ModelAndView();
		
		//setting data
		modelAndView.addObject("name", "abcd");
		modelAndView.addObject("id", 1234);
		
		
		LocalDateTime now=LocalDateTime.now();
		modelAndView.addObject("time",now);
		
		//setting view instead of returning
		
		modelAndView.setViewName("mav");
		
		return modelAndView;
	
		
	}

	@RequestMapping("/jspEL")
	public ModelAndView jspEL(){
		System.out.println("ModelAndView exmaple");
		
		//ModelAndView object
		ModelAndView modelAndView = new ModelAndView();
		
		//setting data
		modelAndView.addObject("name", "abcd");
		modelAndView.addObject("id", 1234);
		
		
		LocalDateTime now=LocalDateTime.now();
		modelAndView.addObject("time",now);
		
		
		List<Integer> list =new ArrayList<Integer>();
		list.add(1);
		list.add(2);
		list.add(3);
		list.add(4);
		list.add(5);
		modelAndView.addObject("num", list);
		
		//setting view instead of returning
		
		modelAndView.setViewName("jspEL");
		
		return modelAndView;
	
		
	}
}
