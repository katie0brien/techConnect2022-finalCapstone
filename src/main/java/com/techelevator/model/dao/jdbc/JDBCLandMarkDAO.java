package com.techelevator.model.dao.jdbc;

import com.techelevator.model.dao.LandmarkDAO;
import com.techelevator.model.dto.Landmark;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JDBCLandMarkDAO implements LandmarkDAO {

    private final String BASE_SQL = "SELECT *\n" +
            "FROM landmark";

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JDBCLandMarkDAO(DataSource dataSource) {jdbcTemplate = new JdbcTemplate(dataSource);}
    @Override
    public List<Landmark> getAllLandmarks() {
        List<Landmark> landmarks = new ArrayList<>();

        SqlRowSet row = jdbcTemplate.queryForRowSet(BASE_SQL + ";");

        while (row.next()) {
            landmarks.add(mapToLandmark(row));
        }

        return landmarks;
    }

    @Override
    public List<Landmark> getLandmarksByCity(String city) {
        List<Landmark> landmarks = new ArrayList<>();

        String sql = BASE_SQL + "WHERE city = ?";

        SqlRowSet row = jdbcTemplate.queryForRowSet(BASE_SQL, city);

        while (row.next()) {
            landmarks.add(mapToLandmark(row));
        }

        return landmarks;
    }

    @Override
    public List<Landmark> getLandmarksByCountry(String country) {
        List<Landmark> landmarks = new ArrayList<>();

        String sql = BASE_SQL + "WHERE country = ?";

        SqlRowSet row = jdbcTemplate.queryForRowSet(BASE_SQL, country);

        while (row.next()) {
            landmarks.add(mapToLandmark(row));
        }

        return landmarks;
    }

    @Override
    public List<Landmark> getLandmarksByState(String stateOrRegion) {
        List<Landmark> landmarks = new ArrayList<>();

        String sql = BASE_SQL + "WHERE state_or_region = ?";

        SqlRowSet row = jdbcTemplate.queryForRowSet(BASE_SQL, stateOrRegion);

        while (row.next()) {
            landmarks.add(mapToLandmark(row));
        }

        return landmarks;
    }

    @Override
    public List<Landmark> getLandmarksByUser(int userID) {
        List<Landmark> landmarks = new ArrayList<>();

        String sql = "SELECT *\n" +
                "FROM landmark\n" +
                "WHERE id IN (SELECT landmark_id\n" +
                "             FROM user_landmark \n" +
                "             WHERE user_id = ?);";

        SqlRowSet row = jdbcTemplate.queryForRowSet(BASE_SQL, userID);

        while (row.next()) {
            landmarks.add(mapToLandmark(row));
        }

        return landmarks;
    }

    @Override
    public Landmark getLandmarkByID(String ID) {

        String sql = BASE_SQL + "WHERE id = ?";

        SqlRowSet row = jdbcTemplate.queryForRowSet(BASE_SQL, ID);

        while (row.next()) {
           return mapToLandmark(row);
        }

        return null;
    }

    @Override
    public void editLandmark(Landmark landmark) {
        String sql = "UPDATE landmark\n" +
                "SET latitude = ?, longitude = ?, name = ?, street_address = ?,\n" +
                "    city = ?, state_or_region = ?, country = ?\n" +
                "WHERE id = ?;";

        int num = jdbcTemplate.update(sql,landmark.getLatitude(),landmark.getLongitude(),landmark.getName(),
                landmark.getStreetAddress(),landmark.getCity(), landmark.getStateOrRegion(), landmark.getStateOrRegion(),
                landmark.getId());
    }

    @Override
    public void deleteLandmark(long id) {
        String sql = "DELETE\n" +
                "FROM landmark\n" +
                "WHERE id = ?;";

        int num = jdbcTemplate.update(sql, id);
    }

    @Override
    public void addLandmark(Landmark landmark) {
        String sql = "INSERT INTO landmark(ID, LATITUDE, LONGITUDE, NAME, STREET_ADDRESS, CITY, STATE_OR_REGION, COUNTRY)\n" +
                "VALUES (?,?,?,?,?,?,?,?);";

        int num = jdbcTemplate.update(sql,landmark.getId(),landmark.getLatitude(),landmark.getLongitude(),landmark.getName(),
                                        landmark.getStreetAddress(),landmark.getCity(), landmark.getStateOrRegion(), landmark.getStateOrRegion());
    }

    public Landmark mapToLandmark(SqlRowSet row) {
        Landmark landmark = new Landmark();

        landmark.setId(row.getString("id"));
        landmark.setLatitude(row.getString("latitude"));
        landmark.setLongitude(row.getString("longitude"));
        landmark.setName(row.getString("name"));
        landmark.setStreetAddress(row.getString("street_address"));
        landmark.setCity(row.getString("city"));
        landmark.setStateOrRegion(row.getString("state_or_region"));
        landmark.setCountry(row.getString("country"));

        return landmark;
    }
}
