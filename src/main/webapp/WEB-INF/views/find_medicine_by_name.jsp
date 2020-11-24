<%@ page import="com.company.model.Medicine" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Find Medicine By Name</title>
    <style>
        .container {
            margin: auto;
            padding: 10px;
            width: 400px;
            text-align: center;
            border: 1px black solid;
        }
        input , textarea{
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
    </style>
</head>
<body>
    <div class="container">
        <form action="medicine/find_by_name"  method="get">
            <input type="text" name="name" placeholder="name" required>
            <button type="submit">Search</button>
        </form>

        <hr>

        <h2>Medicine Information</h2>

        <%
            Medicine medicine = (Medicine) request.getAttribute("medicine");
            if (medicine == null) {
        %>
        <p style="color: red">No Medicine Found With This Name</p>

        <%
            } else {
        %>
        <input type="text" name="name" placeholder="name" value="<%=medicine.getName()%>" readonly><br>
        <input type="number" name="code" placeholder="code" value="<%=medicine.getCode()%>" readonly><br>
        <input type="number" name="price" placeholder="price" value="<%=medicine.getPrice()%>" readonly><br>
        <textarea name="description" readonly><%=medicine.getDescription()%></textarea><br>
        <%
            }
        %>
    </div>
</body>
</html>
