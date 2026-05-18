package com.dao;

import com.model.FeePayment;
import com.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeePaymentDAO {
    
    // Add new fee payment
    public boolean addFeePayment(FeePayment payment) {
        String sql = "INSERT INTO FeePayments (StudentID, StudentName, PaymentDate, Amount, Status, DueDate) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, payment.getStudentId());
            pstmt.setString(2, payment.getStudentName());
            pstmt.setDate(3, payment.getPaymentDate());
            pstmt.setBigDecimal(4, payment.getAmount());
            pstmt.setString(5, payment.getStatus());
            pstmt.setDate(6, payment.getDueDate());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Update fee payment
    public boolean updateFeePayment(FeePayment payment) {
        String sql = "UPDATE FeePayments SET StudentID=?, StudentName=?, PaymentDate=?, Amount=?, Status=?, DueDate=? WHERE PaymentID=?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, payment.getStudentId());
            pstmt.setString(2, payment.getStudentName());
            pstmt.setDate(3, payment.getPaymentDate());
            pstmt.setBigDecimal(4, payment.getAmount());
            pstmt.setString(5, payment.getStatus());
            pstmt.setDate(6, payment.getDueDate());
            pstmt.setInt(7, payment.getPaymentId());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Delete fee payment
    public boolean deleteFeePayment(int paymentId) {
        String sql = "DELETE FROM FeePayments WHERE PaymentID=?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, paymentId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Get all fee payments
    public List<FeePayment> getAllFeePayments() {
        List<FeePayment> payments = new ArrayList<>();
        String sql = "SELECT * FROM FeePayments ORDER BY PaymentDate DESC";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                FeePayment payment = new FeePayment();
                payment.setPaymentId(rs.getInt("PaymentID"));
                payment.setStudentId(rs.getInt("StudentID"));
                payment.setStudentName(rs.getString("StudentName"));
                payment.setPaymentDate(rs.getDate("PaymentDate"));
                payment.setAmount(rs.getBigDecimal("Amount"));
                payment.setStatus(rs.getString("Status"));
                payment.setDueDate(rs.getDate("DueDate"));
                payments.add(payment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payments;
    }
    
    // Get payment by ID
    public FeePayment getPaymentById(int paymentId) {
        String sql = "SELECT * FROM FeePayments WHERE PaymentID=?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, paymentId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                FeePayment payment = new FeePayment();
                payment.setPaymentId(rs.getInt("PaymentID"));
                payment.setStudentId(rs.getInt("StudentID"));
                payment.setStudentName(rs.getString("StudentName"));
                payment.setPaymentDate(rs.getDate("PaymentDate"));
                payment.setAmount(rs.getBigDecimal("Amount"));
                payment.setStatus(rs.getString("Status"));
                payment.setDueDate(rs.getDate("DueDate"));
                return payment;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // Get overdue payments
    public List<FeePayment> getOverduePayments() {
        List<FeePayment> payments = new ArrayList<>();
        String sql = "SELECT * FROM FeePayments WHERE Status='Overdue' OR (DueDate < CURDATE() AND Status!='Paid')";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                FeePayment payment = new FeePayment();
                payment.setPaymentId(rs.getInt("PaymentID"));
                payment.setStudentId(rs.getInt("StudentID"));
                payment.setStudentName(rs.getString("StudentName"));
                payment.setPaymentDate(rs.getDate("PaymentDate"));
                payment.setAmount(rs.getBigDecimal("Amount"));
                payment.setStatus(rs.getString("Status"));
                payment.setDueDate(rs.getDate("DueDate"));
                payments.add(payment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payments;
    }
    
    // Get students who haven't paid in a period
    public List<FeePayment> getUnpaidStudents(Date startDate, Date endDate) {
        List<FeePayment> payments = new ArrayList<>();
        String sql = "SELECT * FROM FeePayments WHERE PaymentDate NOT BETWEEN ? AND ? AND Status != 'Paid'";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                FeePayment payment = new FeePayment();
                payment.setPaymentId(rs.getInt("PaymentID"));
                payment.setStudentId(rs.getInt("StudentID"));
                payment.setStudentName(rs.getString("StudentName"));
                payment.setPaymentDate(rs.getDate("PaymentDate"));
                payment.setAmount(rs.getBigDecimal("Amount"));
                payment.setStatus(rs.getString("Status"));
                payment.setDueDate(rs.getDate("DueDate"));
                payments.add(payment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payments;
    }
    
    // Get total collection between dates
    public double getTotalCollection(Date startDate, Date endDate) {
        String sql = "SELECT SUM(Amount) as Total FROM FeePayments WHERE PaymentDate BETWEEN ? AND ? AND Status='Paid'";
        double total = 0.0;
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                total = rs.getDouble("Total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }
}