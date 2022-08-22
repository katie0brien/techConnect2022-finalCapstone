<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/landingPage.jsp" />

<script type="text/javascript">
	$(document).ready(function () {
	
		$("form").validate({
			
			rules : {
				userName : {
					required : false
				},
				password : {
					required : false
				}
			},
			messages : {			
				confirmPassword : {
					equalTo : "Passwords do not match"
				}
			},
			errorClass : "error"
		});
	});
</script>

<%--//katie deleted stuff here--%>

<%--//katie added everything down here--%>


<div class="leftBox">
	<div class="greeting">welcome back traveller</div>
	<c:url var="temple" value="../../img/temple.png" />
	<div class="destinationLogin"> <img src="${temple}" alt="big pretty castle"> </div>
</div>

<div class="rightBox">
	<div class="existingUser">
		<div class="company">trip planner</div>
		<c:url var="adventurerDude" value="../../img/adventurerDude.png" />
		<div class="logo"> <img src="${adventurerDude}" alt="">  </div>
		<c:url var="goHome" value="/home" />
		<form method="post" action="${goHome}">
			<input type="hidden" name="destination" value="${param.destination}"/>
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
			<div class="form-group" >
				<input type="text" id="userName" name="userName" placeHolder="User Name" class="form-control" />
			</div>
			<div class="form-group">
				<input type="password" id="password" name="password" placeHolder="Password" class="form-control" />
			</div>
			<button type="submit" class="btn-submit">Login</button>
		</form>
	</div>
	<br/>
	<div class="divider"></div>
	<br/>
	<div class="newUser">
		<div class="usersInARow">
			<c:url var="user1" value="../../img/user1.png" />
			<c:url var="user2" value="../../img/user2.png" />
			<c:url var="user3" value="../../img/user3.png" />
			<div class="user1"> <img src="${user2}" alt=""> </div>
			<div class="user2"> <img src="${user1}" alt=""> </div>
			<div class="user3"> <img src="${user3}" alt=""> </div>
		</div>
		<div class="grabber"> New to Trip Planner?</div>
		<div class="buttonCase">
			<c:url var="newUser" value="/users/new" />
			<form style="width: 100%;text-align: center;" method="get"  action="${newUser}">
			<button type="submit" class="joinButton">join today</button>
			</form>
		</div>
		<div class="finisher">and see why thousands choose to explore with us</div>

	</div>
</div>



