package net.tydaniel.spring.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.tydaniel.spring.model.User;
import net.tydaniel.spring.service.UserService;

@Controller
public class UserRestController {
	private static final Logger logger = LoggerFactory.getLogger(UserRestController.class);
	private UserService userService;
	
	@Autowired(required = true)
	@Qualifier(value = "userService")
	public void setUserService(UserService ps){
		this.userService = ps;
	}
	
	@RequestMapping(value = UserRestURIConstants.GET_USER, method = RequestMethod.GET)
	public @ResponseBody User getUser(@PathVariable("id") int userId) {
		logger.info("Start getUser.ID = "+userId);
		return this.userService.getUserById(userId);
	}	
	
	@RequestMapping(value = UserRestURIConstants.GET_ALL_USER, method = RequestMethod.GET)
	public @ResponseBody List<User> getAllUser() {
		logger.info("Start getAllUser");
		List<User> users = this.userService.listUsers();		
		return users;
	}
	
	@RequestMapping(value = UserRestURIConstants.CREATE_USER, method = RequestMethod.POST)
	public @ResponseBody User createUser(@RequestBody User p) {
		logger.info("Start Create User");
		if(p.getId() == 0){
			this.userService.addUser(p);
		}
		else {
			this.userService.updateUser(p);
		}				
		return p;
	}
	
	@RequestMapping(value = UserRestURIConstants.DELETE_USER, method = RequestMethod.PUT)
	public @ResponseBody User deleteUser(@PathVariable("id") int userId) {
		logger.info("Start delete User.ID = "+userId);
		User usr = this.userService.getUserById(userId);
		this.userService.removeUser(userId);
		return usr;		
	}
}
