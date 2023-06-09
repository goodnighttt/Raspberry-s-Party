package com.example.Servlet;


import com.example.Movie.Movie;
import com.example.Page.Page;
import com.example.Service.MovieRecommendationService;
import com.example.Survey.Survey;
import com.example.User.User;
import com.google.gson.Gson;
import dao.PageDAO;
import dao.SurveyDAO;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SurveyServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        // 获取用户提交的数据
        String movie = request.getParameter("movie");
        String song = request.getParameter("song");
        String grade = request.getParameter("grade");
        String favoriteCourse = request.getParameter("favorite_course");

        // 获取当前登录用户的 ID
        int userId = ((User) request.getSession().getAttribute("user")).getId();

        // 输出收集到的数据
        System.out.println("用户ID: " + userId);
        System.out.println("电影: " + movie);
        System.out.println("歌曲: " + song);
        System.out.println("年级: " + grade);
        System.out.println("喜欢的课程: " + favoriteCourse);

        SurveyDAO surveyDao = new SurveyDAO();
        Survey survey = surveyDao.addSurvey(userId, movie, song, grade, favoriteCourse);
        if(survey != null)
        {
            request.getSession().setAttribute("survey", survey);
            Gson gson = new Gson();
            MovieRecommendationService recommendationService = new MovieRecommendationService();
            List<Movie> top10Movies = null;
            try {
                top10Movies = recommendationService.getTop10SimilarMoviesByName(movie);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            String top10MoviesJson = gson.toJson(top10Movies);
            System.out.println("top10MoviesJson: " + top10MoviesJson);
            request.getSession().setAttribute("top10MoviesJson", top10MoviesJson);

            // 获取最近三条记录的Page对象列表
            List<Page> recentPages = PageDAO.getRecentPages(3);
//                    System.out.println("recentPages: " + recentPages);
            request.getSession().setAttribute("recentPages", recentPages);
            response.sendRedirect("NewSquare/newSquare1.jsp");

        }
        else {
            // 获取最近三条记录的Page对象列表
            List<Page> recentPages = PageDAO.getRecentPages(3);
//                    System.out.println("recentPages: " + recentPages);
            request.getSession().setAttribute("recentPages", recentPages);
            response.sendRedirect("NewSquare/newSquare1.jsp");
//            response.sendRedirect("jsp/login.jsp");
        }



    }
}
