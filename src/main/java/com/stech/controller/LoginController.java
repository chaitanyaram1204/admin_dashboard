package com.stech.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import java.util.List;
import com.stech.service.Loginservice;
import com.stech.model.User; // Import User class

@Controller
@SessionAttributes("name")
public class LoginController {
	 
    @org.springframework.beans.factory.annotation.Autowired
    Loginservice service;
	
    @GetMapping("/login")
    public String viewLoginPage(ModelMap map) {
        return "login";
    }

    @GetMapping("/new")
    public String getnew(ModelMap map) {
        return "new";
    }

    @PostMapping("/login")
    public String showWelcomePage(ModelMap model, @RequestParam String name, @RequestParam String password) {
        boolean isValidUser = service.validateUser(name, password);

        if (!isValidUser) {
            model.put("errorMessage", "Outsiders, Not allowed");
            return "login";
        }

        model.put("name", name);
        model.put("password", password);

        return "welcome";
    }

    @PostMapping("/new")
    public String addUser(ModelMap model, @RequestParam String name, @RequestParam String password) {
        boolean isValidUser = service.validateUser(name, password);
        if (isValidUser)
            return "error";
        service.add(name, password);
        return "success";
    }

    @GetMapping("/logout")
    public String showLogoutPage(ModelMap model) {
        return "login";
    }

    @PostMapping("/delete")
    public String deleteUser(ModelMap model, @RequestParam String name, @RequestParam String password) {
        boolean isDeleted = service.deleteUser(name, password);
        if (!isDeleted) {
            return "deleteerror";
        }
        return "success";
    }

    @GetMapping("/delete")
    public String getdelete(ModelMap map) {
        return "delete";
    }
    @GetMapping("/update")
    public String getUpdate(ModelMap map) {
        return "update";
    }

    @PostMapping("/update")
    public String updateUser(ModelMap model, @RequestParam String name, @RequestParam String newPassword) {
        boolean isUpdated = service.updateUser(name, newPassword);

        if (!isUpdated) {
            model.put("errorMessage", "User not found or update failed");
            return "update";
        }

        return "success";
    }
    @GetMapping("/list")
    public String getuserrs(ModelMap map) {
        return "listUsers";
    }
    
    @GetMapping("/listUsers")
    public String listAllUsers(ModelMap model) {
        List<User> users = service.getAllUsers();
        
        // Debugging: Check if the list is populated
        if (users == null || users.isEmpty()) {
            System.out.println("No users found!");
        } else {
            System.out.println("Users found: " + users.size());
        }

        model.addAttribute("users", users);
        return "listUsers";
    }

}
