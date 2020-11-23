<%@ page import="com.company.model.Patient" %>
<%@ page import="com.company.model.Prescription" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Patient</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
    .container {
        margin: auto;
        padding: 10px;
        width: 500px;
        text-align: center;
        border: 1px black solid;
    }
    .box , .prescription{
        margin: 10px;
        padding: 10px;
        width: 200px;
        color: black;
        -moz-appearance: textfield;
    }
    button {
        padding: 10px;
        margin: 10px;
        width: 90px;
        color: black;
    }
    a {
        text-decoration: none;
        color: black;
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
<body>
<%
    Patient patient = (Patient) request.getAttribute("patient");
%>
<div class="container">
    <h1> Dr.Farabi Pharmacy</h1><br>
    <hr>
    <input class="box" type="text" name="firstName" placeholder="First Name" value="<%=patient.getFirstName()%>" readonly><br>
    <input class="box" type="text" name="lastName" placeholder="Last Name" value="<%=patient.getLastName()%>" readonly><br>
    <input class="box" type="text" name="gender" placeholder="Gender" value="<%=patient.getGender()%>" readonly><br>
    <hr>
    <h3>Prescriptions</h3>
    <hr>

    <table>
        <thead>
        <tr>
            <th>Code</th>
            <th>Creation Date</th>
            <th>Visit Date</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Prescription prescription : patient.getPrescriptions()){
        %>
        <tr>
            <th><%=prescription.getCode()%></th>
            <th><%=prescription.getCreationDate()%></th>
            <th><%=prescription.getVisitDate()%></th>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
