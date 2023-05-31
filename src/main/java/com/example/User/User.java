package com.example.User;

public class User {
    private int id;
    private String username;
    private String password;
    private byte[] profilePic; // Add this line

    public User() {
        // no-args constructor
    }

    public User(int id, String username, String password, byte[] profilePic) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.profilePic = profilePic; // And this line
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public byte[] getProfilePic() { // And this method
        return profilePic;
    }

    public void setProfilePic(byte[] profilePic) { // And this method
        this.profilePic = profilePic;
    }
}
