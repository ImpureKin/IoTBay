package iotbay.group1.iotbay;

import static iotbay.group1.iotbay.DB.connectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
        try {
            Connection connection = connectDB();
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

return list;
}

public static void main(String[] args) {
//        connectDB();
//        create();
//        insert();
//        select();
ArrayList<Invoice> a = getInvoices(10);
System.out.println(a.size());
    }

}
