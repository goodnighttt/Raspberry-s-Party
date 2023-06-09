package dao;

import java.sql.*;

public class LikeDAO {
    private static final String INSERT_LIKE_SQL = "INSERT INTO Likes (username, likeTime, pageId) VALUES (?, ?, ?)";
    private static final String SELECT_LIKE_COUNT_SQL = "SELECT COUNT(*) AS count FROM Likes WHERE pageId = ?";

    public static void addLike(int pageId,String username, Timestamp timestamp) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // 加载数据库驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 获取数据库连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "root");

            // 创建PreparedStatement对象，设置参数并执行插入操作
            ps = conn.prepareStatement(INSERT_LIKE_SQL);
            ps.setString(1, username);
            ps.setTimestamp(2, timestamp);
            ps.setInt(3, pageId);

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

    public static int getLikeCountByPageId(int pageId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int likeCount = 0;

        try {
            // 加载数据库驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 获取数据库连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "root");

            // 创建PreparedStatement对象，设置参数并执行查询操作
            ps = conn.prepareStatement(SELECT_LIKE_COUNT_SQL);
            ps.setInt(1, pageId);

            rs = ps.executeQuery();
            if (rs.next()) {
                likeCount = rs.getInt("count");
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

        return likeCount;
    }
}
