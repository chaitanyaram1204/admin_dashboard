package com.stech.service;

import com.stech.model.User;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.nio.file.*;
import java.util.*;

@Service
public class Loginservice {

    private static final String FILE_DIRECTORY = "src/main/resources/static/images/";
    private static final String DETAILS_FILE_PATH = "Your path";

    // Validate user credentials
    public boolean validateUser(String name, String password) {
        List<User> users = getAllUsers();
        return users.stream().anyMatch(user -> user.getName().equals(name) && user.getPassword().equals(password));
    }

    // Add a new user and save the user's photo file name
    public String saveUser(String name, String password, MultipartFile photo) throws IOException {
        // Save photo
        String fileName = photo.getOriginalFilename();
        Path uploadPath = Paths.get(FILE_DIRECTORY, fileName);

        if (!Files.exists(uploadPath.getParent())) {
            Files.createDirectories(uploadPath.getParent()); // Create directory if not exists
        }

        try (InputStream inputStream = photo.getInputStream()) {
            Files.copy(inputStream, uploadPath, StandardCopyOption.REPLACE_EXISTING); // Save file to disk
        }

        // Append user information and photo file name to the details.txt file
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(DETAILS_FILE_PATH, true))) {
            bw.write(name + "," + password + "," + fileName);
            bw.newLine();
        }

        return fileName;
    }

    // Update user password
    public boolean updateUser(String name, String newPassword) {
        List<User> users = getAllUsers();
        boolean isUpdated = false;

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(DETAILS_FILE_PATH, false))) {
            for (User user : users) {
                if (user.getName().equals(name)) {
                    bw.write(name + "," + newPassword + "," + user.getPhotoFileName());
                    isUpdated = true;
                } 
                else if(user.getPassword().equals(newPassword)){
                	bw.write(name + "," + newPassword + "," + user.getPhotoFileName());
                    isUpdated = true;
                }
                else {
                    bw.write(user.getName() + "," + user.getPassword() + "," + user.getPhotoFileName());
                }
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return isUpdated;
    }

    // Delete a user
    public boolean deleteUser(String name, String password) {
        List<User> users = getAllUsers();
        boolean isDeleted = false;

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(DETAILS_FILE_PATH, false))) {
            for (User user : users) {
                if (user.getName().equals(name) && user.getPassword().equals(password)) {
                    isDeleted = true;
                    // Optionally delete the user's photo file here if needed
                    Path photoFile = Paths.get(FILE_DIRECTORY, user.getPhotoFileName());
                    if (Files.exists(photoFile)) {
                        Files.delete(photoFile);
                    }
                } else {
                    bw.write(user.getName() + "," + user.getPassword() + "," + user.getPhotoFileName());
                    bw.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return isDeleted;
    }

    // Retrieve all users
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();

        try (Scanner scanner = new Scanner(new File("Your path"))) {
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                String[] parts = line.split(",");
//                if (parts.length == 3) {
//                    users.add(new User(parts[0].trim(), parts[1].trim()));
//                }
                if (parts.length == 3) {
                    users.add(new User(parts[0].trim(), parts[1].trim(), parts[2].trim()));
                }
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        return users;
    }

    // Get sorted users by name
    public List<User> getSortedUsers() {
        List<User> users = getAllUsers();
        users.sort(Comparator.comparing(User::getName));
        return users;
    }

    // Get users with pagination
    public List<User> getUsers(int page, int size) {
        List<User> users = getAllUsers();
        int start = (page - 1) * size;
        int end = Math.min(start + size, users.size());
        if (start > users.size()) {
            return new ArrayList<>();
        }
        return users.subList(start, end);
    }

    // Get total number of users
    public int getUsersSize() {
        return getAllUsers().size();
    }

    // Find user by username
    public List<String> findUserByName(String username) {
        List<User> users = getAllUsers();
        List<String> result = new ArrayList<>();
        for (User user : users) {
            if (user.getName().equals(username)) {
                result.add(user.getName());
                result.add(user.getPassword());
                System.out.println(user.getPhotoFileName());
                result.add(user.getPhotoFileName());
            }
        }
        return result.isEmpty() ? null : result;
    }
    
}
