package dao;

import com.example.Page.Page;
import com.example.User.User;

import java.sql.*;

public class PageDAO {
    private static final String INSERT_USER_SQL = "INSERT INTO Pages (user, headtitle,content,publishtime,likes,comments) VALUES (?, ?,?,?,?,?)";

    public static Page addPage(String username, String headtitle, String content, String publishtime, int likes, int comments) {
        User user = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        Page page = null;
        try {
            // 加载数据库驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 获取数据库连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "root");

            // 创建PreparedStatement对象，设置参数并执行插入操作
            ps = conn.prepareStatement(INSERT_USER_SQL, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, username);
            ps.setString(2, headtitle);
            ps.setString(3, content);
            ps.setString(4, publishtime);
            ps.setInt(5,likes);
            ps.setInt(6,comments);

            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
//                user = new User(rs.getInt(1), username, password);
                page = new Page(username, headtitle,content,publishtime,likes,comments);  // For now, we are passing null for profilePic
//                user = new User(rs.getInt(1), username, password, null);  // For now, we are passing null for profilePic
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

        // 返回User对象，如果插入失败，则返回null
        return page;
    }
}
