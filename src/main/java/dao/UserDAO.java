package dao;

import com.example.User.User;

import java.sql.*;

public class UserDAO {

    private static final String SELECT_USER_SQL = "SELECT * FROM users WHERE username = ? AND password = ?";

//    private static final String INSERT_USER_SQL = "INSERT INTO users (username, password) VALUES (?, ?)";


    /**
     * 查找用户的方法，用于验证用户身份
     *
     * @param username 用户名
     * @param password 密码
     * @return 如果用户验证成功，返回对应的User对象；否则返回null
     */
    public User findUser(String username, String password) {
        User user = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // 加载数据库驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");
            // 打印连接成功的消息
            System.out.println("连接jdbc成功");

            // 获取数据库连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?useUnicode=true&characterEncoding=UTF-8", "root", "root");
            if (conn == null) {
                // 获取数据库连接失败
            } else {
                System.out.println("获取数据库连接成功");
                System.out.println(conn);
                // 获取数据库连接成功
            }

            // 创建PreparedStatement对象，设置参数并执行查询
            ps = conn.prepareStatement(SELECT_USER_SQL);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

//            System.out.println("user_id: " + rs.getInt("user_id"));
//            System.out.println("username: " + rs.getString("username"));
//            System.out.println("password: " + rs.getString("password"));

            // 如果查询结果集中有记录，则创建对应的User对象
            if (rs.next()) {
                System.out.println("找到了用户：" + rs.getString("username"));
                user = new User(rs.getInt("user_id"), rs.getString("password"), rs.getString("username"));
            } else {
                System.out.println("未找到用户：用户名=" + username + ", 密码=" + password);
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

        // 返回User对象，如果验证失败，则返回null
        return user;
    }


    private static final String INSERT_USER_SQL = "INSERT INTO users (username, password) VALUES (?, ?)";

    public User addUser(String username, String password) {
        User user = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // 加载数据库驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 获取数据库连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "root");

            // 创建PreparedStatement对象，设置参数并执行插入操作
            ps = conn.prepareStatement(INSERT_USER_SQL, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                user = new User(rs.getInt(1), password, username);
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
        return user;
    }


}
