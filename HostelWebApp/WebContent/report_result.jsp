<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    String type = request.getParameter("type");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Generate Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }

        .form-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 500px;
        }

        h2 {
            margin-bottom: 20px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .back-link {
            margin-top: 20px;
            display: inline-block;
            text-decoration: none;
            color: #007BFF;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Fill Report Criteria</h2>

        <form action="ReportController" method="post">
            <input type="hidden" name="type" value="<%=type%>"/>

            <% if ("room".equals(type)) { %>
                <label>Enter Room Number:</label>
                <input type="text" name="roomNumber" required/>
            <% } else if ("dateRange".equals(type)) { %>
                <label>Start Date:</label>
                <input type="date" name="startDate" required/>

                <label>End Date:</label>
                <input type="date" name="endDate" required/>
            <% } else if ("pendingFees".equals(type)) { %>
                <!-- No additional input required -->
                <p>No additional input needed. Click below to generate the report.</p>
            <% } else { %>
                <p>Invalid report type. <a href="reports.jsp">Back</a></p>
            <% } %>

            <% if ("room".equals(type) || "dateRange".equals(type) || "pendingFees".equals(type)) { %>
                <button type="submit">Generate Report</button>
            <% } %>
        </form>

        <a href="reports.jsp" class="back-link">← Back to Report Menu</a>
    </div>
</body>
</html>
