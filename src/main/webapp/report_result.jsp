<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.model.FeePayment" %>
<!DOCTYPE html>
<html>
<head>
    <title>Report Result</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 50px auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            overflow: hidden;
        }
        .header {
            background: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .content {
            padding: 30px;
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #667eea;
            color: white;
            font-weight: bold;
        }
        tr:hover {
            background: #f5f5f5;
        }
        .total {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 5px;
            margin-top: 20px;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-align: center;
            width: 100%;
            color: #667eea;
            text-decoration: none;
        }
        .status-overdue {
            color: #dc3545;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><%= request.getAttribute("reportTitle") %></h1>
        </div>
        <div class="content">
            <% 
            List<FeePayment> reportData = (List<FeePayment>) request.getAttribute("reportData");
            Double totalCollection = (Double) request.getAttribute("totalCollection");
            
            if(reportData != null) {
            %>
                <table>
                    <thead>
                        <tr>
                            <th>Payment ID</th>
                            <th>Student ID</th>
                            <th>Student Name</th>
                            <th>Payment Date</th>
                            <th>Amount (₹)</th>
                            <th>Status</th>
                            <th>Due Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(FeePayment payment : reportData) { %>
                        <tr>
                            <td><%= payment.getPaymentId() %></td>
                            <td><%= payment.getStudentId() %></td>
                            <td><%= payment.getStudentName() %></td>
                            <td><%= payment.getPaymentDate() %></td>
                            <td>₹ <%= String.format("%.2f", payment.getAmount()) %></td>
                            <td class="status-<%= payment.getStatus().toLowerCase() %>"><%= payment.getStatus() %></td>
                            <td><%= payment.getDueDate() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } else if(totalCollection != null) { %>
                <div class="total">
                    Total Collection from <%= request.getAttribute("startDate") %> to <%= request.getAttribute("endDate") %>:<br>
                    ₹ <%= String.format("%.2f", totalCollection) %>
                </div>
            <% } else { %>
                <p style="text-align: center; color: #666;">No data found for the selected criteria.</p>
            <% } %>
            <a href="reports.jsp" class="back-link">← Back to Reports</a>
        </div>
    </div>
</body>
</html>