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
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Component
public class JDBCItineraryDAO implements ItineraryDAO {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JDBCItineraryDAO(DataSource dataSource) {this.jdbcTemplate = new JdbcTemplate(dataSource);}

    private JDBCLandMarkDAO jdbcLandMarkDAO;

    @Override
    public List<Itinerary> getItinerariesByUserName(int userID) {
        List<Itinerary> itineraries = new ArrayList<>();

//        String sql = "SELECT * " +
//                "FROM itinerary AS i " +
//                "INNER JOIN user_itinerary AS ui " +
//                "ON ui.itinerary_id = i.id " +
//                "INNER JOIN app_user AS au " +
//                "ON au.id = ui.user_id " +
//                "WHERE au.user_name = ?;";

        String sql = "SELECT *\n" +
                "FROM itinerary\n" +
                "WHERE id IN (SELECT itinerary_id FROM user_itinerary WHERE user_id = ?)";

        SqlRowSet row = jdbcTemplate.queryForRowSet(sql, userID);

        while(row.next()) {
            Itinerary temp = new Itinerary();
            temp.setName(row.getString("name"));
            temp.setIrineraryId(row.getString("id"));
            temp.setFromDate(row.getString("from_date"));
            temp.setToDate(row.getString("to_date"));
            temp.setTempDate(row.getDate("to_date").toLocalDate());

//            List<Landmark> landmarks = jdbcLandMarkDAO.getLandmarkByItineraryId(row.getInt("id"));

//            for(Landmark land : landmarks) {
//                temp.addLandmarkId(land.getId());
//            }

            itineraries.add(temp);
        }

        return itineraries;
    }

    @Override
    public Itinerary getItineraryBy(int id) {
        String sql = "SELECT *\n" +
                "FROM itinerary\n" +
                "WHERE id = ?";

        SqlRowSet row = jdbcTemplate.queryForRowSet(sql, id);
        Itinerary temp = new Itinerary();

        if(row.next()) {
            temp.setName(row.getString("name"));
            temp.setIrineraryId(row.getString("id"));
            temp.setFromDate(row.getString("from_date"));
            temp.setToDate(row.getString("to_date"));
            temp.setTempDate(row.getDate("to_date").toLocalDate());
            temp.setActualFromDate(row.getDate("from_date").toLocalDate());
        }

        return temp;
    }

    @Override
    public void editItinerary(Itinerary itinerary) {
        String sql = "UPDATE itinerary " +
                "SET name = ?, from_date = ?, to_date = ? " +
                "WHERE id = ?;";

//        Date fromDate = Date.valueOf(itinerary.getFromDate());
//        Date toDate = Date.valueOf(itinerary.getToDate());
        jdbcTemplate.update(sql, itinerary.getName(), itinerary.getFromDate(), itinerary.getToDate(), itinerary.getIrineraryId());

    }

    @Override
    public void deleteLandmarkFromItinerary(int itineraryId, String landmarkId) {
        String sql = "DELETE FROM itinerary_landmark " +
                "WHERE itinerary_id = ? AND landmark_id = ?;";

       jdbcTemplate.update(sql, itineraryId, landmarkId);

    }

    @Override
    public void createItinerary(Itinerary itinerary, int userId) {
        String sql = "INSERT INTO itinerary(name, from_date, to_date) " +
                "VALUES(?,?,?) " +
                "RETURNING id;";

//        Date fromDate = Date.valueOf(itinerary.getFromDate());
//        Date toDate = Date.valueOf(itinerary.getToDate());

        int id = jdbcTemplate.queryForObject(sql, Integer.class, itinerary.getName(),Date.valueOf(itinerary.getFromDate()), Date.valueOf(itinerary.getToDate()));

        sql = "UPDATE itinerary " +
                "SET name = ? " +
                "WHERE id = ?;";

        jdbcTemplate.update(sql,itinerary.getName(), id);
        addItineraryIdToRelatorTable(id, userId);
    }

    @Override
    public void addItineraryIdToRelatorTable(int itineraryId, int userId) {
        String sql = "INSERT INTO user_itinerary(itinerary_id, user_id) " +
                "VALUES(?, ?);";

        jdbcTemplate.update(sql, itineraryId, userId);
    }

    @Override
    public void deleteItinerary(int id) {
        String sql = "DELETE FROM itinerary " +
                "WHERE id = ?;";

        jdbcTemplate.update(sql, id);
    }
}
