package com.example.second_test;

import com.example.User.User;
import dao.UserDAO;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//
//        UserDAO userDAO = new UserDAO();
//        User user = userDAO.findUser(username, password);
//
//        if (user != null) {
//            request.getSession().setAttribute("user", user);
//            response.sendRedirect("./html/square.html");
//        } else {
//            PrintWriter out = response.getWriter();
//            out.println("<html><body><p>Invalid username or password</p></body></html>");
//        }
//    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if("ask".equals(action))
        {
            response.sendRedirect("jsp/login.jsp");
        }

        if ("login".equals(action)) {
            // 处理登录请求
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            UserDAO userDao = new UserDAO();
            User user = userDao.findUser(username, password);
            if (user != null) {
                request.getSession().setAttribute("user", user);
                response.sendRedirect("./jsp/Square1.jsp");
            } else {
                response.sendRedirect("jsp/login.jsp");
            }
        } else if ("register".equals(action)) {
            // 处理注册请求
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            UserDAO userDao = new UserDAO();
            User user = userDao.addUser(username, password);
            if (user != null) {
                request.getSession().setAttribute("user", user);
                response.sendRedirect("jsp/Survey.jsp");
            } else {
                response.sendRedirect("jsp/login.jsp");
            }
        }
    }

}
