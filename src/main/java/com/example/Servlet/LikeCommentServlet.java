package com.example.Servlet;

import com.example.Comment.Comment;
import com.example.Page.Page;
import dao.CommentDAO;
import dao.LikeDAO;
import dao.PageDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet(name = "LikeCommentServlet", value = "/LikeCommentServlet")
public class LikeCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//         获取请求参数
        String action = request.getParameter("action");
        int pageId = Integer.parseInt(request.getParameter("pageId"));

        // 根据action参数执行相应操作
        if (action.equals("like")) {
            String username = request.getParameter("username");

            Timestamp likeTime = new Timestamp(System.currentTimeMillis());

            // 将点赞数据写入like数据表
            LikeDAO.addLike(pageId, username, likeTime);
        } else if (action.equals("comment")) {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            response.setContentType("text/html;charset=utf-8");

            String username = request.getParameter("username");
            String commentContent = request.getParameter("commentContent");
            System.out.println(commentContent);
            Timestamp commentTime = new Timestamp(System.currentTimeMillis());

            // 将评论数据写入comment数据表
            CommentDAO.addComment(pageId, username, commentContent, commentTime);

            // 重新查询评论列表，并更新请求对象中的数据
            List<Comment> comments = CommentDAO.getCommentsByPageId(pageId);
            request.setAttribute("comments", comments);

            // 重新转发请求到详情页
            RequestDispatcher dispatcher = request.getRequestDispatcher("/PageDetailServlet");
            dispatcher.forward(request, response);
        }


        // 更新Pages表中的点赞数和评论数
        Page page = PageDAO.getPageById(pageId);
        if (page != null) {
            // 更新点赞数
            int likeCount = LikeDAO.getLikeCountByPageId(pageId);
//            page.setLikes(likeCount);

            // 更新评论数
            int commentCount = CommentDAO.getCommentCountByPageId(pageId);
//            page.setComments(commentCount);

            PageDAO.updateLikes(pageId, likeCount);
            PageDAO.updateComments(pageId, commentCount);
        }

        // 返回响应
        response.sendRedirect("page.jsp?pageId=" + pageId);
    }
}

//package com.example.Servlet;
//
//        import com.example.Page.Page;
//        import dao.CommentDAO;
//        import dao.LikeDAO;
//        import dao.PageDAO;
//
//        import javax.servlet.ServletException;
//        import javax.servlet.annotation.WebServlet;
//        import javax.servlet.http.HttpServlet;
//        import javax.servlet.http.HttpServletRequest;
//        import javax.servlet.http.HttpServletResponse;
//        import java.io.IOException;
//        import java.sql.Timestamp;
//        import java.time.LocalDateTime;

//@WebServlet(name = "LikeCommentServlet ", value = "/LikeCommentServlet ")
//public class LikeCommentServlet extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // 获取请求参数
//        String action = request.getParameter("action");
//        int pageId = Integer.parseInt(request.getParameter("pageId"));
//
//        // 根据action参数执行相应操作
//        if (action.equals("like")) {
//            String username = request.getParameter("username");
//
//            Timestamp likeTime = new Timestamp(System.currentTimeMillis());
//
//            // 将点赞数据写入like数据表
//            LikeDAO.addLike(pageId, username, likeTime);
//        } else if (action.equals("comment")) {
//            String username = request.getParameter("username");
//            String commentContent = request.getParameter("commentContent");
//            Timestamp commentTime = new Timestamp(System.currentTimeMillis());
//
//            // 将评论数据写入comment数据表
//            CommentDAO.addComment(pageId, username, commentContent, commentTime);
//        }
//
//        // 更新Pages表中的点赞数和评论数
//        Page page = PageDAO.getPageById(pageId);
//        if (page != null) {
//            // 更新点赞数
//            int likeCount = LikeDAO.getLikeCountByPageId(pageId);
////            page.setLikes(likeCount);
//
//            // 更新评论数
//            int commentCount = CommentDAO.getCommentCountByPageId(pageId);
////            page.setComments(commentCount);
//
//            PageDAO.updateLikes(pageId, likeCount);
//            PageDAO.updateComments(pageId, commentCount);
//        }
//
//        // 返回响应
//        response.sendRedirect("page.jsp?pageId=" + pageId);
//    }
//}