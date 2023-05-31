package com.example.Servlet;

import com.example.Page.Page;
import com.example.User.User;
import dao.PageDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "EditorServlet", value = "/EditorServlet")
public class EditorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String username = user.getUsername();

        // 获取用户提交的数据
        String content = request.getParameter("content");
        System.out.println(content);

        //假设我的content内容如下：
        //<h1 label="标题居中" style="font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;">ddddd<br/></h1><p>dddddd<br/></p>
        //现在我需要获取<h1开始到</h1>结束的内容，也就是标题内容
        //获取标题内容
        String headtitle = content.substring(content.indexOf("<h1"), content.indexOf("</h1>"));
        headtitle += "</h1>";

        //再获取</h1>之后的作为正文内容
        content = content.substring(content.indexOf("</h1>")+5);

        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
        Date date = new Date(System.currentTimeMillis());
        String dateStr = formatter.format(date);
        System.out.println(formatter.format(date));

        // 将数据封装到 Page 对象中
//        Page page = new Page(username, headtitle, content, da, 0, 0);

        // 将 Page 对象保存到数据库中
        PageDAO.addPage(username, headtitle, content, dateStr, 0, 0);






        request.setAttribute("content", content);
        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/EditorTest.jsp");
        dispatcher.forward(request, response);

    }
}
