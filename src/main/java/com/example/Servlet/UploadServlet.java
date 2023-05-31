package com.example.Servlet;

//import com.example.dao.UserDAO;
import com.example.User.User;
import dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "UploadServlet", value = "/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        // Initialize UserDAO
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Not used
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String username = user.getUsername();

        // Check if the file part is present
        Part filePart = request.getPart("image"); // Retrieves <input type="file" name="image">
        if (filePart == null) {
            System.out.println("filePart is null");
            // Handle the error - for example, you can send an error message to the client
            return;
        }

        InputStream inputStream = filePart.getInputStream();

        // Call addImage method in UserDAO
        try {
            System.out.println("username: " + username);
            userDAO.addImage(username, inputStream);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
