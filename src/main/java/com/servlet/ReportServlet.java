package com.servlet;

import com.dao.FeePaymentDAO;
import com.model.FeePayment;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    private FeePaymentDAO feeDAO = new FeePaymentDAO();
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String reportType = request.getParameter("reportType");
        
        if ("overdue".equals(reportType)) {
            List<FeePayment> overduePayments = feeDAO.getOverduePayments();
            request.setAttribute("reportData", overduePayments);
            request.setAttribute("reportTitle", "Overdue Payments Report");
            request.getRequestDispatcher("report_result.jsp").forward(request, response);
            
        } else if ("unpaid".equals(reportType)) {
            Date startDate = Date.valueOf(request.getParameter("startDate"));
            Date endDate = Date.valueOf(request.getParameter("endDate"));
            List<FeePayment> unpaidStudents = feeDAO.getUnpaidStudents(startDate, endDate);
            request.setAttribute("reportData", unpaidStudents);
            request.setAttribute("reportTitle", "Unpaid Students Report (" + startDate + " to " + endDate + ")");
            request.getRequestDispatcher("report_result.jsp").forward(request, response);
            
        } else if ("collection".equals(reportType)) {
            Date startDate = Date.valueOf(request.getParameter("startDate"));
            Date endDate = Date.valueOf(request.getParameter("endDate"));
            double totalCollection = feeDAO.getTotalCollection(startDate, endDate);
            request.setAttribute("totalCollection", totalCollection);
            request.setAttribute("startDate", startDate);
            request.setAttribute("endDate", endDate);
            request.setAttribute("reportTitle", "Total Collection Report");
            request.getRequestDispatcher("report_result.jsp").forward(request, response);
        }
    }
}