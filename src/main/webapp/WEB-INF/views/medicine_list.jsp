<%@ page import="java.util.List" %>
<%@ page import="com.company.model.Medicine" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Medicine List</title>
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
                <th>Name</th>
                <th>Code</th>
                <th>Price</th>
                <th>Description</th>
                <th>Remove</th>
                <th>Update</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Medicine> medicines = (List<Medicine>) request.getAttribute("list");
                for (Medicine medicine : medicines){
            %>
            <tr>
                <th><%=medicine.getName()%></th>
                <th><%=medicine.getCode()%></th>
                <th><%=medicine.getPrice()%></th>
                <th><%=medicine.getDescription()%></th>
                <th>
                    <form method="post" action="remove">
                        <button type="submit" name="id" value="<%=medicine.getId()%>">Remove</button>
                    </form>
                </th>
                <th>
                    <form method="get" action="find_before_update">
                        <button type="submit" name="id" value="<%=medicine.getId()%>">Update</button>
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
