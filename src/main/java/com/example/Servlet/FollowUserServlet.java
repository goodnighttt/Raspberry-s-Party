package com.example.Servlet;

import com.example.User.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "FollowUserServlet", value = "/FollowUserServlet")
public class FollowUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database Connection
    private Connection connection;

    @Override
    public void init() throws ServletException {
        // Initialize database connection
        String url = "jdbc:mysql://localhost:3306/javaweb";
        String username = "root";
        String password = "root";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User userA = (User) session.getAttribute("user"); // assume that you have set loggedInUser attribute in session when user logged in
        String userB = request.getParameter("username"); // username of the user to follow

        if (userA != null) {
            String sql = "INSERT INTO FollowPage (userA, userB) VALUES (?, ?)";
            try {
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, userA.getUsername()); // assuming getId() method is present in User class
                statement.setString(2, userB);
                int result = statement.executeUpdate();
                if (result > 0) {
                    // follow success, redirect to some page
                    response.sendRedirect("jsp/Square1.jsp");
                } else {
                    // follow fail, redirect to some page
                    response.sendRedirect("error.jsp");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            // user not logged in, redirect to login page
            response.sendRedirect("jsp/login.jsp");
        }
    }

    @Override
    public void destroy() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
