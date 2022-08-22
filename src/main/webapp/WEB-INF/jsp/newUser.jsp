<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/common/register.jsp" />

<c:url var="validationJs" value="/js/user-validation.js" />
<script src="${validationJs}"></script>

<c:url var="formAction" value="/users" />

<c:url var="mountains" value="../../img/mountains.png" />
	<div class="mountains"> <img src="${mountains}" alt="">  </div>

	<div class="formContainer">
		<div class="title">welcome to trip planner</div>

		<form method="POST" action="${formAction}">
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
			<div class="test">
				<div class="form-column">
					<c:url var="adventurer" value="../../img/adventurer.png" />
					<img src="${adventurer}" alt="">

					<div class="form-group">
						<label class="top" for="userName">User Name: </label>
						<input type="text" id="userName" name="userName" placeHolder="User Name" class="form-control" />
						<input type="text" id="userNameAvailable" name="userNameAvailable" value="true" class="hidden-validation" />
<%--						<label id="userNameAvailableError" class="error">This user name is taken</label>--%>
					</div>

					<div class="form-group">
						<label class="top" for="email">email: </label>
						<input type="text" id="email" name="email" placeHolder="Email" class="form-control" />
					</div>
					<div class="form-group">
						<label class="top" for="phoneNumber">Phone Number: </label>
						<input type="text" id="phoneNumber" name="phoneNumber" placeHolder="Phone Number" class="form-control" />
					</div>

				</div>
				<div class="form_column">
					<div class="specialRight">

						<div class="form-group">
							<label class="top" for="fname">First Name: </label>
							<input type="text" id="fname" name="fname" placeHolder="First Name" class="form-control" />
						</div>
						<div class="form-group">
							<label class="top" for="lname">Last Name: </label>
							<input type="text" id="lname" name="lname" placeHolder="Last Name" class="form-control" />
						</div>
						<br/>
						<div class="form-group">
							<label class="top" for="password">Password: </label>
							<input type="password" id="password" name="password" placeHolder="Password" class="form-control" />
						</div>
						<div class="form-group">
							<label class="top" for="confirmPassword">Confirm Password: </label>
							<input type="password" id="confirmPassword" name="confirmPassword" placeHolder="Re-Type Password" class="form-control" />
						</div>

					</div>

				</div>
			</div>
			<div class="buttonBox">
				<button type="submit" id="newUserButton" class="newUserButton">embark</button>
			</div>
</form>

</div>


