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
        width: 800px;
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

    <h2>Add Prescriptions</h2>
    <hr>

    <h3>Click Here To Add New Priscription<button data- id="add_prescription" type="button">+</button></h3>

    <form action="update_patient_prescriptions" method="post">
        <input type="hidden" name="id" value="<%=patient.getId()%>">

        <div id="prescription">
            <div class="added" id="added_1"></div>
        </div>

        <button type="submit">Submit</button>
        <button><a href="list">Cancel</a></button>
    </form>

    <hr>
    <h3>Show Prescriptions</h3>
    <hr>

    <table>
        <thead>
            <tr>
                <th>Code</th>
                <th>Creation Date</th>
                <th>Visit Date</th>
                <th>Remove</th>
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
                <th>
                    <form method="post" action="remove_prescription">
                        <input type="hidden" name="patientId" value="<%=patient.getId()%>">
                        <button type="submit" name="prescriptionId" onclick="return confirm('Are you sure you want to Remove?');" value="<%=prescription.getId()%>">Remove</button>
                    </form>
                </th>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
<script>
    $(document).ready(function(){
        $("#add_prescription").click(function () {

            var total_element = $(".added").length;

            var lastid = $(".added:last").attr("id");
            var split_id = lastid.split("_");
            var nextindex = Number(split_id[1]) + 1;


            $("#prescription").append("<div class=\"added\" id=\"added_" + nextindex + "\">\n" +
                "                    <input class=\"prescription\" type=\"number\" name=\"code\" placeholder=\"code\" required>\n" +
                "                    <input class=\"prescription\" type=\"date\" name=\"creationDate\" placeholder=\"Creation Date\" required>\n" +
                "                    <input class=\"prescription\" type=\"date\" name=\"visitDate\" placeholder=\"Visit Date\" required>\n" +
                "                    <button class=\"remove\" id=\"remove_" + nextindex + "\" type=\"button\">-</button>\n" +
                "                </div>")
        })

        $("#prescription").on('click' , '.remove' , function () {
            var id = this.id;
            var split_id = id.split("_");
            var deleteindex = split_id[1];

            $("#added_" + deleteindex).remove()
        })
    })
</script>
</body>
</html>
