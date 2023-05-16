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
    
    public static Connection getConnection() {
        try {
            Class.forName("org.sqlite.JDBC");
            Connection con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\eren_\\Documents\\NetBeansProjects\\IoTBay-clone\\IotBay\\IotBay.db");
            System.out.println("Connection Successful");
            return con;
        }
        catch (Exception e) {
            System.out.println("Connection Failed: " + e);
            return null;
        }
    }

    public boolean authenticateUser(Connection connection, String userType, String email, String password) {
        try {
            System.out.println(userType);
            System.out.println(email);
            System.out.println(password);
            String tableName = userType.equalsIgnoreCase("customer") ? "customer" : "staff";
            String query = "SELECT * FROM " + tableName + " WHERE email = ? AND password = ?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Authentication error: " + e);
            return false;
        }
    }
    
    public static void create(Connection connection) {
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
            //Connection connection = getConnection();
            PreparedStatement query = connection.prepareStatement(sql);
            query.executeUpdate();
            System.out.println("Created table.");
        }
        catch(Exception e) {
            System.out.println("Create table failed: " + e);
        }
    }
    
    public static void insert(Connection connection) {
        String sql = "INSERT INTO `customer` (first_name, last_name, email, password, phone_number, address, credit_card_number, credit_card_expiry, credit_card_cvv) VALUES ('Madison','Walker','madison.walker@hotmail.com','pE8j#M5t','0423456789','17 Maple Road','4525567812345678','07/23','777');";
        try {
            // Connection connection = getConnection();
            PreparedStatement query = connection.prepareStatement(sql);
            query.executeUpdate();
            System.out.println("Inserted to table.");
        }
        catch(Exception e) {
            System.out.println("Insert to table failed: " + e);
        }
    }
    
    public static void select(Connection connection) {
        String sql = "SELECT * FROM Customer;";
        try {
            //Connection connection = getConnection();
            PreparedStatement query = connection.prepareStatement(sql);
            ResultSet rs = query.executeQuery();
            while (rs.next()) {
                System.out.println("Select Result: " + rs.getString("email"));
            }
        }
        catch(Exception e) {
            System.out.println("Select from table failed: " + e);
        }
    }
    public static void main(String args[]) {
        select(getConnection());
    }
}
