package com.example.Survey;

import java.util.List;

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

    public static class MovieJson {
        private String name;
        private String watch_time;

        public MovieJson(String name, String watch_time) {
            this.name = name;
            this.watch_time = watch_time;
        }

        public String getName() {
            return name;
        }

        public String getWatch_time() {
            return watch_time;
        }

        // Add setter methods if needed
    }
}
