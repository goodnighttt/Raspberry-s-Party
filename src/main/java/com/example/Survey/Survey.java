package com.example.Survey;

public class Survey {
    private int userId;
    private String movie;
    private String song;
    private String grade;
    private String favoriteCourse;

    public Survey(int userId, String movie, String song, String grade, String favoriteCourse) {
        this.userId = userId;
        this.movie = movie;
        this.song = song;
        this.grade = grade;
        this.favoriteCourse = favoriteCourse;
    }

    public int getUserId() {
        return userId;
    }

    public String getMovie() {
        return movie;
    }

    public String getSong() {
        return song;
    }

    public String getGrade() {
        return grade;
    }

    public String getFavoriteCourse() {
        return favoriteCourse;
    }

    // Add setter methods if needed
}
