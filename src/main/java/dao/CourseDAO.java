package dao;

import com.example.Course;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.*;

public class CourseDAO {
    private static final String INSERT_COURSE_SQL = "INSERT INTO Courses (name, day_of_week, period, course_name) VALUES (?, ?, ?, ?)";

    public static void addCourse(Course course) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // 加载数据库驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 获取数据库连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "root");

            // 创建PreparedStatement对象，设置参数并执行插入操作
            ps = conn.prepareStatement(INSERT_COURSE_SQL);
            ps.setString(1, course.getName());
            ps.setInt(2, course.getDayOfWeek());
            ps.setInt(3, course.getPeriod());
            ps.setString(4, course.getCourseName());

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
}
