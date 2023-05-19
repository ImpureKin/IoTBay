package iotbay.group1.iotbay;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;
import java.util.ArrayList;


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Zoey
 */
public class InvoiceManager {

    public static ArrayList<Invoice> getInvoices(int user)
{
ArrayList<Invoice> list = new ArrayList<Invoice>();
String sql = "SELECT * FROM Invoice WHERE customer_id = ?;";
Connection connection = null;
        try {
            connection = DB.getConnection();
            PreparedStatement query = connection.prepareStatement(sql);
            query.setInt(1,user);
            ResultSet rs = query.executeQuery();
            while (rs.next()) {
                //System.out.println("Select Result: " + rs.getString("id"));
                //System.out.println("Select Result: " + rs.getString("amount"));
                Invoice a = new Invoice(rs.getInt("id"),rs.getString("date"),rs.getDouble("amount"),rs.getString("payment_method"),rs.getString("status"),rs.getInt("customer_id"),rs.getInt("order_id"));
                list.add(a);
            }
        }
        catch(Exception e) {
            System.out.println("Select from table failed: " + e);
        }
finally {
                if (connection != null) {
                    // closes the database connection
                    try {
System.out.println("DB connection Closed");
                        connection.close();
                    } catch (SQLException ex) {
                    System.out.println("closing connection failed: " + ex);
                    }
}}
return list;
}
public static Invoice getSingleInvoice(int id)
{
String sql = "SELECT * FROM Invoice WHERE id = ?;";
        try {
            Connection connection = DB.getConnection();
            PreparedStatement query = connection.prepareStatement(sql);
            query.setInt(1,id);
            ResultSet rs = query.executeQuery();
            while (rs.next()) {
                Invoice a = new Invoice(rs.getInt("id"),rs.getString("date"),rs.getDouble("amount"),rs.getString("payment_method"),rs.getString("status"),rs.getInt("customer_id"),rs.getInt("order_id"));
                //connection.close();
                return a;

            }
        }
        catch(Exception e) {
            System.out.println("Select from table failed: " + e);
        }

return null;
}
public static UserCC getUserCC(int id)
{
String sql = "SELECT * FROM Customer WHERE id = ?;";
        try {
            Connection connection = DB.getConnection();
            PreparedStatement query = connection.prepareStatement(sql);
            query.setInt(1,id);
            ResultSet rs = query.executeQuery();
            while (rs.next()) {
                UserCC a = new UserCC(rs.getInt("id"),rs.getString("credit_card_number"),rs.getString("credit_card_expiry"),rs.getString("credit_card_cvv"));
                //connection.close();
                return a;

            }
        }
        catch(Exception e) {
            System.out.println("Select from table failed: " + e);
        }

return null;
}
public static boolean updateInvoice(Invoice inv, UserCC card){


      
if(!inv.getStatus().equals("PAID"))
{
  String sql = "UPDATE Invoice SET " + " = '"  + "' WHERE id = " + inv.getId();
        String cardSql = "UPDATE Customer SET " + " = '"  + "' WHERE id = " + card.getUserId();
        try {
Connection connection = DB.getConnection();
            PreparedStatement query = connection.prepareStatement(sql);
            query.setDouble(1,inv.getAmount());
            query.executeUpdate();
            System.out.println("Updated invoice details - "  + ".");
        PreparedStatement cardQuery = connection.prepareStatement(cardSql);
            cardQuery.setDouble(1,inv.getAmount());
            cardQuery.executeUpdate();
            System.out.println("Updated card details - "  + ".");
        return true;
        }
        catch(Exception e) {
            System.out.println("Error updating user details: " + e);
        return false;
        }

}
else
{
return false;
}
}
public static boolean createInvoice(Invoice inv)
{
        String sql = "INSERT INTO Invoice (date, amount, payment_method, status, customer_id, order_id) VALUES (?,?,?,?,?,?);";
        try {
            Connection connection = DB.getConnection();
            PreparedStatement query = connection.prepareStatement(sql);
            Date d = Date.valueOf(inv.getDate());
    query.setDate(1,d);
    query.setDouble(2,inv.getAmount());
    query.setString(3,inv.getPayment_method());
    query.setString(4,inv.getStatus());
    query.setInt(5,inv.getCust_id());
    query.setInt(6,inv.getOrder_id());
            query.executeUpdate();
            System.out.println("Inserted to table.");
        return true;
        }
        catch(Exception e) {
            System.out.println("Insert to table failed: " + e);
        return false;
        }

}

public static void main(String[] args) {
//        connectDB();
//        create();
//        insert();
//        select();
//ArrayList<Invoice> a = getInvoices(10);
//System.out.println(a.size());
Invoice b = new Invoice(7,"1999-12-03",420,"CASH","PENDING",9,8);
//Date d = Date.valueOf(b.getDate());
//System.out.println(Date.valueOf(b.getDate()));
createInvoice(b);
    }

}
