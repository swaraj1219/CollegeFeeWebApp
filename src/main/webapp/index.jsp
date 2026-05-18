<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>College Fee Payment System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        .container {
            width: 90%;
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
            padding: 30px;
            text-align: center;
        }
        .header h1 {
            margin: 0;
            font-size: 28px;
        }
        .nav {
            display: flex;
            flex-wrap: wrap;
            background: #34495e;
            padding: 0;
        }
        .nav a {
            color: white;
            text-decoration: none;
            padding: 15px 25px;
            transition: background 0.3s;
            flex: 1;
            text-align: center;
        }
        .nav a:hover {
            background: #2c3e50;
        }
        .content {
            padding: 40px;
            text-align: center;
        }
        .welcome {
            font-size: 18px;
            color: #555;
            margin-bottom: 30px;
        }
        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        .feature-card {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            border-left: 4px solid #667eea;
        }
        .feature-card h3 {
            color: #333;
            margin-top: 0;
        }
        .feature-card p {
            color: #666;
            line-height: 1.6;
        }
        footer {
            background: #2c3e50;
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🎓 College Fee Payment System</h1>
        </div>
        <div class="nav">
            <a href="feepaymentadd.jsp">➕ Add Payment</a>
            <a href="DisplayFeePaymentsServlet">📋 View Payments</a>
            <a href="reports.jsp">📊 Reports</a>
        </div>
        <div class="content">
            <div class="welcome">
                <h2>Welcome to Fee Management System</h2>
                <p>Efficiently manage student fee payments, track collections, and generate reports</p>
            </div>
            <div class="features">
                <div class="feature-card">
                    <h3>💰 Fee Collection</h3>
                    <p>Record new fee payments with student details, amount, and payment date</p>
                </div>
                <div class="feature-card">
                    <h3>📝 Payment Management</h3>
                    <p>Update or delete payment records as needed</p>
                </div>
                <div class="feature-card">
                    <h3>📊 Reports & Analytics</h3>
                    <p>Generate reports on overdue payments, unpaid students, and total collections</p>
                </div>
            </div>
        </div>
        <footer>
            <p>&copy; 2024 College Fee Payment System | All Rights Reserved</p>
        </footer>
    </div>
</body>
</html>