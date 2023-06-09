package dao;

import com.example.Comment.Comment;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {
    private static final String INSERT_COMMENT_SQL = "INSERT INTO Comments (username, content, commentTime, pageId) VALUES (?, ?, ?, ?)";
    private static final String SELECT_COMMENT_COUNT_SQL = "SELECT COUNT(*) AS count FROM Comments WHERE pageId = ?";

    public static void addComment(int pageId,String username, String content, Timestamp timestamp) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // 加载数据库驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 获取数据库连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "root");

            // 创建PreparedStatement对象，设置参数并执行插入操作
            ps = conn.prepareStatement(INSERT_COMMENT_SQL);
            ps.setString(1, username);
            ps.setString(2, content);
            ps.setTimestamp(3, timestamp);
            ps.setInt(4, pageId);

            ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // 关闭PreparedStatement和Connection对象
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static int getCommentCountByPageId(int pageId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int commentCount = 0;

        try {
            // 加载数据库驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 获取数据库连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "root");

            // 创建PreparedStatement对象，设置参数并执行查询操作
            ps = conn.prepareStatement(SELECT_COMMENT_COUNT_SQL);
            ps.setInt(1, pageId);

            rs = ps.executeQuery();
            if (rs.next()) {
                commentCount = rs.getInt("count");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // 关闭ResultSet、PreparedStatement和Connection对象
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return commentCount;
    }

    public static List<Comment> getCommentsByPageId(int pageId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Comment> comments = new ArrayList<>();

        try {
            // 加载数据库驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 获取数据库连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "root");

            // 创建PreparedStatement对象，设置参数并执行查询操作
            ps = conn.prepareStatement("SELECT * FROM Comments WHERE pageId = ? ORDER BY commentTime DESC");
            ps.setInt(1, pageId);

            rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                String content = rs.getString("content");
                Timestamp commentTime = rs.getTimestamp("commentTime");

                Comment comment = new Comment(username, content, commentTime, pageId);
                comments.add(comment);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // 关闭ResultSet、PreparedStatement和Connection对象
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return comments;
    }

}
