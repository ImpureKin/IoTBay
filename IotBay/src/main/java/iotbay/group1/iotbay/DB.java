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
            // LAPTOP CONNECTION
            // Connection con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\eren_\\Documents\\NetBeansProjects\\IoTBay-clone\\IotBay\\IotBay.db");
            
            // PC CONNECTION
            Connection con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Big Pops\\Documents\\NetBeansProjects\\IotBay\\IotBay\\IotBay.db");
            
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
            String query = "SELECT * FROM " + tableName + " WHERE email = ? AND password = ?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
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
            String query = "SELECT * FROM " + tableName + " WHERE email = ?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            
            int id = rs.getInt("id");
            String firstName = rs.getString("first_name");
            String lastName = rs.getString("last_name");
            String password = rs.getString("password");
            String phoneNumber = rs.getString("phone_number");
            String address = rs.getString("address");
            
            if (userType.equalsIgnoreCase("staff")) {
                String role = rs.getString("role");
                User user = new User(id, firstName, lastName, email, password, role, phoneNumber, address);
                return user;
            }
            else {
                User user = new User(id, firstName, lastName, email, password, phoneNumber, address);
                return user;
            }
        } catch (SQLException e) {
            System.out.println("Error getting User: " + e);
            return null;
        }
    }
    
    // Insert a registered customer into DB
    public String registerCustomer(Connection connection, String firstName, String lastName, String email, String password, String phoneNumber, String address) {
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
    public String registerStaff(Connection connection, String firstName, String lastName, String email, String password, String role, String phoneNumber, String address) {
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
        String query = "INSERT INTO " + tableName + "(" + userType + "_id, login_timestamp) VALUES (?, CURRENT_TIMESTAMP);";
        int loginID = -1;
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, userID);
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
        String query = "UPDATE " + tableName + " SET logout_timestamp = CURRENT_TIMESTAMP WHERE id = ?;";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, logID);
            pstmt.executeUpdate();
            System.out.println("Logged user logout.");
        }
        catch(Exception e) {
            System.out.println("Error trying to log user logout: " + e);
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
    public static void main(String args[]) {
        select(getConnection());
    }
}
