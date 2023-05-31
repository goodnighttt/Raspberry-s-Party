package com.example.Service;
import com.example.Movie.Movie;
import dao.MovieListDAO;

import java.sql.*;
import java.util.*;
import org.apache.commons.text.similarity.LevenshteinDistance;
//import static sun.jvm.hotspot.oops.CellTypeState.top;

public class MovieRecommendationService {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/javaweb";
    private static final String USER = "root";
    private static final String PASS = "root";
    private LevenshteinDistance ld;

//    public String getClosestMatch(String userInput, List<String> movieNames) {
//        String bestMatch = null;
//        int smallestDistance = Integer.MAX_VALUE;
//
//        for (String movieName : movieNames) {
//            int distance = ld.apply(userInput, movieName);
//            if (distance < smallestDistance) {
//                smallestDistance = distance;
//                bestMatch = movieName;
//            }
//        }
//
//        return bestMatch;
//    }

    public String findBestMatch(String userInput,List<String> movieNames) {
//        List<String> allMovieNames = movieDAO.getAllMovieNames();

        // Filter movie names that contain user input
        List<String> filteredMovieNames = new ArrayList<>();
        for (String movieName : movieNames) {
            if (movieName.toLowerCase().contains(userInput.toLowerCase())) {
                filteredMovieNames.add(movieName);
            }
        }

        // If no movie names contain the user input, use all movie names for the next step
        if (filteredMovieNames.isEmpty()) {
            filteredMovieNames = movieNames;
        }

        // Find the best match using Levenshtein distance
        LevenshteinDistance ld = LevenshteinDistance.getDefaultInstance();
        String bestMatch = Collections.min(filteredMovieNames,
                (a, b) -> ld.apply(userInput, a) - ld.apply(userInput, b));

        return bestMatch;
    }

    public List<Movie> getTop10SimilarMoviesByName(String movieName) throws ClassNotFoundException {
        // 加载数据库驱动程序
        Class.forName("com.mysql.cj.jdbc.Driver");
        // 打印连接成功的消息
        System.out.println("连接jdbc成功");

        System.out.println("喜欢的电影为"+movieName);
        List<Movie> top10Movies = new ArrayList<>();
        this.ld = new LevenshteinDistance();
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS)) {
            MovieListDAO movieListDAO = new MovieListDAO();
//            String true_name = getClosestMatch(movieName, movieListDAO.getAllMovieNames());
            String true_name = findBestMatch(movieName, movieListDAO.getAllMovieNames());
            System.out.println("匹配到的的电影名称是" + true_name);
            // 步骤 1：根据电影名称获取电影ID
            String selectMovieId = "SELECT id FROM mymovies_copy1 WHERE name = ?";
            PreparedStatement stmt1 = conn.prepareStatement(selectMovieId);
            stmt1.setString(1, true_name);
            ResultSet rs1 = stmt1.executeQuery();

            if (rs1.next()) {
                System.out.println("找到了电影");
                int movieId = rs1.getInt("id");
                System.out.println("电影id是" + movieId);

                // 步骤 2：根据电影ID获取前十部相似的电影
                String selectTop10SimilarMovies = "SELECT movie_id_2 FROM movie_similarity_4 WHERE movie_id_1 = ? ORDER BY similarity DESC LIMIT 10";
                PreparedStatement stmt2 = conn.prepareStatement(selectTop10SimilarMovies);
                stmt2.setInt(1, movieId);
                ResultSet rs2 = stmt2.executeQuery();

                while (rs2.next()) {
                    int similarMovieId = rs2.getInt("movie_id_2");
                    System.out.println(similarMovieId);

                    // 步骤 3：根据相似电影ID获取电影属性
                    String selectMovie = "SELECT * FROM mymovies_copy2 WHERE id = ?";
                    PreparedStatement stmt3 = conn.prepareStatement(selectMovie);
                    stmt3.setInt(1, similarMovieId);
                    ResultSet rs3 = stmt3.executeQuery();
                    if (rs3.next()) {
                        // 从结果集中获取电影属性
                        String name = rs3.getString("name");
                        String director = rs3.getString("director");
                        String writer = rs3.getString("author");
                        String actors = rs3.getString("actors");
                        String releaseDate = rs3.getString("time");
                        String genres = rs3.getString("type");
                        double rating = rs3.getDouble("rating");
                        String description = rs3.getString("description");
                        String imageUrl = rs3.getString("img");

                        // 创建Movie对象
                        Movie movie = new Movie(similarMovieId, name, director, writer, actors, releaseDate, genres, rating, description, imageUrl);
                        top10Movies.add(movie);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return top10Movies;
    }



}
