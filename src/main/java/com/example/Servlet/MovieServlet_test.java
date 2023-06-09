package com.example.Servlet;

import com.example.Movie.Movie;
import com.example.Service.MovieRecommendationService;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MovieServlet_test", value = "/MovieServlet_test")
public class MovieServlet_test extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        String movieName = request.getParameter("movie");
        System.out.println("电影名称：" + movieName);



        Gson gson = new Gson();

        MovieRecommendationService recommendationService = new MovieRecommendationService();
        List<Movie> top10Movies = null;
        try {
            top10Movies = recommendationService.getTop10SimilarMoviesByName(movieName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String top10MoviesJson = gson.toJson(top10Movies);
//                    request.getSession().setAttribute("top10MoviesJson", top10MoviesJson);
        request.getSession().setAttribute("top10MoviesJson", top10MoviesJson);
        request.getRequestDispatcher("./jsp/recommendation.jsp").forward(request, response);
    }
}
