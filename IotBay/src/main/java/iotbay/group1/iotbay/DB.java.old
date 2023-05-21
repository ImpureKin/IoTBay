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
            Connection con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\kingt\\Documents\\GitHub\\IoTBay\\IotBay\\IotBay.db");
            System.out.println("Connection Successful");
            return con;
        }
        catch (Exception e) {
            System.out.println("Connection Failed: " + e);
            return null;
        }
    }

    // Authenticate a user during login
    public boolean authenticateUser(Connection connection, String userType, String email, String password) {
        try {
            String tableName = userType.equalsIgnoreCase("customer") ? "customer" : "staff";
            String query = "SELECT * FROM " + tableName + " WHERE email = '" + email + "' AND password = '" + password + "'";
            PreparedStatement pstmt = connection.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            return (rs.next());
            
        } catch (SQLException e) {
            System.out.println("Authentication error: " + e);
            return false;
        }
    }
    
    // Get User to store in Session
    public User getUser(Connection connection, String userType, String email) {
        try {
            String tableName = userType.equalsIgnoreCase("customer") ? "customer" : "staff";
            String query = "SELECT * FROM " + tableName + " WHERE email = '" + email + "'";
            PreparedStatement pstmt = connection.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            
            int id = rs.getInt("id");
            String firstName = rs.getString("first_name");
            String lastName = rs.getString("last_name");
            String password = rs.getString("password");
            String phoneNumber = rs.getString("phone_number");
            String address = rs.getString("address");
            
            if (userType.equalsIgnoreCase("staff")) {
                String role = rs.getString("role");
                User user = new User(id, firstName, lastName, email, password, role, phoneNumber, address, userType);
                return user;
            }
            else {
                User user = new User(id, firstName, lastName, email, password, phoneNumber, address, userType);
                return user;
            }
        } catch (SQLException e) {
            System.out.println("Error getting User: " + e);
            return null;
        }
    }
    
    // Insert a registered customer into DB
    public String registerCustomer(Connection connection, String firstName, String lastName, String email, String password, String phoneNumber, String address, String userType) {
        try {
            String query = "INSERT INTO " + "Customer" + "(first_name, last_name, email, password, phone_number, address) VALUES (?, ?, ?, ?, ?, ?);";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, email);
            pstmt.setString(4, password);
            pstmt.setString(5, phoneNumber);
            pstmt.setString(6, address);
            pstmt.executeUpdate();
            System.out.println("Successfully registered customer: " + firstName + " " + lastName);
            return "Success";
        } catch (SQLException e) {
            System.out.println("Customer Registration error: " + e);
            return "Failed. " + e;
        }
    }
    
    // Insert a registered customer into DB
    public String registerStaff(Connection connection, String firstName, String lastName, String email, String password, String role, String phoneNumber, String address, String userType) {
        try {
            String query = "INSERT INTO " + "Staff" + "(first_name, last_name, email, password, role, phone_number, address) VALUES (?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, email);
            pstmt.setString(4, password);
            pstmt.setString(5, role);
            pstmt.setString(6, phoneNumber);
            pstmt.setString(7, address);
            pstmt.executeUpdate();
            System.out.println("Successfully registered staff: " + firstName + " " + lastName);
            return "Success";
        } catch (SQLException e) {
            System.out.println("Staff Registration error: " + e);
            return "Failed. " + e;
        }
    }
    
    public static int logUserLogin(Connection connection, String userType, int userID) {
        String tableName = (userType.equalsIgnoreCase("customer") ? "customer" : "staff") + "_Log";
        String query = "INSERT INTO " + tableName + "(" + userType + "_id, login_timestamp) VALUES (" + userID + ", CURRENT_TIMESTAMP);";
        int loginID = -1;
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.executeUpdate();
            ResultSet generatedKeys = pstmt.getGeneratedKeys();
            
            if (generatedKeys.next()) {
                loginID = generatedKeys.getInt(1);
            }
            
            System.out.println("Logged user login.");
        }
        catch(Exception e) {
            System.out.println("Error trying to log user login: " + e);
        }
        return loginID;
    }
    
    public static void logUserLogout(Connection connection, String userType, int logID) {
        String tableName = (userType.equalsIgnoreCase("customer") ? "customer" : "staff") + "_Log";
        String query = "UPDATE " + tableName + " SET logout_timestamp = CURRENT_TIMESTAMP WHERE id = " + logID;
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.executeUpdate();
            System.out.println("Logged user logout.");
        }
        catch(Exception e) {
            System.out.println("Error trying to log user logout: " + e);
        }
    }
    
    // Update user detail.
    public static void updateUserDetail(Connection connection, String userType, String field, String value, int userID) {
        String tableName = (userType.equalsIgnoreCase("customer") ? "customer" : "staff");
        String query = "UPDATE " + tableName + " SET " + field + " = '" + value + "' WHERE id = " + userID;
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.executeUpdate();
            System.out.println("Updated user details - " + field + ".");
        }
        catch(Exception e) {
            System.out.println("Error updating user details: " + e);
        }
    }
    
    // Delete user account.
    public static void deleteAccount(Connection connection, String userType, int userID) {
        String tableName = (userType.equalsIgnoreCase("customer") ? "customer" : "staff");
        String deleteAccountQuery = "DELETE FROM " + tableName + " WHERE id = " + userID;
        String deleteOrdersQuery = "UPDATE 'order' SET status = 'Cancelled' WHERE customer_id = " + userID;
        System.out.println(deleteAccountQuery);
        System.out.println(deleteOrdersQuery);
        try {
            // Delete user account.
            PreparedStatement pstmt = connection.prepareStatement(deleteAccountQuery);
            pstmt.executeUpdate();
            // Cancel orders related to customer.
            pstmt = connection.prepareStatement(deleteOrdersQuery);
            pstmt.executeUpdate();
            System.out.println("Deleted user account and cancelled orders.");
        }
        catch(Exception e) {
            System.out.println("Error deleting user account and/or cancelling orders: " + e);
        }
    }
    
    // Example function.
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
    
    // Example function.
    public static void select(Connection connection) {
        String sql = "SELECT * FROM Staff_Log;";
        try {
            //Connection connection = getConnection();
            PreparedStatement query = connection.prepareStatement(sql);
            ResultSet rs = query.executeQuery();
            while (rs.next()) {
                System.out.println("Select Result: " + rs.getString("login_timestamp"));
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
            Connection connection = getConnection();
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
            Connection connection = getConnection();
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
