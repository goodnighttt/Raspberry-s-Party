package com.example.Servlet;

import com.example.Movie.Movie;
import com.example.Page.Page;
import com.example.Service.MovieRecommendationService;
import com.example.Survey.Survey;
import com.example.User.User;
import dao.PageDAO;
import dao.SurveyDAO;
import dao.UserDAO;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 获取请求的参数
        String action = request.getParameter("action");
        if (action != null && action.equals("ask")) {
            // 如果 action 参数是 "ask"，做一些处理
            response.sendRedirect("Login/login1.jsp");
//            // 例如，这里可以设置一些属性到 request 对象，然后转发到其他的 JSP 页面
//            request.setAttribute("attributeName", "attributeValue");
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/somepage.jsp");
//            dispatcher.forward(request, response);
        } else {
            // 如果 action 参数不是 "ask"，做其他的处理
        }
    }


    private static final long serialVersionUID = 1L;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if("ask".equals(action))
        {
            response.sendRedirect("Login/login1.jsp");
        }

        if ("login".equals(action)) {
            // 处理登录请求
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            System.out.println("username: " + username);
            System.out.println("password: " + password);
            UserDAO userDao = new UserDAO();
            User user = userDao.findUser(username, password);
//            request.getSession().setAttribute("user", user);
            System.out.println("user: " + user);
            if (user != null) {
                request.getSession().setAttribute("user", user);

                //去数据库中查询该用户的问卷信息，并获得电影推荐
                SurveyDAO surveyDao = new SurveyDAO();
                Survey survey = surveyDao.findSurveyByUserId(user.getId());
//                request.getSession().setAttribute("survey", survey);
                String movieName = survey.getMovie();

//                response.setContentType("text/plain");
//                response.setCharacterEncoding("UTF-8");
//                response.getWriter().write(movieName);

//                response.sendRedirect("Survey/survey.jsp");
                if (survey != null) {
                    // Survey found for the user
                    request.getSession().setAttribute("survey", survey);
                    // Get movie recommendations
//                    String movieName = survey.getMovie();
                    System.out.println("电影名称：" + movieName);
                    Gson gson = new Gson();
                    MovieRecommendationService recommendationService = new MovieRecommendationService();
                    List<Movie> top10Movies = null;
                    try {
                        top10Movies = recommendationService.getTop10SimilarMoviesByName(movieName);
                    } catch (ClassNotFoundException e) {
                        e.printStackTrace();
                    }
                    String top10MoviesJson = gson.toJson(top10Movies);
                    System.out.println("top10MoviesJson: " + top10MoviesJson);
                    request.getSession().setAttribute("top10MoviesJson", top10MoviesJson);
//                    request.getRequestDispatcher("./jsp/recommendation.jsp").forward(request, response);

                    // 获取最近三条记录的Page对象列表
                    List<Page> recentPages = PageDAO.getRecentPages(3);
//                    System.out.println("recentPages: " + recentPages);
                    request.getSession().setAttribute("recentPages", recentPages);
                    response.sendRedirect("NewSquare/newSquare1.jsp");

//                    request.getRequestDispatcher("./jsp/recommendation.jsp").forward(request, response);
//                    System.out.println(top10Movies);
                }

            } else {
                response.sendRedirect("Login/login1.jsp");
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
                response.sendRedirect("Login/login1.jsp");
            }
        }
    }

}
