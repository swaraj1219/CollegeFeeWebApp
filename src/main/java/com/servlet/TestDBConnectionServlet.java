package com.servlet;

import com.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TestDBConnectionServlet")
public class TestDBConnectionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        try {
            Connection conn = DBConnection.getConnection();
            if (conn != null) {
                out.println("<h3 style='color:green'>✓ Database connected successfully!</h3>");
                out.println("<p>Connection: " + conn.toString() + "</p>");
                conn.close();
            } else {
                out.println("<h3 style='color:red'>✗ Failed to connect to database!</h3>");
            }
        } catch (Exception e) {
            out.println("<h3 style='color:red'>✗ Error: " + e.getMessage() + "</h3>");
            e.printStackTrace(out);
        }
    }
}