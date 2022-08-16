package com.techelevator.model.dao.jdbc;

import com.techelevator.model.dao.LandmarkDAO;
import com.techelevator.model.dto.Landmark;

import java.util.List;

public class JDBCLandMarkDAO implements LandmarkDAO {

    @Override
    public List<Landmark> getAllLandmarks() {
        return null;
    }

    @Override
    public List<Landmark> getLandmarksByCity() {
        return null;
    }

    @Override
    public Landmark getLandmarkByID() {
        return null;
    }

    @Override
    public void editLandmark(Landmark landmark) {

    }

    @Override
    public void deleteLandmark(long id) {

    }

    @Override
    public void addLandmark(Landmark landmark) {

    }
}
