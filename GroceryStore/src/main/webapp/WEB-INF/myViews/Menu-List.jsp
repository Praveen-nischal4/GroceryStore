
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Menu</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

<style>
#trth {
background-color: #88AB8E;
}

#ctrl1{
background-color:#88AB8E;

}


tr:nth-child(even) {
background-color: #2C7865;
color:white;
}

tr:nth-child(odd) {
	background-color: #45474B;
	color:#E7D37F;
}

a {
color:white;

}

a:hover
{
background-color:black;
color: white;
}

th {
color:#01204E;
}


#ctrl2 {
color:#FFFFFF;
}
</style>


<script>
$(document).ready(function (){
	$("#cart_message").fadeOut(2000);
	$("#cart_error").fadeOut(2000);
}
);
</script>

</head>
<body>
<%@ include file="header.jsp" %>
    <h1 class="text-center text-light fw-bold " style="background-color: #219C90;">  MENU </h1>
    <p> ** prices are as per items sold in <strong>(kg) or per drzones  </strong>        
     <c:choose>
     <c:when test="${param.success != null }">
     <i id="cart_message" class="text-success fw-bold  mt-5"> ${param.success} </i>
     </c:when>  
     <c:otherwise>  <i id="cart_error" class="text-danger fw-bold mt-5"> ${param.error }</i>   </c:otherwise>
    
     </c:choose>    
    </p>
     
    <table  class="table">
        <thead>
            <tr>
                <th id="trth">ID</th>
                <th id="trth">Category</th>
                <th id="trth">Name</th>
                <th id="trth">Description</th>
                  <sec:authorize access='hasAuthority("Admin")'>      
                <th id="trth">MaxQuantity</th>
                </sec:authorize>
                <th id="trth">Price</th> 
                  <sec:authorize access='hasAuthority("Admin")'>                  
                <th id="ctrl1">Edit </th>
                </sec:authorize>
                 <sec:authorize access='hasAuthority("Admin")'>
                <th id="ctrl1"> Delete </th>
                </sec:authorize>
                <th id="ctrl1"> Add To Cart</th>
            </tr>
        </thead>
        <tbody>  
            <c:forEach var="items" items="${itemsList}">
                <tr>
                    <td>${items.item_id}</td>
                    <td>${items.category}</td>
                    <td>${items.name}</td>
                    <td>${items.description}</td>
                      <sec:authorize access='hasAuthority("Admin")'>                    
                          <td>${items.max_quantity} </td>                 
                      </sec:authorize>
                    <td>${items.price}</td>
                    <sec:authorize access='hasAuthority("Admin")'>
                    <td ><a id="ctrl2" href="${pageContext.request.contextPath }/editItems/${items.item_id}" class="text-decoration-none"> Edit  &nbsp; &nbsp; </a> </td>
                   </sec:authorize>
                    <sec:authorize access='hasAuthority("Admin")'>
                     <td ><a id="ctrl2" href="${pageContext.request.contextPath }/deleteItems/${items.item_id}" class="text-decoration-none">Delete &nbsp; &nbsp;</a> </td>
                    </sec:authorize>
                   
                   
                    <td>
                    <c:choose>
                            <c:when test="${items.max_quantity > 0}">
                                <a id="ctrl2" href="${pageContext.request.contextPath}/addToCart/${items.item_id}" class="text-decoration-none">Add To Cart &nbsp; &nbsp;</a>
                            </c:when>
                            <c:otherwise>
                 <a id="ctrl2" href="${pageContext.request.contextPath}/addToCart/${items.item_id}" class="btn disabled text-danger fw-bold  " style="position:relative;top:0px;left:0px;padding:0px;"  >Add To Cart  </a>             
                            
                               
                            </c:otherwise>
                        </c:choose>
                    
                    </td>             
                    
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
</body>
</html>






