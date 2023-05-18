/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package iotbay.group1.iotbay;
import java.sql.*;

/**
 *
 * @author Big Pops
 */
public class DB {

    Connection con = null;
       
    public static Connection connectDB() {
        try {
            Class.forName("org.sqlite.JDBC");
            Connection con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\kingt\\Documents\\GitHub\\IoTBay\\IotBay\\IotBay.db");
            System.out.println("Connection Successful");
            return con;
        }
        catch (Exception e) {
            System.out.println("Connection Failed: " + e);
            return null;
        }
    }
    
    public static void create() {
        String sql = "CREATE TABLE customer (\n" +
                    "  id INTEGER PRIMARY KEY AUTOINCREMENT,\n" +
                    "  first_name TEXT NOT NULL,\n" +
                    "  last_name TEXT NOT NULL,\n" +
                    "  email TEXT NOT NULL UNIQUE,\n" +
                    "  password TEXT NOT NULL,\n" +
                    "  phone_number TEXT NOT NULL UNIQUE,\n" +
                    "  address TEXT NOT NULL,\n" +
                    "  credit_card_number TEXT DEFAULT NULL,\n" +
                    "  credit_card_expiry TEXT DEFAULT NULL,\n" +
                    "  credit_card_cvv TEXT DEFAULT NULL\n" +
                    ");";
        try {
            Connection connection = connectDB();
            PreparedStatement query = connection.prepareStatement(sql);
            query.executeUpdate();
            System.out.println("Created table.");
        }
        catch(Exception e) {
            System.out.println("Create table failed: " + e);
        }
    }
    
    public static void insert() {
        String sql = "INSERT INTO `customer` (first_name, last_name, email, password, phone_number, address, credit_card_number, credit_card_expiry, credit_card_cvv) VALUES ('Madison','Walker','madison.walker@hotmail.com','pE8j#M5t','0423456789','17 Maple Road','4525567812345678','07/23','777');";
        try {
            Connection connection = connectDB();
            PreparedStatement query = connection.prepareStatement(sql);
            query.executeUpdate();
            System.out.println("Inserted to table.");
        }
        catch(Exception e) {
            System.out.println("Insert to table failed: " + e);
        }
    }
    
    public static void select() {
        String sql = "SELECT * FROM Customer;";
        try {
            Connection connection = connectDB();
            PreparedStatement query = connection.prepareStatement(sql);
            ResultSet rs = query.executeQuery();
            while (rs.next()) {
                System.out.println("Select Result: " + rs.getString("id"));
                System.out.println("Select Result: " + rs.getString("email"));
            }
        }
        catch(Exception e) {
            System.out.println("Select from table failed: " + e);
        }
    }
    
    public static void main(String[] args) {
//        connectDB();
//        create();
//        insert();
//        select();
viewInvoices(10);
    }

    public static void addPay(String[] args)
    {
        String sql = "INSERT INTO `invoice` (date, amount, payment_method, status, customer_id, order_id) VALUES ('2023-05-15','2000','cash','pending','1','1');";
        try {
            Connection connection = connectDB();
            PreparedStatement query = connection.prepareStatement(sql);
            query.executeUpdate();
            System.out.println("Inserted to table.");
        }
        catch(Exception e) {
            System.out.println("Insert to table failed: " + e);
        }

    }

    public static void viewInvoices(int a)
    {
        String sql = "SELECT * FROM Invoice WHERE customer_id = ?;";
        try {
            Connection connection = connectDB();
            PreparedStatement query = connection.prepareStatement(sql);
            query.setInt(1,a);
            ResultSet rs = query.executeQuery();
            while (rs.next()) {
                System.out.println("Select Result: " + rs.getString("id"));
                System.out.println("Select Result: " + rs.getString("amount"));
            }
        }
        catch(Exception e) {
            System.out.println("Select from table failed: " + e);
        }
    }
}
