package dao;

import com.example.Page.Page;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PageDAO {
    private static final String INSERT_PAGE_SQL = "INSERT INTO Pages (user, headtitle, content, publishtime, likes, comments) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_PAGE_BY_PAGEID_SQL = "SELECT * FROM Pages WHERE pageId = ?";
    private static final String SELECT_PAGE_BY_USERNAME_SQL = "SELECT * FROM Pages WHERE user = ?";
    private static final String UPDATE_LIKES_SQL = "UPDATE Pages SET likes = ? WHERE pageId = ?";
    private static final String UPDATE_COMMENTS_SQL = "UPDATE Pages SET comments = ? WHERE pageId = ?";

    public static Page addPage(String username, String headtitle, String content, Timestamp publishtime, int likes, int comments) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Page page = null;

        try {
            // 加载数据库驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 获取数据库连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "root");

            ps = conn.prepareStatement(INSERT_PAGE_SQL, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, username);
            ps.setString(2, headtitle);
            ps.setString(3, content);
            ps.setTimestamp(4, publishtime);
            ps.setInt(5, likes);
            ps.setInt(6, comments);

            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                int id = rs.getInt(1);
                page = new Page(id, username, headtitle, content, publishtime, likes, comments);
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

        return page;
    }

    public static Page getPageById(int pageId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Page page = null;

        try {
            // 加载数据库驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 获取数据库连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "root");

            ps = conn.prepareStatement(SELECT_PAGE_BY_PAGEID_SQL);
            ps.setInt(1, pageId);
            rs = ps.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("pageId");
                String headtitle = rs.getString("headtitle");
                String username = rs.getString("user");
                String content = rs.getString("content");
                Timestamp publishtime = rs.getTimestamp("publishtime");
                int likes = rs.getInt("likes");
                int comments = rs.getInt("comments");

                page = new Page(id, username, headtitle, content, publishtime, likes, comments);
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

        return page;
    }

    public static List<Page> getPagesByUsername(String username) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Page> pages = new ArrayList<>();

        try {
            // 加载数据库驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 获取数据库连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "root");

            ps = conn.prepareStatement(SELECT_PAGE_BY_USERNAME_SQL);
            ps.setString(1, username);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String headtitle = rs.getString("headtitle");
                String content = rs.getString("content");
                Timestamp publishtime = rs.getTimestamp("publishtime");
                int likes = rs.getInt("likes");
                int comments = rs.getInt("comments");

                Page page = new Page(id, username, headtitle, content, publishtime, likes, comments);
                pages.add(page);
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

        return pages;
    }

    public static List<Page> findPagesByTitle(String title) {
        // Initialize the result list
        Connection conn = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//        List<Page> pages = new ArrayList<>();
        List<Page> pages = new ArrayList<>();

        try {
            // 加载数据库驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 获取数据库连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "root");
            // Establish the database connection


            // Prepare the SQL statement
            String sql = "SELECT * FROM pages WHERE headtitle LIKE ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            // Set the parameter
            pstmt.setString(1, "%" + title + "%");

            // Execute the query
            ResultSet rs = pstmt.executeQuery();

            // Process the result set
            while (rs.next()) {
                // Extract data from result set
                int id = rs.getInt("pageId");
                String username = rs.getString("user");
                String headtitle = rs.getString("headtitle");
                String content = rs.getString("content");
                Timestamp publishtime = rs.getTimestamp("publishtime");
                int likeNum = rs.getInt("likes");
                int commentNum = rs.getInt("comments");

                // Construct a Page object
                Page page = new Page(id,username, headtitle, content, publishtime, likeNum, commentNum);

                // Add the page to the result list
                pages.add(page);
            }

            // Clean-up environment
            rs.close();
            pstmt.close();
            conn.close();
        } catch(SQLException se) {
            // Handle errors for JDBC
            se.printStackTrace();
        } catch(Exception e) {
            // Handle errors for Class.forName
            e.printStackTrace();
        }

        // Return the result list
        return pages;
    }

    public static void updateLikes(int pageId, int likes) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // 加载数据库驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 获取数据库连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "root");

            ps = conn.prepareStatement(UPDATE_LIKES_SQL);
            ps.setInt(1, likes);
            ps.setInt(2, pageId);
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

    public static void updateComments(int pageId, int comments) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // 加载数据库驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 获取数据库连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "root");

            ps = conn.prepareStatement(UPDATE_COMMENTS_SQL);
            ps.setInt(1, comments);
            ps.setInt(2, pageId);
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

    public static List<Page> getRecentPages(int limit) {
        List<Page> pages = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // 加载数据库驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 获取数据库连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "root");

            // 编写SQL查询语句，查询最近的limit条记录
            String sql = "SELECT * FROM Pages ORDER BY pageId DESC LIMIT ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, limit);
            rs = ps.executeQuery();

            while (rs.next()) {
                Page page = new Page(
                        rs.getInt("pageId"),
                        rs.getString("user"),
                        rs.getString("headtitle"),
                        rs.getString("content"),
                        rs.getTimestamp("publishtime"),
                        rs.getInt("likes"),
                        rs.getInt("comments")
                );
                System.out.println(page.getHeadtitle());
                pages.add(page);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // 关闭PreparedStatement和Connection对象
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

        return pages;
    }



}
