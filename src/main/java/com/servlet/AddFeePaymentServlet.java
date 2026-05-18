package com.servlet;

import com.dao.FeePaymentDAO;
import com.model.FeePayment;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddFeePaymentServlet")
public class AddFeePaymentServlet extends HttpServlet {
    private FeePaymentDAO feeDAO = new FeePaymentDAO();
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Set response content type
        response.setContentType("text/html");
        
        try {
            System.out.println("=== AddFeePaymentServlet called ===");
            
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            String studentName = request.getParameter("studentName");
            String paymentDateStr = request.getParameter("paymentDate");
            BigDecimal amount = new BigDecimal(request.getParameter("amount"));
            String status = request.getParameter("status");
            String dueDateStr = request.getParameter("dueDate");
            
            System.out.println("Student ID: " + studentId);
            System.out.println("Student Name: " + studentName);
            System.out.println("Payment Date: " + paymentDateStr);
            System.out.println("Amount: " + amount);
            System.out.println("Status: " + status);
            System.out.println("Due Date: " + dueDateStr);
            
            Date paymentDate = Date.valueOf(paymentDateStr);
            Date dueDate = Date.valueOf(dueDateStr);
            
            FeePayment payment = new FeePayment();
            payment.setStudentId(studentId);
            payment.setStudentName(studentName);
            payment.setPaymentDate(paymentDate);
            payment.setAmount(amount);
            payment.setStatus(status);
            payment.setDueDate(dueDate);
            
            boolean success = feeDAO.addFeePayment(payment);
            
            if (success) {
                System.out.println("Payment added successfully!");
                request.setAttribute("message", "Fee payment added successfully!");
            } else {
                System.out.println("Failed to add payment!");
                request.setAttribute("error", "Failed to add fee payment!");
            }
            
        } catch (Exception e) {
            System.err.println("Error in AddFeePaymentServlet: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
        
        request.getRequestDispatcher("feepaymentadd.jsp").forward(request, response);
    }
}