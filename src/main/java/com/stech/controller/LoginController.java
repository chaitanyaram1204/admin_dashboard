package com.stech.controller;

import com.stech.model.User;
import com.stech.service.Loginservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
@SessionAttributes("name")
public class LoginController {

    @Autowired
    private Loginservice service;

    @GetMapping("/login")
    public String viewLoginPage(ModelMap map) {
        return "login";
    }

    @GetMapping("/new")
    public String getNewUserPage(ModelMap map) {
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

        return "login1";
    }
    @GetMapping("/login1")
    public String getall(Model Map){
    	return "login1";
    }
    @PostMapping("/new")
    public String addUser(
            @RequestParam String name,
            @RequestParam String password,
            @RequestParam("photo") MultipartFile photo,
            ModelMap model) {
        try {
            String photoName = service.saveUser(name, password, photo);
            model.put("message", "User added successfully!");
            model.put("photoName", photoName); // Optional: Pass photoName to the view if needed
            return "success";
        } catch (IOException e) {
            model.put("errorMessage", "An error occurred: " + e.getMessage());
            return "new";
        }
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
    public String getDeletePage(ModelMap map) {
        return "delete";
    }

    @GetMapping("/update")
    public String getUpdatePage(ModelMap map) {
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

    @GetMapping("/search")
    public String searchPage(ModelMap map) {
        return "search";
    }

    @PostMapping("/search")
    public String searchUser(@RequestParam("username") String username, ModelMap model) {
        List<String> user = service.findUserByName(username);
        if (user != null) {
            model.addAttribute("result", user);
        } else {
            model.addAttribute("errorMessage", "User not found.");
        }
        return "search";
    }

    @GetMapping("/list")
    public String listAllUsers(ModelMap model) {
        List<User> users = service.getAllUsers();
        model.addAttribute("users", users);
        return "listUsers";
    }

    @GetMapping("/sort")
    public String showSortedUsers(ModelMap model) {
        List<User> sortedUsers = service.getSortedUsers();
        model.addAttribute("sortedUsers", sortedUsers);
        return "sort";
    }

    @GetMapping("/pagination")
    public String getAllUsers(@RequestParam(defaultValue = "1") int page, ModelMap model) {
        List<User> users = service.getUsers(page, 5);
        int count = service.getUsersSize();

        System.out.println(count);
        int pageSize = 5;
        int totalPages = (int) Math.ceil((double) count / pageSize);
        model.addAttribute("users", users);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);

        return "pagi";
    }
    @GetMapping("/count")
    public String getcount(ModelMap model) {
        int count = service.getUsersSize();
        model.addAttribute("count", count);

        return "total";
    }
}
