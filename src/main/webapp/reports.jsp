<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reports</title>
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
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 30px;
        }
        .report-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            overflow: hidden;
            transition: transform 0.3s;
        }
        .report-card:hover {
            transform: translateY(-5px);
        }
        .report-header {
            background: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .report-header h2 {
            margin: 0;
            font-size: 24px;
        }
        .report-form {
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
            font-size: 14px;
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
        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-align: center;
            width: 100%;
            color: #667eea;
            text-decoration: none;
        }
        @media (max-width: 768px) {
            .container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="report-card">
            <div class="report-header">
                <h2>⚠️ Overdue Payments</h2>
            </div>
            <div class="report-form">
                <form action="ReportServlet" method="post">
                    <input type="hidden" name="reportType" value="overdue">
                    <p style="margin-bottom: 20px; color: #666;">View all students with overdue fee payments</p>
                    <button type="submit">Generate Report</button>
                </form>
            </div>
        </div>

        <div class="report-card">
            <div class="report-header">
                <h2>❌ Unpaid Students</h2>
            </div>
            <div class="report-form">
                <form action="ReportServlet" method="post">
                    <input type="hidden" name="reportType" value="unpaid">
                    <div class="form-group">
                        <label>Start Date:</label>
                        <input type="date" name="startDate" required>
                    </div>
                    <div class="form-group">
                        <label>End Date:</label>
                        <input type="date" name="endDate" required>
                    </div>
                    <button type="submit">Generate Report</button>
                </form>
            </div>
        </div>

        <div class="report-card">
            <div class="report-header">
                <h2>💰 Total Collection</h2>
            </div>
            <div class="report-form">
                <form action="ReportServlet" method="post">
                    <input type="hidden" name="reportType" value="collection">
                    <div class="form-group">
                        <label>Start Date:</label>
                        <input type="date" name="startDate" required>
                    </div>
                    <div class="form-group">
                        <label>End Date:</label>
                        <input type="date" name="endDate" required>
                    </div>
                    <button type="submit">Generate Report</button>
                </form>
            </div>
        </div>
    </div>
    <div style="text-align: center; margin-top: 20px;">
        <a href="index.jsp" style="color: white; text-decoration: none; background: rgba(0,0,0,0.5); padding: 10px 20px; border-radius: 5px;">← Back to Home</a>
    </div>
</body>
</html>