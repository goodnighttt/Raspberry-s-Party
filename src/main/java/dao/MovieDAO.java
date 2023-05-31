//package dao;
//
//import com.example.Movie.Movie;
//
//import java.sql.*;
//
//public class MovieDAO {
//    private static final String SELECT_MOVIE_BY_NAME_SQL = "SELECT * FROM movies WHERE name = ?";
//
//    public Movie findMovieByName(String name) {
//        Movie movie = null;
//        Connection conn = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//
//        try {
//            // 加载数据库驱动程序
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            // 获取数据库连接
//            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?useUnicode=true&characterEncoding=UTF-8", "root", "root");
//
//            // 创建PreparedStatement对象，设置参数并执行查询
//            ps = conn.prepareStatement(SELECT_MOVIE_BY_NAME_SQL);
//            ps.setString(1, name);
//            rs = ps.executeQuery();
//
//            // 如果查询结果集中有记录，则创建对应的Movie对象
//            if (rs.next()) {
//                int movieId = rs.getInt("MOVIE_ID");
//                String movieName = rs.getString("NAME");
//                String alias = rs.getString("ALIAS");
//                String actors = rs.getString("ACTORS");
//                String cover = rs.getString("COVER");
//                String directors = rs.getString("DIRECTORS");
//                float doubanScore = rs.getFloat("DOUBAN_SCORE");
//                int doubanVotes = rs.getInt("DOUBAN_VOTES");
//                String genres = rs.getString("GENRES");
//                String imdbId = rs.getString("IMDB_ID");
//                String languages = rs.getString("LANGUAGES");
//                int mins = rs.getInt("MINS");
//                String officialSite = rs.getString("OFFICIAL_SITE");
//                String regions = rs.getString("REGIONS");
//                String releaseDate = rs.getString("RELEASE_DATE");
//                String slug = rs.getString("SLUG");
//                String storyline = rs.getString("STORYLINE");
//                String tags = rs.getString("TAGS");
//                int year = rs.getInt("YEAR");
//                String actorIds = rs.getString("ACTOR_IDS");
//                String directorIds = rs.getString("DIRECTOR_IDS");
//
//                // 创建Movie对象
//                movie = new Movie(movieId, movieName, alias, actors, cover, directors, doubanScore, doubanVotes, genres, imdbId, languages, mins, officialSite, regions, releaseDate, slug, storyline, tags, year, actorIds, directorIds);
//            } else {
//                System.out.println("未找到该电影信息：电影名称=" + name);
//            }
//        } catch (SQLException | ClassNotFoundException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (rs != null) {
//                    rs.close();
//                }
//                if (ps != null) {
//                    ps.close();
//                }
//                if (conn != null) {
//                    conn.close();
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//
//        // 返回Movie对象，如果查询失败，则返回null
//        return movie;
//    }
//}
