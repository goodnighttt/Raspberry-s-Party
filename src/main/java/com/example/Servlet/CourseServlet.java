package com.example.Servlet;

import com.example.Course;
import com.example.User.User;
import dao.CourseDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CourseServlet", value = "/CourseServlet")
public class CourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        // 获取前端传递的参数
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String username = user.getUsername();

        for(int dayOfWeek=1; dayOfWeek<=7; dayOfWeek++) {
            for(int period=1; period<=12; period++) {
                String courseName = request.getParameter("day" + dayOfWeek + "_lesson" + period);

                // 创建Course对象
                Course course = new Course();
                course.setName(username);
                course.setDayOfWeek(dayOfWeek);
                course.setPeriod(period);
                course.setCourseName(courseName);

                // 使用CourseDAO将Course对象写入数据库
                CourseDAO.addCourse(course);
            }
        }

        // 将结果返回给前端
        response.getWriter().write("Course added successfully.");
    }
}
