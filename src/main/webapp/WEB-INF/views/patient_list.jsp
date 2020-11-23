<%@ page import="java.util.List" %>
<%@ page import="com.company.model.Patient" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Patient List</title>
    <style>
        .container {
            margin: auto;
            padding: 10px;
            width: 800px;
            text-align: center;
            border: 1px black solid;
        }
        table , thead , tbody , tr , th{
            margin: auto;
            padding: 20px;
            border: 1px black solid;
            border-collapse: collapse;
        }
        thead {
            background-color: #f8f8f8;
        }
    </style>
</head>
<body>
<div class="container">
    <h1> Dr.Farabi Pharmacy</h1><br>
    <hr>
    <table>
        <thead>
        <tr>
            <th>First name</th>
            <th>Last Name</th>
            <th>Gender</th>
            <th>Remove</th>
            <th>Update</th>
            <th>Information</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Patient> patients = (List<Patient>) request.getAttribute("list");
            for (Patient patient : patients){
        %>
        <tr>
            <th><%=patient.getFirstName()%></th>
            <th><%=patient.getLastName()%></th>
            <th><%=patient.getGender()%></th>
            <th>
                <form method="post" action="remove">
                    <button type="submit" name="id" onclick="return confirm('Are you sure you want to Remove?');" value="<%=patient.getId()%>">Remove</button>
                </form>
            </th>
            <th>
                <form method="get" action="find_before_update">
                    <button type="submit" name="id" value="<%=patient.getId()%>">Update</button>
                </form>
            </th>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
