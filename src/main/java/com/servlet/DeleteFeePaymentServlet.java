package com.servlet;

import com.dao.FeePaymentDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteFeePaymentServlet")
public class DeleteFeePaymentServlet extends HttpServlet {
    private FeePaymentDAO feeDAO = new FeePaymentDAO();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int paymentId = Integer.parseInt(request.getParameter("id"));
        boolean success = feeDAO.deleteFeePayment(paymentId);
        
        if (success) {
            request.setAttribute("message", "Fee payment deleted successfully!");
        } else {
            request.setAttribute("error", "Failed to delete fee payment!");
        }
        
        response.sendRedirect("DisplayFeePaymentsServlet");
    }
}