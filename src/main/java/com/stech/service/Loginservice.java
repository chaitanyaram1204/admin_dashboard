package com.stech.service;

import java.util.*;
import java.io.*;
import org.springframework.stereotype.Service;
import com.stech.model.*;
@Service
public class Loginservice {

    public String[][] ar = {
        {"chaitu", "abc123"},
        {"ram", "123"},
        {"dummy", "no"},
        {"nodummy", "ye"},
        {"avantel", "something"}
    };
    private final String filePath = File_Path;

    public boolean validateUser(String userId, String password) {
        boolean isAuthenticated = false;

        if (userId != null && password != null) {
            String filePath = File_Path;

            File file = new File(filePath);

            if (file.exists()) {
                BufferedReader br = null;
                try {
                    br = new BufferedReader(new FileReader(file));
                    String line;
                    while ((line = br.readLine()) != null) {
                        String[] details = line.split(",");
                        if (details[0].trim().equals(userId) && details[1].trim().equals(password)) {
                            isAuthenticated = true;
                            break;
                        }
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    if (br != null) {
                        try {
                            br.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            } else {
                System.out.println("Details.txt file does not exist.");
            }
        }

        return isAuthenticated;
    }

    public void add(String newUserId, String newPassword) {
    	if (newUserId != null && newPassword != null) {
            
                String filePath = File_Path;

                File file = new File(filePath);
                BufferedWriter bw = null;

                try {
                    // Create the file if it doesn't exist
                    if (!file.exists()) {
                        file.createNewFile();
                    }

                    // Open the file in append mode
                    bw = new BufferedWriter(new FileWriter(file, true));
                    bw.write(newUserId + "," + newPassword);
                    bw.newLine();

                    System.out.println("Registration successful!");
                    // Handle redirect to login page in your controller if needed

                } catch (IOException e) {
                    System.out.println("Error occurred while registering: " + e.getMessage());
                } finally {
                    if (bw != null) {
                        try {
                            bw.close();
                        } catch (IOException e) {
                            System.out.println("Error occurred while closing the file: " + e.getMessage());
                        }
                    }
                }
            
        }
    }
    public boolean deleteUser(String name, String password) {
        File inputFile = new File(filePath);
        File dummyFile = new File("users_dummy.txt");

        boolean userDeleted = false;

        try (BufferedReader reader = new BufferedReader(new FileReader(inputFile));
             BufferedWriter dummyWriter = new BufferedWriter(new FileWriter(dummyFile))) {

            String currentLine;

            while ((currentLine = reader.readLine()) != null) {
                String[] userDetails = currentLine.split(",");
                if (userDetails.length == 2 && userDetails[0].equals(name) && userDetails[1].equals(password)) {
                    userDeleted = true; // Skip writing this user to the dummy file
                } else {
                    dummyWriter.write(currentLine);
                    dummyWriter.newLine();
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        // Clear the original file and copy the dummy file content back to it
        if (userDeleted) {
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(inputFile))) {
                try (BufferedReader dummyReader = new BufferedReader(new FileReader(dummyFile))) {
                    String currentLine;
                    while ((currentLine = dummyReader.readLine()) != null) {
                        writer.write(currentLine);
                        writer.newLine();
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // Delete the dummy file after operation
        dummyFile.delete();

        return userDeleted;
    }
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String currentLine;

            while ((currentLine = reader.readLine()) != null) {
                String[] userDetails = currentLine.split(",");
                if (userDetails.length == 2) {
                    users.add(new User(userDetails[0], userDetails[1]));
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return users;
    }
    public boolean updateUser(String userId, String newPassword) {
        File inputFile = new File(filePath);
        File dummyFile = new File("users_dummy.txt");

        boolean userUpdated = false;

        try (BufferedReader reader = new BufferedReader(new FileReader(inputFile));
             BufferedWriter dummyWriter = new BufferedWriter(new FileWriter(dummyFile))) {

            String currentLine;

            while ((currentLine = reader.readLine()) != null) {
                String[] userDetails = currentLine.split(",");
                if (userDetails.length == 2 && userDetails[0].equals(userId)) {
                    dummyWriter.write(userId + "," + newPassword); // Update the password
                    userUpdated = true;
                } else {
                    dummyWriter.write(currentLine); // Write the original line if user doesn't match
                }
                dummyWriter.newLine();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        // If user was updated, replace the original file with the updated content
        if (userUpdated) {
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(inputFile))) {
                try (BufferedReader dummyReader = new BufferedReader(new FileReader(dummyFile))) {
                    String currentLine;
                    while ((currentLine = dummyReader.readLine()) != null) {
                        writer.write(currentLine);
                        writer.newLine();
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // Delete the dummy file after operation
        dummyFile.delete();

        return userUpdated;
    }
    // Uncomment and use this method if you want to add users to the HashMap instead of the file
    // public void addUser(String userid, String password) {
    //     mp.put(userid, password);
    // }

}
