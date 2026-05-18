package com.servlet;

import com.dao.FeePaymentDAO;
import com.model.FeePayment;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DisplayFeePaymentsServlet")
public class DisplayFeePaymentsServlet extends HttpServlet {
    private FeePaymentDAO feeDAO = new FeePaymentDAO();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<FeePayment> payments = feeDAO.getAllFeePayments();
        request.setAttribute("payments", payments);
        request.getRequestDispatcher("feepaymentdisplay.jsp").forward(request, response);
    }
}