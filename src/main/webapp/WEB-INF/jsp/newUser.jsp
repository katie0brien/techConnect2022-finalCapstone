<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<c:url var="validationJs" value="/js/user-validation.js" />
<script src="${validationJs}"></script>

<c:url var="formAction" value="/users" />
<form method="POST" action="${formAction}">
<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="userName">User Name: </label>
				<input type="text" id="userName" name="userName" placeHolder="User Name" class="form-control" />
				<input type="text" id="userNameAvailable" name="userNameAvailable" value="true" class="hidden-validation" />
<%--				<label id="userNameAvailableError" class="error">This user name is taken</label>--%>
			</div>

			<div class="form-group">
				<label for="fname">First Name: </label>
				<input type="text" id="fname" name="fname" placeHolder="First Name" class="form-control" />
			</div>
			<div class="form-group">
			<label for="lname">Last Name: </label>
			<input type="text" id="lname" name="lname" placeHolder="Last Name" class="form-control" />
		</div>
			<div class="form-group">
				<label for="email">email: </label>
				<input type="text" id="email" name="email" placeHolder="Email" class="form-control" />
			</div>
			<div class="form-group">
				<label for="phoneNumber">Phone Number: </label>
				<input type="text" id="phoneNumber" name="phoneNumber" placeHolder="Phone Number" class="form-control" />
			</div>
			<div class="form-group">
				<label for="password">Password: </label>
				<input type="password" id="password" name="password" placeHolder="Password" class="form-control" />
			</div>
			<div class="form-group">
				<label for="confirmPassword">Confirm Password: </label>
				<input type="password" id="confirmPassword" name="confirmPassword" placeHolder="Re-Type Password" class="form-control" />	
			</div>
			<button type="submit" id="newUserButton" class="btn btn-primary">Create User</button>
		</div>
		<div class="col-sm-4"></div>
	</div>
</form>
		
<c:import url="/WEB-INF/jsp/common/footer.jsp" />