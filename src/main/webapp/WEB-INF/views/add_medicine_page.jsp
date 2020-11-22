<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Medicine</title>
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
    }
    a {
        text-decoration: none;
    }
</style>
<body>
    <div class="container">
        <h1> Dr.Farabi Pharmacy</h1><br>
        <hr>
        <form action="medicine/add" method="post">
            <input type="text" name="name" placeholder="name" required><br>
            <input type="number" name="code" placeholder="code" required><br>
            <input type="number" name="price" placeholder="price" required><br>
            <textarea name="description">Description</textarea><br>
            <button type="submit">Submit</button>
            <button type="submit"><a href="index.jsp">Cancel</a></button>
        </form>
    </div>
</body>
</html>
