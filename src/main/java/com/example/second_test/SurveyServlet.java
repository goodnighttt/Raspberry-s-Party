package com.example.second_test;


import com.example.User.User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SurveyServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 获取用户提交的数据
        String movie = request.getParameter("movie");
        String song = request.getParameter("song");
        String grade = request.getParameter("grade");
        String favoriteCourse = request.getParameter("favorite_course");

        // 获取当前登录用户的 ID
        int userId = ((User) request.getSession().getAttribute("user")).getId();

        // 将数据写入数据库
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "root");
            String query = "INSERT INTO survey (user_id, movie, song, grade, favoritecourse) VALUES (?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(query);
            statement.setInt(1, userId);
            statement.setString(2, movie);
            statement.setString(3, song);
            statement.setString(4, grade);
            statement.setString(5, favoriteCourse);
            statement.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


        // 返回调查结果页面
        response.sendRedirect("./jsp/Square1.jsp");
    }
}
