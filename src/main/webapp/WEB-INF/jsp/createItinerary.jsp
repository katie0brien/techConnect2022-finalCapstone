<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/common/create.jsp" />
<c:url var="hat" value="../../img/cowboy-hat.png" />
<c:url var="plane" value="../../img/airplane.png" />
<c:url var="van" value="../../img/van.png" />
<c:url var="hot" value="../../img/hotB.png" />
<c:url var="home1" value="../../img/1.jpg" />
<c:url var="start" value="../../img/2.jpg" />
<c:url var="home2" value="../../img/home2.jpg" />
<c:url var="home3" value="../../img/home3.jpg" />
<c:url var="home4" value="../../img/home4.jpg" />
<c:url var="home5" value="../../img/home5.jpg" />
<c:url var="home6" value="../../img/home6.jpg" />
<c:url var="home7" value="../../img/home7.jpg" />
<c:url var="home8" value="../../img/home8.jpg" />
<c:url var="home9" value="../../img/home9.jpg" />
<c:url var="home10" value="../../img/home10.jpg" />
<c:url var="home11" value="../../img/home11.jpg" />


<div class="top">
    <div class="girl">  </div>
    <div class="company">trip planner</div>
    <div class="profile"> <img src="${hat}" alt="">  </div>
</div>
<div class="left">
    <c:url var="formAction" value="/itinerary/create/${userName}" />
    <form:form class="theForm" method="POST" action="${formAction}" modelAttribute="itinerary">
        <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
        <div class="row">


            <div class="form-group">
                <label for="name">Trip Name: </label>
                <input type="text" id="name" name="name" placeHolder="Trip Name" class="form-control" />
            </div>
            <div class="form-group">
                <label for="fromDate">Start Date: </label>
                <input type="Date" id="fromDate" name="fromDate" placeHolder="Start Date" class="form-control" />
            </div>
            <div class="form-group">
                <label for="toDate">End Date: </label>
                <input type="Date" id="toDate" name="toDate" placeHolder="End Date" class="form-control" />
            </div>

            <div class="buttonBox">
                <button type="submit" id="" class="submitButton">create</button></div>
        </div>


    </form:form>
</div>

<div class="right">

    <div class="title"> <p>where will you go?</p> </div>
    <div class="mapBox">

        <img id="myimg1" src="${start}" alt="">
    </div>

</div>



<div class="hotContainer"> <img class="hot" src="${hot}" alt=""> </div>

<script type="text/javascript">
    var myelemet = document.getElementById('myimg1'),
        myimgs =["${home1}","${start}", "${home2}", "${home3}", "${home4}", "${home5}", "${home6}", "${home7}", "${home8}", "${home9}", "${home10}", "${home11}" ];
    function changeImg(myelemet,myimgs){
        'use stict';
        setInterval(function(){
            var myRandomNum = Math.floor(Math.random() * myimgs.length);
            myelemet.src = myimgs[myRandomNum];
        }, 5000);
    }
    changeImg(myelemet,myimgs);

</script>





