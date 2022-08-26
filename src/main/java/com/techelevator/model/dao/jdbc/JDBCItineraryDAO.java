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
    public List<Itinerary> getItinerariesByUserName(String userName) {
        List<Itinerary> itineraries = new ArrayList<>();

        String sql = "SELECT * " +
                "FROM itinerary AS i " +
                "INNER JOIN user_itinerary AS ui " +
                "ON ui.itinerary_id = i.id " +
                "INNER JOIN app_user AS au " +
                "ON au.id = ui.user_id " +
                "WHERE au.user_name = ?;";

//        String sql = "SELECT *\n" +
//                "FROM itinerary\n" +
//                "WHERE id IN (SELECT itinerary_id FROM user_itinerary WHERE user_id = ?)";

        SqlRowSet row = jdbcTemplate.queryForRowSet(sql, userName);

        while(row.next()) {
            Itinerary temp = new Itinerary();
            temp.setName(row.getString("name"));
            temp.setIrineraryId(row.getString("id"));
            temp.setToDate((row.getDate("to_date").toLocalDate()));
            temp.setFromDate((row.getDate("from_date").toLocalDate()));
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
            temp.setToDate((row.getDate("to_date").toLocalDate()));
            temp.setFromDate((row.getDate("from_date").toLocalDate()));
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
        jdbcTemplate.update(sql, itinerary.getName(), itinerary.getFromDate(), itinerary.getToDate(), Integer.parseInt(itinerary.getIrineraryId()));

    }

    @Override
    public void deleteLandmarkFromItinerary(int itineraryId, String landmarkId) {
        String sql = "DELETE FROM itinerary_landmark " +
                "WHERE itinerary_id = ? AND landmark_id = ?;";

       jdbcTemplate.update(sql, itineraryId, landmarkId);

    }

    @Override
    public void createItinerary(Itinerary itinerary, String userId) {
        String sql = "INSERT INTO itinerary(name, from_date, to_date) " +
                "VALUES(?,?,?) " +
                "RETURNING id;";


        int id = jdbcTemplate.queryForObject(sql, Integer.class, itinerary.getName(),itinerary.getFromDate(),itinerary.getToDate());


        addItineraryIdToRelatorTable(id, userId);
    }

    @Override
    public void addItineraryIdToRelatorTable(int itineraryId, String userId) {
        String sql = "INSERT INTO user_itinerary(itinerary_id, user_id) " +
                "VALUES(?, " +
                "(SELECT id " +
                "FROM app_user " +
                "WHERE user_name = ?)" +
                ");";

        jdbcTemplate.update(sql, itineraryId, userId);
    }

    @Override
    public void deleteItinerary(int id, String userId) {
        String sql = "DELETE FROM user_itinerary " +
                "WHERE user_id = (SELECT id FROM app_user WHERE user_name = ?) AND itinerary_id = ?;";

        jdbcTemplate.update(sql, userId, id);

        sql = "DELETE FROM itinerary " +
                "WHERE id = ?;";

        jdbcTemplate.update(sql, id);
    }



}
