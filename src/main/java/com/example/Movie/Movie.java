package com.example.Movie;
public class Movie {
    private int id;
    private String name;
    private String director;
    private String writer;
    private String actors;
    private String releaseDate;
    private String genres;
    private double rating;
    private String description;
    private String imageUrl;

    public Movie(int id, String name, String director, String writer, String actors, String releaseDate, String genres, double rating, String description, String imageUrl) {
        this.id = id;
        this.name = name;
        this.director = director;
        this.writer = writer;
        this.actors = actors;
        this.releaseDate = releaseDate;
        this.genres = genres;
        this.rating = rating;
        this.description = description;
        this.imageUrl = imageUrl;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getActors() {
        return actors;
    }

    public void setActors(String actors) {
        this.actors = actors;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getGenres() {
        return genres;
    }

    public void setGenres(String genres) {
        this.genres = genres;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
