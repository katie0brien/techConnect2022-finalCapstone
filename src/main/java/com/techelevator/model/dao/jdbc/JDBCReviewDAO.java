package com.techelevator.model.dao.jdbc;

import com.techelevator.model.dao.ReviewDAO;
import com.techelevator.model.dto.Review;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public class JDBCReviewDAO implements ReviewDAO {

    JdbcTemplate jdbcTemplate;

    public JDBCReviewDAO(DataSource dataSource) {this.jdbcTemplate = new JdbcTemplate(dataSource);}

    @Override
    public List<Review> getAllReviews() {
        String sql = "SELECT *\n" +
                "FROM review;";

        List<Review> reviews = new ArrayList<>();
        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql);

        while(rows.next()) {
            reviews.add(mapToReview(rows));
        }

        return reviews;
    }

    @Override
    public List<Review> getAllReviewsByUser() {
        String sql = "SELECT *\n" +
                "FROM review\n" +
                "WHERE user_id = ?;";

        List<Review> reviews = new ArrayList<>();
        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql);

        while(rows.next()) {
            reviews.add(mapToReview(rows));
        }

        return reviews;
    }

    @Override
    public List<Review> getAllReviewsLandmark() {
        String sql = "SELECT *\n" +
                "FROM review\n" +
                "WHERE landmark_id ILIKE ?;";

        List<Review> reviews = new ArrayList<>();
        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql);

        while(rows.next()) {
            reviews.add(mapToReview(rows));
        }

        return reviews;
    }

    @Override
    public Queue<String> getAllCoordinatesDesc() {
        String sql = "SELECT longitude, latitude, COUNT(*) as nums_of_likes\n" +
                "FROM review\n" +
                "GROUP BY latitude, longitude\n" +
                "ORDER BY nums_of_likes DESC;";

        Queue<String> order = new LinkedList<>();
        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql);

        while(rows.next()) {
            String coordinates = rows.getString("latitude") + " " + rows.getString("longitude");
            order.add(coordinates);
        }

        return order;
    }

    @Override
    public List<Review> getAllReviewsDesc(Queue<String> order) {
        String sql = "SELECT *\n" +
                "FROM landmark\n" +
                "Where latitude = ? AND longitude = ?;";

        List<Review> reviews = new ArrayList<>();
        while(!order.isEmpty()) {
            String[] coordinates = order.poll().split(" ");
            String latitude = coordinates[0];
            String longitude = coordinates[1];

            SqlRowSet rows = jdbcTemplate.queryForRowSet(sql, latitude, longitude);

            while(rows.next()) {
                reviews.add(mapToReview(rows));
            }

        }

        return reviews;
    }

    @Override
    public Review getReviewByID(int id) {
        String sql = "SELECT *\n" +
                "FROM review\n" +
                "WHERE review_id = ?;";

        SqlRowSet row = jdbcTemplate.queryForRowSet(sql, id);

        if (row.next()) {
            return mapToReview(row);
        }
        return null;
    }

    public Review mapToReview(SqlRowSet row) {
        Review review = new Review();
        review.setId(row.getInt("review_id"));
        review.setLandmarkId(row.getString("landmark_id"));
        review.setUserId(row.getInt("user_id"));
        review.setThumbsUp(row.getBoolean("thumbs_up"));
        review.setLatitude(row.getString("latitude"));
        review.setLongitude(row.getString("longitude"));

        return review;
    }
}
