package com.example.Servlet;

import com.example.User.User;
import dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ImagePageServlet", value = "/ImagePageServlet")
public class ImagePageServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        // Initialize UserDAO
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the username from session
        String username = request.getParameter("username");

        // Retrieve image from database
        byte[] imageBytes = new byte[0];
        try {
            imageBytes = userDAO.getImage(username);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        // Write image data to response
        response.setContentType(getServletContext().getMimeType("image/jpeg"));
        response.setContentLength(imageBytes.length);
        response.getOutputStream().write(imageBytes);
    }
}
