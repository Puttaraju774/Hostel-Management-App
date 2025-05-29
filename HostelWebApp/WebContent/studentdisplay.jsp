<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.model.Student" %>
<%@ page import="com.dao.HostelDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Students</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
        }

        h2 {
            margin-top: 30px;
            color: #333;
        }

        table {
            border-collapse: collapse;
            width: 90%;
            max-width: 1000px;
            background-color: white;
            margin-top: 20px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        th, td {
            text-align: center;
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        @media (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }

            th {
                position: sticky;
                top: 0;
            }

            td {
                text-align: right;
                padding-left: 50%;
                position: relative;
            }

            td::before {
                content: attr(data-label);
                position: absolute;
                left: 10px;
                width: 45%;
                padding-left: 10px;
                font-weight: bold;
                text-align: left;
            }

            tr {
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 8px;
            }
        }
    </style>
</head>
<body>
    <h2>Student List</h2>
    <%
        HostelDAO dao = new HostelDAO();
        List<Student> list = dao.getAllStudents();
    %>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Room</th>
            <th>Admission Date</th>
            <th>Fees Paid</th>
            <th>Pending</th>
        </tr>
        <% for(Student s : list) { %>
        <tr>
            <td data-label="ID"><%= s.getStudentID() %></td>
            <td data-label="Name"><%= s.getStudentName() %></td>
            <td data-label="Room"><%= s.getRoomNumber() %></td>
            <td data-label="Admission Date"><%= s.getAdmissionDate() %></td>
            <td data-label="Fees Paid"><%= s.getFeesPaid() %></td>
            <td data-label="Pending"><%= s.getPendingFees() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
