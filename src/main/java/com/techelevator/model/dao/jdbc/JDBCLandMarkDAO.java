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

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JDBCLandMarkDAO(DataSource dataSource) {this.jdbcTemplate = new JdbcTemplate(dataSource);}

    @Override
    public List<Landmark> getAllLandmarks() {
        List<Landmark> landmarks = new ArrayList<>();

        String sql = "SELECT *\n" +
                "FROM landmark;";

        SqlRowSet row = jdbcTemplate.queryForRowSet(sql);

        while (row.next()) {
            landmarks.add(mapToLandmark(row));
        }

        return landmarks;
    }

    @Override
    public List<Landmark> getLandmarksByCity(String city) {
        List<Landmark> landmarks = new ArrayList<>();

        String sql = "SELECT *\n" +
                "FROM landmark WHERE city = ?;";

        SqlRowSet row = jdbcTemplate.queryForRowSet(sql, city);

        while (row.next()) {
            landmarks.add(mapToLandmark(row));
        }

        return landmarks;
    }

    @Override
    public List<Landmark> getLandmarksByCountry(String country) {
        List<Landmark> landmarks = new ArrayList<>();

        String sql = "SELECT *\n" +
                "FROM landmark WHERE country = ?;";;

        SqlRowSet row = jdbcTemplate.queryForRowSet(sql, country);

        while (row.next()) {
            landmarks.add(mapToLandmark(row));
        }

        return landmarks;
    }

    @Override
    public List<Landmark> getLandmarksByState(String stateOrRegion) {
        List<Landmark> landmarks = new ArrayList<>();

        String sql = "SELECT *\n" +
                "FROM landmark WHERE state_or_region = ?;";

        SqlRowSet row = jdbcTemplate.queryForRowSet(sql, stateOrRegion);

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

        SqlRowSet row = jdbcTemplate.queryForRowSet(sql, userID);

        while (row.next()) {
            landmarks.add(mapToLandmark(row));
        }

        return landmarks;
    }

    @Override
    public List<Landmark> getLandmarkByItineraryId(int itineraryId) {
        List<Landmark> landmarks = new ArrayList<>();

        String sql = "select *\n" +
                "from landmark\n" +
                "where id in (select landmark_id from itinerary_landmark where itinerary_id = ?);";

        SqlRowSet row = jdbcTemplate.queryForRowSet(sql, itineraryId);

        while (row.next()) {
            landmarks.add(mapToLandmark(row));
        }

        return landmarks;
    }

    @Override
    public Landmark getLandmarkByID(String ID) {

        String sql = "SELECT *\n" +
                "FROM landmark WHERE id = ?;";

        SqlRowSet row = jdbcTemplate.queryForRowSet(sql, ID);

        while (row.next()) {
           return mapToLandmark(row);
        }

        return null;
    }

    @Override
    public void editLandmark(Landmark landmark) {
        String sql = "UPDATE landmark\n" +
                "SET latitude = ?, longitude = ?, name = ?, street_address = ?,\n" +
                "    city = ?, state_or_region = ?, zip_or_postal = ?, country = ?\n" +
                "WHERE id = ?;";

        int num = jdbcTemplate.update(sql,landmark.getLatitude(),landmark.getLongitude(),landmark.getName(),
                landmark.getStreetAddress(),landmark.getCity(), landmark.getStateOrRegion(), landmark.getZipOrPostal(),
                landmark.getCountry(), landmark.getId());
    }

    @Override
    public void deleteLandmark(long id) {
        String sql = "DELETE\n" +
                "FROM landmark\n" +
                "WHERE id = ?;";

        int num = jdbcTemplate.update(sql, id);
    }

    @Override
    public int addLandmark(Landmark landmark) {
        String sql = "INSERT INTO landmark(LATITUDE, LONGITUDE, NAME, STREET_ADDRESS, CITY, STATE_OR_REGION, zip_or_postal, COUNTRY)\n" +
                "VALUES (?,?,?,?,?,?,?,?) " +
                "RETURNING id;";

        return jdbcTemplate.queryForObject(sql, Integer.class, landmark.getLatitude(),landmark.getLongitude(),landmark.getName(),
                                        landmark.getStreetAddress(),landmark.getCity(), landmark.getStateOrRegion(), landmark.getZipOrPostal(), landmark.getCountry()).intValue();
    }

    @Override
    public void addLandmarkToRelatorTable(int landmarkId, int itineraryId) {
        String sql = "INSERT INTO itinerary_landmark(ITINERARY_ID, LANDMARK_ID)\n" +
                "VALUES (?,?);";

        jdbcTemplate.update(sql, itineraryId, landmarkId);
    }


    public Landmark mapToLandmark(SqlRowSet row) {
        Landmark landmark = new Landmark();

        landmark.setId(row.getInt("id"));
        landmark.setLatitude(row.getString("latitude"));
        landmark.setLongitude(row.getString("longitude"));
        landmark.setName(row.getString("name"));
        landmark.setStreetAddress(row.getString("street_address"));
        landmark.setCity(row.getString("city"));
        landmark.setStateOrRegion(row.getString("state_or_region"));
        landmark.setZipOrPostal(row.getString("zip_or_postal"));
        landmark.setCountry(row.getString("country"));

        return landmark;
    }

    //this method will be used to export data to our .csv file
    @Override
    public List<String> getLandmarkAddressByItineraryId(int itineraryId) {
        List<String> landmarks = new ArrayList<>();

        String sql = "select street_address, city, state_or_region, zip_or_postal " +
                "from landmark\n" +
                "where id in (select landmark_id from itinerary_landmark where itinerary_id = ?);";

        SqlRowSet row = jdbcTemplate.queryForRowSet(sql, itineraryId);

        String temp = "";

        while(row.next()) {
            temp = row.getString("street_address") + ", " + row.getString("city") + ", "
                    + row.getString("state_or_region") + " " + row.getString("zip_or_postal");

            landmarks.add(temp);
        }


        return landmarks;
    }

    @Override
    public void updateThumbsUp(String choice, String landmark_id) {
        String sql = "UPDATE review\n" +
                "SET thumbs_up = ?\n" +
                "WHERE landmark_id = ?;";

        jdbcTemplate.update(sql, choice, landmark_id);
    }
}
