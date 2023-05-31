package com.example.Servlet;
import com.example.User.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SearchUserServlet", value = "/SearchUserServlet")
public class SearchUserServlet extends HttpServlet {

    private Connection connection;

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

    private List<User> searchUser(String username) {
        List<User> users = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM users WHERE username LIKE ?");
            ps.setString(1, "%" + username + "%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                User user = new User();
                user.setUsername(rs.getString("username"));
                user.setId(rs.getInt("user_id"));
//                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");

        // Search users from database
        List<User> users = searchUser(username);

        // Display search results
        for (User user : users) {
            out.println("<p>" + user.getUsername() + " " + user.getId() + " " + user.getPassword()+
                    " <a href=\"/FollowUserServlet?username=" + user.getUsername() + "\">Follow</a></p>");
        }
    }
}
