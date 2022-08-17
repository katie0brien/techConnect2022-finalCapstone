package com.techelevator.model.dao.jdbc;

import com.techelevator.model.dao.ItineraryDAO;
import com.techelevator.model.dto.Itinerary;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.techelevator.model.dao.LandmarkDAO;
import com.techelevator.model.dto.Landmark;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JDBCItineraryDAO implements ItineraryDAO {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JDBCItineraryDAO(DataSource dataSource) {this.jdbcTemplate = new JdbcTemplate(dataSource);}

    private JDBCLandMarkDAO jdbcLandMarkDAO;

    @Override
    public List<Itinerary> getItinerariesByUserName(String userName) {
        List<Itinerary> itineraries = new ArrayList<>();

        String sql = "SELECT * " +
                "FROM itinerary AS i " +
                "INNER JOIN user_itinerary AS ui " +
                "ON ui.itinerary_id = i.id " +
                "INNER JOIN app_user AS au " +
                "ON au.id = ui.user_id " +
                "WHERE au.user_name = ?;";

        SqlRowSet row = jdbcTemplate.queryForRowSet(sql);

        Itinerary temp = new Itinerary();

        while(row.next()) {
            temp.setName(row.getString("name"));
            temp.setIrineraryId(row.getString("id"));

            List<Landmark> landmarks = jdbcLandMarkDAO.getLandmarkByItineraryId(row.getInt("id"));

            for(Landmark land : landmarks) {
                temp.addLandmarkId(land.getId());
            }

            itineraries.add(temp);
        }

        return itineraries;
    }

    @Override
    public void editItineraryName(String name) {
        String sql = "UPDATE itinerary " +
                "SET name = ?;";

        jdbcTemplate.update(sql, name);

    }

    @Override
    public void deleteLandmarkFromItinerary(int itineraryId, String landmarkId) {
        String sql = "DELETE FROM itinerary_landmark " +
                "WHERE itinerary_id = ? AND landmark_id = ?;";

       jdbcTemplate.update(sql, itineraryId, landmarkId);

    }

    @Override
    public String createItinerary(String name) {
        String sql = "INSERT INTO itinerary(name) " +
                "VALUES(?) " +
                "RETURNING id;";

        addItineraryIdToRelatorTable(name, Integer.toString(jdbcTemplate.update(sql, name)));

        return Integer.toString(jdbcTemplate.update(sql, name));
    }

    @Override
    public void addItineraryIdToRelatorTable(String itineraryId, String userId) {
        String sql = "INSERT INTO user_itinerary(itinerary_id, user_id) " +
                "VALUES(?, ?);";

        jdbcTemplate.update(sql, itineraryId, userId);
    }
}
