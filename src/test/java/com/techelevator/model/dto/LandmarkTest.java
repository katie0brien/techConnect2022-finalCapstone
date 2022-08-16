package com.techelevator.model.dto;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;

public class LandmarkTest  {

    Landmark landmark;

    @Before
    public void setup() {
        landmark = new Landmark();
    }

    @Test
    public void getLongitude_Should_return_correct_longitude() {
        String expected = "82.9988° W";

        landmark.setLongitude(expected);

        String actual = landmark.getLongitude();
        String message = "setLongitude should return the correct value set for longitude";
        assertEquals(message,expected, actual);

    }

    @Test
    public void getLatitude_Should_return_correct_latitude() {
        String expected = "39.9612° N";

        landmark.setLatitude(expected);

        String actual = landmark.getLatitude();
        String message = "setLatitude should return the correct value set for Latitude";
        assertEquals(message,expected, actual);

    }

    @Test
    public void getName_Should_return_correct_name() {
        String expected = "Eiffel Tower";

        landmark.setName(expected);

        String actual = landmark.getName();
        String message = "setName should return the correct value set for name";
        assertEquals(message,expected, actual);

    }

    @Test
    public void getStreetAddress_Should_return_correct_address() {
        String expected = "1600 Pennsylvania Avenue NW";

        landmark.setStreetAddress(expected);

        String actual = landmark.getStreetAddress();
        String message = "setStreetAddress should return the correct value set for address";
        assertEquals(message,expected, actual);

    }
    @Test
    public void getCity_Should_return_correct_City() {
        String expected = "Washington D.C.";

        landmark.setCity(expected);

        String actual = landmark.getCity();
        String message = "setCity should return the correct value set for city";
        assertEquals(message,expected, actual);

    }

    @Test
    public void getZipcode_Should_return_correct_ZipCode() {
        long expected = 43004;

        landmark.setZipOrPostal(expected);

        long actual = landmark.getZipOrPostal();
        String message = "setZipcode should return the correct value set for ZipCode";
        assertEquals(message,expected, actual);

    }

    @Test
    public void getStateOrRegion_Should_return_correct_sateOrRegion() {
        String expected = "Ohio";

        landmark.setStateOrRegion(expected);

        String actual = landmark.getStateOrRegion();
        String message = "setStateOrRegion should return the correct value set for state or region";
        assertEquals(message,expected, actual);

    }
    @Test
    public void getCountry_Should_return_correct_country() {
        String expected = "Mexico";

        landmark.setCountry(expected);

        String actual = landmark.getCountry();
        String message = "setCountry should return the correct value set for country";
        assertEquals(message,expected, actual);

    }

    @Test
    public void getId_Should_return_correct_id() {
        String expected = "123456";

        landmark.setId(expected);

        String actual = landmark.getId();
        String message = "setID should return the correct value set for id";
        assertEquals(message,expected, actual);

    }

}