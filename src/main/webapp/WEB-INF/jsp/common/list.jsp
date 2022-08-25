<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 8/24/2022
  Time: 9:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <title>TRIP PLANNER</title>
  <c:url var="bootstrapCss" value="/css/bootstrap.min.css" />
  <c:url var="home" value="/css/listLandmarks.css" />

  <c:url var="jQueryJs" value="/js/jquery.min.js" />
  <c:url var="jqValidateJs" value="/js/jquery.validate.min.js" />
  <c:url var="jqvAddMethJs" value="/js/additional-methods.min.js" />
  <c:url var="jqTimeagoJs" value="/js/jquery.timeago.js" />
  <c:url var="popperJs" value="/js/popper.min.js" />
  <c:url var="hot1" value="../../img/hotB.png" />
  <c:url var="hot2" value="../../img/hot2.png" />
  <c:url var="hot3" value="../../img/hot3.png" />
  <c:url var="hot4" value="../../../img/hot4.png" />
  <c:url var="blimp" value="../../../img/blimp.png" />
  <%--    <c:url var="bootstrapJs" value="/js/bootstrap.min.js" />--%>

  <%--    <link rel="stylesheet" type="text/css" href="${bootstrapCss}">--%>
  <link rel="stylesheet" type="text/css" href="${home}">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&family=Raleway:wght@400;500&display=swap" rel="stylesheet">
  <link href="https://api.mapbox.com/mapbox-gl-js/v2.9.2/mapbox-gl.css" rel="stylesheet">

  <script src="${jQueryJs}"></script>
  <script src="${jqValidateJs}"></script>
  <script src="${jqvAddMethJs}"></script>
  <script src="${jqTimeagoJs}"></script>
  <script src="${popperJs}"></script>
  <script src="${bootstrapJs}"></script>

  <script type="text/javascript">
    $(document).ready(function() {
      $("time.timeago").timeago();

      $("#logoutLink").click(function(event) {
        $("#logoutForm").submit();
      });

      var pathname = window.location.pathname;
      $("nav a[href='" + pathname + "']").parent().addClass("active");

    });
  </script>

</head>
<body>