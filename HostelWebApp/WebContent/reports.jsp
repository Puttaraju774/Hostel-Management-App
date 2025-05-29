<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    String type = request.getParameter("type");
    List<String> studentRecords = new ArrayList<>();

    // Mock data check (replace this with your real database logic)
    if ("pendingFees".equals(type)) {
        // studentRecords = getPendingFeesStudentsFromDB();
    } else if ("room".equals(type)) {
        // studentRecords = getStudentsInRoomFromDB();
    } else if ("dateRange".equals(type)) {
        // studentRecords = getStudentsByDateRangeFromDB();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Hostel Report Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
        }

        .container {
            background: white;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            width: 100%;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        p.message {
            font-size: 18px;
            color: #777;
            margin-bottom: 30px;
        }

        ul.student-list {
            list-style: none;
            padding: 0;
        }

        ul.student-list li {
            padding: 8px 0;
            border-bottom: 1px solid #eee;
        }

        .report-links {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-top: 20px;
        }

        .report-links a {
            font-size: 16px;
            color: #007BFF;
            text-decoration: none;
            padding: 10px 15px;
            background-color: #e9f3ff;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .report-links a:hover {
            background-color: #d0e7ff;
        }

        a.back-link {
            display: inline-block;
            margin-top: 20px;
            color: #555;
            text-decoration: none;
            font-size: 16px;
        }

        a.back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Report Results</h2>

        <% if (type == null) { %>
            <p class="message">Please select a report type:</p>
            <div class="report-links">
                <a href="report_form.jsp?type=pendingFees">🔍 Students with Pending Fees</a>
                <a href="report_form.jsp?type=room">🏠 Students in a Particular Room</a>
                <a href="report_form.jsp?type=dateRange">📅 Students Admitted in a Date Range</a>
            </div>
        <% } else if (studentRecords.isEmpty()) { %>
            <p class="message">No student records found for this report.</p>
            <div class="report-links">
                <a href="report_form.jsp">← Back to Reports</a>
            </div>
        <% } else { %>
            <ul class="student-list">
                <% for (String student : studentRecords) { %>
                    <li><%= student %></li>
                <% } %>
            </ul>
            <a href="report_form.jsp" class="back-link">← Back to Reports</a>
        <% } %>
    </div>
</body>
</html>

