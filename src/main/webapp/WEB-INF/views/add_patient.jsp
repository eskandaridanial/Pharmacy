<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Patient</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="jquery.duplicate.js"></script>
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
    #radio {
        margin: 10px;
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

            <h3>You Need To Add At Least One Prescription<button data- id="add_prescription" type="button">+</button></h3>

            <div id="prescription">
                <div class="added" id="added_1">
                    <input class="prescription" type="number" name="code" placeholder="code" required>
                    <input class="prescription" type="date" name="creationDate" placeholder="Creation Date" required>
                    <input class="prescription" type="date" name="visitDate" placeholder="Visit Date" required>
                </div>
            </div>

            <button type="submit">Submit</button>
            <button><a href="index.jsp">Cancel</a></button>
        </form>
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
