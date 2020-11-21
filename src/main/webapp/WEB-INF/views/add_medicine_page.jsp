<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Medicine</title>
</head>
<body>
<h1> Dr.Farabi Pharmacy</h1>
<form action="add_medicine" method="post">
    <input type="text" name="name" placeholder="name" required>
    <input type="number" name="price" placeholder="price" required>
    <input type="text" name="description" placeholder="description">
    <button type="submit">Add</button>
</form>
</body>
</html>
