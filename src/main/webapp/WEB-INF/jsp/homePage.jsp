<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 8/18/2022
  Time: 3:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/home.jsp" />

<script type="text/javascript">
    $(document).ready(function () {

        $("form").validate({

            rules : {
                userName : {
                    required : true
                },
                password : {
                    required : true
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

<div class="topBox">
    <div class="holder"> <p>M</p>  </div>
    <div class="company"> trip planner</div>

    <c:url var="hat" value="../../img/cowboy-hat.png" />
    <div class="profile">
        <c:url var="profilePage" value="/itinerary/list/{id}" />
        <form method="get" action="${profilePage}">
            <input type="image" src="${hat}" style="max-width: 100%;"  alt="Submit" />

        </form>

    </div>
</div>
<div class="pillBox">
    <c:url var="homeV5" value="../../img/homV5.jpg" />
    <c:url var="homeV3" value="../../img/homeV3.jpg" />
    <c:url var="homeV2" value="../../img/homeV2.jpg" />
    <c:url var="homeV1" value="../../img/homeV1.jpg" />
    <c:url var="homeV4" value="../../img/homeV4.png" />
    <div class="home1"> <img src="${homeV5}" alt=""></div>
    <div class="home2"> <img src="${homeV3}" alt=""> </div>
    <div class="home3"> <img src="${homeV2}" alt="">  </div>
    <div class="home4"> <img src="${homeV1}" alt=""> </div>
    <div class="home5"> <img src="${homeV4}" alt=""></div>
</div>
<div class="statement"> your fabulous adventure starts today</div>
<c:url var="adventurer" value="../../img/adventurer.png" />
<div class="girl">  <img src="${adventurer}" alt="">  </div>
<div class="buttonBox">
    <c:url var="createItinerary" value="/itinerary/create" />
    <form method="get" action="${createItinerary}">
        <input class="createButton" type="submit" value="onwards" />
    </form>
</div>
<div class="bottom"> <p>katie. sarah. mohamed.</p> </div>

