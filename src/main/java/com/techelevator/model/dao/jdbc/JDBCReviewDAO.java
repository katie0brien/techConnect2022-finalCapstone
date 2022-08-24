package com.techelevator.model.dao.jdbc;

import com.techelevator.model.dao.ReviewDAO;
import com.techelevator.model.dto.Review;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

@Component
public class JDBCReviewDAO implements ReviewDAO {

    JdbcTemplate jdbcTemplate;

    public JDBCReviewDAO(DataSource dataSource) {this.jdbcTemplate = new JdbcTemplate(dataSource);}

    @Override
    public void updateReview(int landmarkId, boolean liked) {
        String sql = "UPDATE user_review\n" +
                "SET thumbs_up = ?\n" +
                "WHERE landmark_id = ?;";

        String choice = liked ? "FALSE" : "TRUE";

        jdbcTemplate.update(sql,choice,landmarkId);
    }
}
