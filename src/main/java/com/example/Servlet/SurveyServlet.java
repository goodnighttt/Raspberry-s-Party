package com.example.Servlet;


import com.example.Survey.Survey;
import com.example.User.User;
import dao.SurveyDAO;

import java.io.IOException;
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
            response.sendRedirect("./jsp/Square1.jsp");
        }
        else {
            response.sendRedirect("jsp/login.jsp");
        }



//        // 将数据写入数据库
//        Connection connection = null;
//        PreparedStatement statement = null;
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb?useUnicode=true&characterEncoding=UTF-8", "root", "root");
//            String query = "INSERT INTO survey (user_id, movie, song, grade, favoritecourse) VALUES (?, ?, ?, ?, ?)";
//            statement = connection.prepareStatement(query);
//            statement.setInt(1, userId);
//            statement.setString(2, movie);
//            statement.setString(3, song);
//            statement.setString(4, grade);
//            statement.setString(5, favoriteCourse);
//            statement.executeUpdate();
//        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (statement != null) {
//                    statement.close();
//                }
//                if (connection != null) {
//                    connection.close();
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }



    }
}
