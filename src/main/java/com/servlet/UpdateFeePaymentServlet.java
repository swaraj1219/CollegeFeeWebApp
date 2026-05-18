package com.servlet;

import com.dao.FeePaymentDAO;
import com.model.FeePayment;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateFeePaymentServlet")
public class UpdateFeePaymentServlet extends HttpServlet {
    private FeePaymentDAO feeDAO = new FeePaymentDAO();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int paymentId = Integer.parseInt(request.getParameter("id"));
        FeePayment payment = feeDAO.getPaymentById(paymentId);
        request.setAttribute("payment", payment);
        request.getRequestDispatcher("feepaymentupdate.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            int paymentId = Integer.parseInt(request.getParameter("paymentId"));
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            String studentName = request.getParameter("studentName");
            Date paymentDate = Date.valueOf(request.getParameter("paymentDate"));
            BigDecimal amount = new BigDecimal(request.getParameter("amount"));
            String status = request.getParameter("status");
            Date dueDate = Date.valueOf(request.getParameter("dueDate"));
            
            FeePayment payment = new FeePayment();
            payment.setPaymentId(paymentId);
            payment.setStudentId(studentId);
            payment.setStudentName(studentName);
            payment.setPaymentDate(paymentDate);
            payment.setAmount(amount);
            payment.setStatus(status);
            payment.setDueDate(dueDate);
            
            boolean success = feeDAO.updateFeePayment(payment);
            
            if (success) {
                request.setAttribute("message", "Fee payment updated successfully!");
            } else {
                request.setAttribute("error", "Failed to update fee payment!");
            }
        } catch (Exception e) {
            request.setAttribute("error", "Error: " + e.getMessage());
        }
        
        response.sendRedirect("DisplayFeePaymentsServlet");
    }
}