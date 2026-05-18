<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.model.FeePayment" %>
<!DOCTYPE html>
<html>
<head>
    <title>Fee Payment Records</title>
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
        .status-paid {
            color: #28a745;
            font-weight: bold;
        }
        .status-overdue {
            color: #dc3545;
            font-weight: bold;
        }
        .status-pending {
            color: #ffc107;
            font-weight: bold;
        }
        .actions {
            display: flex;
            gap: 10px;
        }
        .btn-edit, .btn-delete {
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 3px;
            font-size: 12px;
        }
        .btn-edit {
            background: #28a745;
            color: white;
        }
        .btn-delete {
            background: #dc3545;
            color: white;
        }
        .btn-edit:hover, .btn-delete:hover {
            opacity: 0.8;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-align: center;
            width: 100%;
            color: #667eea;
            text-decoration: none;
        }
        .message {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            text-align: center;
        }
        .success {
            background: #d4edda;
            color: #155724;
        }
        .error {
            background: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📋 Fee Payment Records</h1>
        </div>
        <div class="content">
            <% if(request.getAttribute("message") != null) { %>
                <div class="message success"><%= request.getAttribute("message") %></div>
            <% } %>
            <% if(request.getAttribute("error") != null) { %>
                <div class="message error"><%= request.getAttribute("error") %></div>
            <% } %>
            
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
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    List<FeePayment> payments = (List<FeePayment>) request.getAttribute("payments");
                    if(payments != null && !payments.isEmpty()) {
                        for(FeePayment payment : payments) {
                    %>
                    <tr>
                        <td><%= payment.getPaymentId() %></td>
                        <td><%= payment.getStudentId() %></td>
                        <td><%= payment.getStudentName() %></td>
                        <td><%= payment.getPaymentDate() %></td>
                        <td>₹ <%= String.format("%.2f", payment.getAmount()) %></td>
                        <td class="status-<%= payment.getStatus().toLowerCase() %>"><%= payment.getStatus() %></td>
                        <td><%= payment.getDueDate() %></td>
                        <td class="actions">
                            <a href="UpdateFeePaymentServlet?id=<%= payment.getPaymentId() %>" class="btn-edit">Edit</a>
                            <a href="DeleteFeePaymentServlet?id=<%= payment.getPaymentId() %>" class="btn-delete" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                    <% 
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="8" style="text-align: center;">No records found</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <a href="index.jsp" class="back-link">← Back to Home</a>
        </div>
    </div>
</body>
</html>