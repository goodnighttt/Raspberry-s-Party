package dao;

import com.example.User.User;

import java.io.InputStream;
import java.sql.*;

public class UserDAO {

    private static final String SELECT_USER_SQL = "SELECT * FROM users WHERE username = ? AND password = ?";

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
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb?useUnicode=true&characterEncoding=UTF-8", "root", "root");
            if (conn == null) {
                // 获取数据库连接失败
            } else {
                System.out.println("获取数据库连接成功");
                System.out.println(conn);
                // 获取数据库连接成功
            }

            // 创建PreparedStatement对象，设置参数并执行查询
            ps = conn.prepareStatement( "SELECT * FROM users WHERE username = ? AND password = ?");
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

            // 如果查询结果集中有记录，则创建对应的User对象
            if (rs.next()) {
                System.out.println("找到了用户：" + rs.getString("username"));
                user = new User(rs.getInt("user_id"), rs.getString("username"), rs.getString("password"),rs.getBytes("profile_pic"));
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
            // 加载MySQL数据库驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 获取与数据库的连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "root");

            // 创建PreparedStatement对象，设置参数并执行插入操作
            ps = conn.prepareStatement("INSERT INTO users (username, password) VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, username); // 设置第一个参数为用户名
            ps.setString(2, password); // 设置第二个参数为密码

            ps.executeUpdate(); // 执行更新操作
            rs = ps.getGeneratedKeys(); // 获取生成的主键

            if (rs.next()) {
                // 从结果集中获取生成的主键值和用户名、密码，创建一个User对象
                // 使用rs.getInt(1)获取第一列的整数值（生成的主键）
                // username和password是已经设置好的变量
                user = new User(rs.getInt(1), username, password, null);  // 目前，我们将profilePic参数设置为null
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

    private static final String INSERT_IMAGE_SQL = "UPDATE users SET profile_pic = ? WHERE username = ?";

    public boolean addImage(String username, InputStream image) throws ClassNotFoundException {
        System.out.println("addImage() called");
        boolean rowUpdated = false;
        // 加载数据库驱动程序
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "root");
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_IMAGE_SQL)) {
            preparedStatement.setBlob(1, image);
            preparedStatement.setString(2, username);
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    public byte[] getImage(String username) throws ClassNotFoundException {
        // 加载数据库驱动程序
        Class.forName("com.mysql.cj.jdbc.Driver");
        String query = "SELECT profile_pic FROM users WHERE username = ?";
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "root");
             PreparedStatement ps = connection.prepareStatement(query)) {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Blob blob = rs.getBlob("profile_pic");
                return blob.getBytes(1, (int) blob.length());
            } else {
                return null;  // or return a default image
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }



}
