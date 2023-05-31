package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MovieListDAO {
    public List<String> getAllMovieNames() {
        List<String> movieNames = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // For MySQL
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/javaweb", "root", "root");  // Change to your database info

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT name FROM mymovies_copy1");

            while (rs.next()) {
                movieNames.add(rs.getString("name"));
            }

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        return movieNames;
    }
}
