

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page import="model.DbCon"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection connection = null;
    Statement  statement = null;
    ResultSet resultSet = null;
%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="bookFlightCSS.css">
        <title>JSP Page</title>
    </head>
    <body>
      <%@include file="bookingFlight.html"%>
    
      <p style=" font-family: Verdana, sans-serif; font-size: 16px;margin-left:15px;">Choose your departure flight</p>
      <p  style=" font-family: Verdana, sans-serif; font-size: 16px;margin-left:15px;">From :<%=request.getParameter("departingForm")%> To: <%=request.getParameter("destination")%></p>
      <table id="flights">
          <tr>
            <th>Flight ID </th>
            <th>Departing Date</th>
            <th>Departure Time</th>
            <th>Arrival Time</th>
            <th>Price($)</th>
            </tr><tr> 
      <%
  try
  {
DbCon db = new DbCon();
statement  = db.Connection().createStatement();
 String departingFrom = request.getParameter("departingForm");
 String destination =request.getParameter("destination");
 String departingDate = request.getParameter("departingDate");
 String sql ="SELECT flightID , departing_date , departureTime, arrivalTime,price FROM flightdetails  WHERE departing_from ='"+departingFrom+"' AND departing_to='"+destination+"' AND departing_date='"+departingDate+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){

    %>
<tr>
       <td><%=resultSet.getString("flightID")%></td>
        <td><%=resultSet.getString("departing_date")%></td>
        <td><%=resultSet.getString("departureTime")%></td>
        <td><%=resultSet.getString("arrivalTime")%></td>
        <td><%=resultSet.getString("price")%></td>
        
        <td>
            <form action="bookFlight.jsp">
                <input type="hidden" name="flightID" value="<%=resultSet.getString("flightID")%>">
              
                <input type="submit" value="SELECT">
            </form>
        </td>
        
</tr>     
 

<% }

}
catch(Exception e)
{
e.printStackTrace();
}

%>
        </table>
       
        </body>
</html>