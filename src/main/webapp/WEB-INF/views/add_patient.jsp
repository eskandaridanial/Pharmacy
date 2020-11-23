<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Patient</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
    .container {
        margin: auto;
        padding: 10px;
        width: 700px;
        text-align: center;
        border: 1px black solid;
    }
    .box , .rescription{
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
    #radio {
        margin: 10px;
    }
    #add_rescription {
        padding: 10px;
        text-align: center;
        width: 30px;
        height: 30px;
    }
</style>
<body>
    <div class="container">
        <h1> Dr.Farabi Pharmacy</h1><br>
        <hr>
        <form action="patient/add" method="post">
            <input class="box" type="text" name="firstName" placeholder="First Name" required><br>
            <input class="box" type="text" name="lastName" placeholder="Last Name" required><br>

            <div id="radio">
                <input type="radio" id="male" name="gender" value="male" checked>
                <label for="male">Male</label>

                <input type="radio" id="female" name="gender" value="female">
                <label for="female">Female</label><br>
            </div>

            <hr>

            <h2>Add Prescription</h2>
            <hr>

            <h3>You Need To Add At Least One Prescription<button id="add_rescription" type="button">+</button></h3>

            <div id="rescription"></div>

            <button type="submit">Submit</button>
            <button><a href="index.jsp">Cancel</a></button>
        </form>
    </div>
    <script>
        $(document).ready(function(){
            $("#add_rescription").click(function () {
                $("#rescription").append("<input class=\"rescription\" type=\"number\" name=\"code\" placeholder=\"code\" required>\n" +
                    "                <input class=\"rescription\" type=\"date\" name=\"creationDate\" placeholder=\"Creation Date\" required>\n" +
                    "                <input class=\"rescription\" type=\"date\" name=\"visitDate\" placeholder=\"Visit Date\" required>")
            })
        })
    </script>
</body>
</html>
