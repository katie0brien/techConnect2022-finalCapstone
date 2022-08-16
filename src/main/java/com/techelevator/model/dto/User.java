package com.techelevator.model.dto;

import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class User {
	private String userName;
	
	@Size(min=8, message="Password too short, must be at least 8")
	@Pattern.List({
		@Pattern(regexp=".*[a-z].*", message="Must have a lower case"),
		@Pattern(regexp=".*[A-Z].*", message="Must have a capital")
	})
	private String password;

	//new fields
	@NotBlank(message = "This field is required")
	private String lname;

	@NotBlank(message = "This field is required")
	private String fname;

	@NotBlank(message = "This field is required")
	@Pattern(regexp = "[a-z0-9]+@+[a-z0-9]+.com", message = "Email must be entered in the format something@something.com")
	private String email;

	@NotBlank
	@Pattern(regexp ="^\\(\\d{3}\\)\\d{3}-\\d{4}", message = "Please enter a phone number in the format (###)###-####")
	@Size(min=13, max = 13, message = "Please enter a phone number in the format (###)###-####")
	private String phoneNumber;

	//end new fields

	private String role;
	
	private String confirmPassword;
	public String getUserName() {
		return userName;
	}
	/**
	 * @return the role
	 */
	public String getRole() {
		return role;
	}
	/**
	 * @param role the role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	//new getters and setters for new fields

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	//end new getters/setters
}
