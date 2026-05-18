<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.FeePayment" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Fee Payment</title>
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
            max-width: 600px;
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
        .form-container {
            padding: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }
        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        button {
            width: 100%;
            padding: 12px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }
        button:hover {
            background: #218838;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-align: center;
            width: 100%;
            color: #667eea;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>✏️ Update Fee Payment</h1>
        </div>
        <div class="form-container">
            <% FeePayment payment = (FeePayment) request.getAttribute("payment"); %>
            <form action="UpdateFeePaymentServlet" method="post">
                <input type="hidden" name="paymentId" value="<%= payment.getPaymentId() %>">
                <div class="form-group">
                    <label>Student ID:</label>
                    <input type="number" name="studentId" value="<%= payment.getStudentId() %>" required>
                </div>
                <div class="form-group">
                    <label>Student Name:</label>
                    <input type="text" name="studentName" value="<%= payment.getStudentName() %>" required>
                </div>
                <div class="form-group">
                    <label>Payment Date:</label>
                    <input type="date" name="paymentDate" value="<%= payment.getPaymentDate() %>" required>
                </div>
                <div class="form-group">
                    <label>Amount (₹):</label>
                    <input type="number" step="0.01" name="amount" value="<%= payment.getAmount() %>" required>
                </div>
                <div class="form-group">
                    <label>Status:</label>
                    <select name="status">
                        <option value="Paid" <%= payment.getStatus().equals("Paid") ? "selected" : "" %>>Paid</option>
                        <option value="Pending" <%= payment.getStatus().equals("Pending") ? "selected" : "" %>>Pending</option>
                        <option value="Overdue" <%= payment.getStatus().equals("Overdue") ? "selected" : "" %>>Overdue</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Due Date:</label>
                    <input type="date" name="dueDate" value="<%= payment.getDueDate() %>" required>
                </div>
                <button type="submit">Update Payment</button>
            </form>
            <a href="DisplayFeePaymentsServlet" class="back-link">← Back to Records</a>
        </div>
    </div>
</body>
</html>