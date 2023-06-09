package com.example;

public class Course {
    private int id;
    private String name;
    private int dayOfWeek;
    private int period;
    private String courseName;

    // Getters
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getDayOfWeek() {
        return dayOfWeek;
    }

    public int getPeriod() {
        return period;
    }

    public String getCourseName() {
        return courseName;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDayOfWeek(int dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
}
