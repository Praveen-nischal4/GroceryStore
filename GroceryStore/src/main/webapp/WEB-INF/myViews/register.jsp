<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
    <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MyApp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

<style>
 tr:nth-child(odd) 
 {
 background-color:#219C90;
 }

</style>




</head>
<body class="container-fluid" style="">
<%@ include file="header.jsp" %>
<h1 class="text-center fw-bold mt-3 text-success"> Register Here</h1>
<hr class="bg-warning">
 <form:form action="process-registration" method="POST" modelAttribute="myRegister">
 <table class="table w-50 border border-double border-primary" style="margin:auto">
 
 <tr>
  <td> Username  </td>
  <td><form:input path="username" class="form-input col col-8"/>  </td>
  </tr>
  
   <tr>
  <td> Password</td>
  <td><form:input path="password" class="form-input col col-8"/>  </td>
  </tr>
  
   <tr>
  <td>  Enabled  </td>
  <td> <form:input path="enabled" class="form-input col col-8"/> </td>
  </tr>
  
  <tr>
  <td>  Address  </td>
  <td> <form:input path="address" class="form-input col col-8"/> </td>
  </tr>
  
  <tr>
  <td>  Email  </td>
  <td> <form:input path="email" class="form-input col col-8"/> </td>
  </tr>
  
  <tr>
  <td>  Mobile  </td>
  <td> <form:input path="mobile" class="form-input col col-8"/> </td>
  </tr>
  
   <tr>
  <td colspan="2" class="text-center" style="background-color: #95D2B3;"> <input type="submit" value="Register" class="bg-success text-light p-2 mt-2  h5 btn btn-block"/> </td> 
  </tr>
  
 </table>

 
 </form:form>
</body>
</html>