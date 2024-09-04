package com.stech.model;

public class User {
    private String name;
    private String password;
    private String photoFileName;

    public User(String name, String password, String photoFileName) {
        this.name = name;
        this.password = password;
        this.photoFileName = photoFileName;
    }

    public User(String name, String password) {
        this(name, password, null);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhotoFileName() {
        return photoFileName;
    }

    public void setPhotoFileName(String photoFileName) {
        this.photoFileName = photoFileName;
    }
}
