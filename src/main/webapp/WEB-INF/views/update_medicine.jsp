<%@ page import="com.company.model.Medicine" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Medicine</title>
</head>
<style>
    .container {
        margin: auto;
        width: 400px;
        height: 500px;
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
<body>
    <%
        Medicine medicine = (Medicine) request.getAttribute("medicine");
    %>
    <div class="container">
        <h1> Dr.Farabi Pharmacy</h1><br>
        <hr>
        <form action="update" method="post">
            <input type="hidden" name="id" value="<%=medicine.getId()%>" readonly><br>
            <input type="number" name="code" placeholder="code" value="<%=medicine.getCode()%>" readonly><br>
            <input type="text" name="name" placeholder="name" value="<%=medicine.getName()%>"><br>
            <input type="number" name="price" placeholder="price" value="<%=medicine.getPrice()%>"><br>
            <textarea name="description"><%=medicine.getDescription()%></textarea><br>
            <button type="submit">Update</button>
            <button type="submit"><a href="list">Cancel</a></button>
        </form>
    </div>
</body>
</html>
