package com.example.Servlet;

import com.example.Page.Page;
import dao.PageDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchPageServlet", value = "/SearchPageServlet")
public class SearchPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");

        // Query the database for pages with matching titles
        List<Page> pages = PageDAO.findPagesByTitle(title);

        // Pass the result to the frontend
        request.setAttribute("pages", pages);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Page/pageList.jsp");
        dispatcher.forward(request, response);
    }
}
