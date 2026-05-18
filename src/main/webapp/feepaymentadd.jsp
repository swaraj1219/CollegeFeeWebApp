<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Fee Payment</title>
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
            background: #667eea;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }
        button:hover {
            background: #5a67d8;
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
            border: 1px solid #c3e6cb;
        }
        .error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-align: center;
            width: 100%;
            color: #667eea;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>➕ Add New Fee Payment</h1>
        </div>
        <div class="form-container">
            <% if(request.getAttribute("message") != null) { %>
                <div class="message success"><%= request.getAttribute("message") %></div>
            <% } %>
            <% if(request.getAttribute("error") != null) { %>
                <div class="message error"><%= request.getAttribute("error") %></div>
            <% } %>
            
            <form action="AddFeePaymentServlet" method="post">
                <div class="form-group">
                    <label>Student ID:</label>
                    <input type="number" name="studentId" required>
                </div>
                <div class="form-group">
                    <label>Student Name:</label>
                    <input type="text" name="studentName" required>
                </div>
                <div class="form-group">
                    <label>Payment Date:</label>
                    <input type="date" name="paymentDate" required>
                </div>
                <div class="form-group">
                    <label>Amount (₹):</label>
                    <input type="number" step="0.01" name="amount" required>
                </div>
                <div class="form-group">
                    <label>Status:</label>
                    <select name="status">
                        <option value="Paid">Paid</option>
                        <option value="Pending">Pending</option>
                        <option value="Overdue">Overdue</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Due Date:</label>
                    <input type="date" name="dueDate" required>
                </div>
                <button type="submit">Add Payment</button>
            </form>
            <a href="index.jsp" class="back-link">← Back to Home</a>
        </div>
    </div>
</body>
</html>