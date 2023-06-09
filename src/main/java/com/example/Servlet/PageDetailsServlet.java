package com.example.Servlet;

import com.example.Page.Page;
import com.example.User.User;
import com.example.Comment.Comment;
import dao.PageDAO;
import dao.CommentDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PageDetailsServlet", value = "/PageDetailsServlet")
public class PageDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        // Convert id to int
        int idInt = Integer.parseInt(id);

        // Query the database for the page with the specified id
        Page page = PageDAO.getPageById(idInt);

        // Query the database for comments related to this page
        List<Comment> comments = CommentDAO.getCommentsByPageId(idInt);

        request.setAttribute("comments", comments);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String username = user.getUsername();

        request.setAttribute("user",user);
        // Pass the result to the frontend
        request.setAttribute("page", page);

        RequestDispatcher dispatcher = request.getRequestDispatcher("Page/detail.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
