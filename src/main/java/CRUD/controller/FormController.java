package CRUD.controller;

import java.time.chrono.IsoChronology;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;
import CRUD.model.User;
import CRUD.service.UserService;
import net.bytebuddy.asm.Advice.This;


@Controller
public class FormController {
	
	@Autowired
	private UserService userService;
	
	// use this to pass similar value to all pages
	@ModelAttribute
	public void commonData(Model m){
		
		m.addAttribute("spring", "Spring MVC Project");
		System.out.println("common data ");
		
		
	}
	
	
	@RequestMapping("/signup")
	public String home(Model model) {
		System.out.println("signup page");
		return"signup";
	}
	
	@RequestMapping("/login")
	public String login() {
		System.out.println("login page");
		return"login";
	};
	
	@RequestMapping("/admin-add-user")
	public String adminuser(Model model) {
		System.out.println("admin-add-user page");
		return"admin-add-user";
	}
	
	
	//getting data from database as list and displaying
	@RequestMapping("/admindashboard")
	public String dashboard(Model model) {
		
		
		List<User> users= this.userService.showUsers();
		model.addAttribute("users", users);
		
		for(User u:users) {
			System.out.println(u);
		}

		System.out.println("Admin dashboard page");
		return"admindashboard";
	}
	
	
	
/*  old way to use/ send / set value to User model
 * 
 * 
   @RequestMapping(path ="/processform", method = RequestMethod.POST)
	public String HandleForm(@RequestParam("name") String name,
							 @RequestParam("username") String userName,
							 @RequestParam("password") String password, Model model) {
	   
	   
//	   model.addAttribute("name", name);
//	   model.addAttribute("username", userName);
//	   model.addAttribute("password", name);   
	   
	   User user=new User();
	   
	   user.setName(name);
	   user.setUserName(userName);
	   user.setPassword(password);
	   
	   model.addAttribute("user", user);
	   
	  System.out.println(user);
	   
	   return"/welcome";
   }
   
*/
	
	
//	new easy way to set model using @ModelAttribute
	
	//creating user using signup page
   @RequestMapping(path ="/processform", method = RequestMethod.POST)
  	public String HandleForm(@ModelAttribute User user, Model model) { 
	   
	   Boolean valAdmin= userService.validateAdmin();
  	 if (("Admin".equals(user.getName()))&& valAdmin){
  		System.out.println("eneterd condition");
  		  model.addAttribute("msg", "Admin alredy Exist!");
  		  return "signup";
  	  }
  	  System.out.println(user);
  	  this.userService.createUser(user);
  	   
  	   return"welcome";
     }
   //creating user using admin add page
   @RequestMapping(path ="/adminadduser", method = RequestMethod.POST)
 	public RedirectView adduser(@ModelAttribute User user, HttpServletRequest request) {  
 	   
 	  RedirectView redirectView = new RedirectView();
 	  redirectView.setUrl(request.getContextPath()+"/admindashboard");
 	  System.out.println(user);
 	  this.userService.createUser(user);
 	   
 	   return redirectView;
    }
   
   //deleting user using user id
   @RequestMapping("/delete/{userID}")
   public RedirectView deleteUser(@PathVariable("userID") int userID, HttpServletRequest request) {  
	   	this.userService.delete(userID);
	 	  RedirectView redirectView = new RedirectView();
	 	  redirectView.setUrl(request.getContextPath()+"/admindashboard");
	 	   
	 	   return redirectView;
	    }
   
   //getting data from db for updating user using id
   @RequestMapping("/update/{userID}")
   public String updateUser(@PathVariable("userID") int userID,Model model) {
	   
	   User user = this.userService.singelUser(userID);
	   model.addAttribute("user", user);
	   
	   return "update";
	   
   }
   
   //updating data to database by admin
   
   
   @RequestMapping(path ="/updateform", method = RequestMethod.POST)
	public RedirectView HandleUpdate(@ModelAttribute User user, HttpServletRequest request) {  
	   
	   
	  this.userService.update(user); 
	  System.out.println("this is user:"+user);
		System.out.println("from from controller");
	  RedirectView redirectView = new RedirectView();
	  redirectView.setUrl(request.getContextPath()+"/admindashboard");
	  System.out.println("updateform");
	  
	   
	   return redirectView;
   }
   
   @PostMapping("/validate")
   public String validateLogin(@RequestParam String username,
                               @RequestParam String password,
                               Model model) {
       User user = userService.validateUser(username, password);

       if (user != null) {
           model.addAttribute("user", user);
           return "welcome"; // Returns the welcome.jsp page on success
       } else {
           model.addAttribute("error", "Invalid username or password");
           return "login"; // Returns the login.jsp page on failure
       }
   }

}


