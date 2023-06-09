package dao;

import com.example.Survey.Survey;
import com.example.User.User;

import java.sql.*;

public class SurveyDAO {
    private static final String SELECT_SURVEY_BY_USER_ID_SQL = "SELECT * FROM survey WHERE user_id = ?";

    /**
     * 根据用户ID查找调查问卷信息
     *
     * @param userId 用户ID
     * @return Survey对象，包含调查问卷信息
     */
    public Survey findSurveyByUserId(int userId) {
        Survey survey = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // 加载数据库驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");
            // 获取数据库连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb?useUnicode=true&characterEncoding=UTF-8", "root", "root");

            // 创建PreparedStatement对象，设置参数并执行查询
            ps = conn.prepareStatement(SELECT_SURVEY_BY_USER_ID_SQL);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            // 如果查询结果集中有记录，则创建对应的Survey对象
            if (rs.next()) {
                // 获取调查问卷字段的值
                String movie = rs.getString("movie");
                String song = rs.getString("song");
                String grade = rs.getString("grade");
                String favoriteCourse = rs.getString("favoritecourse");
                System.out.println("喜欢的电影：" + movie);
                System.out.println("喜欢的歌曲:"+song);
                System.out.println("年级：" + grade);
                System.out.println("喜欢的课程：" + favoriteCourse);

                // 创建Survey对象
                survey = new Survey(userId, movie,song, grade, favoriteCourse);
            } else {
                System.out.println("未找到用户的调查问卷信息：用户ID=" + userId);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // 关闭ResultSet、PreparedStatement和Connection对象
            // ...
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

        // 返回Survey对象，如果查询失败，则返回null
        return survey;
    }

    public Survey addSurvey(int userId, String movie, String song, String grade, String favoriteCourse)
    {
        Survey survey = null;
        Connection conn = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb?useUnicode=true&characterEncoding=UTF-8", "root", "root");
            String query = "INSERT INTO survey (user_id, movie,song, grade, favoritecourse) VALUES (?,?, ?, ?, ?)";
            statement = conn.prepareStatement(query);
            statement.setInt(1, userId);
            statement.setString(2, movie);
            statement.setString(3, song);
            statement.setString(4, grade);
            statement.setString(5, favoriteCourse);
            statement.executeUpdate();
            survey = new Survey(userId, movie, song, grade, favoriteCourse);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return survey;
    }
}
