package iotbay.group1.iotbay;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Big Pops
 */
public class DB {
    
    // Establish and return connection to the DB
    public static Connection getConnection() throws Exception {
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
            throw e;
        }
    }

    // Authenticate a user's login details and return result
    public static boolean authenticateUser(Connection connection, String userType, String email, String password) {
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
    
    // Get User based on email and userType
    public static User getUser(Connection connection, String userType, String email) {
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
            
            // Based on whether user is staff or customer, use User() to create a new User to be returned
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
    
    // Insert (Register) a customer into the database
    public static String registerCustomer(Connection connection, String firstName, String lastName, String email, String password, String phoneNumber, String address) {
        try {
            String query = "INSERT INTO Customer (first_name, last_name, email, password, phone_number, address) VALUES (?, ?, ?, ?, ?, ?);";
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
    
    // Insert (Register) a staff into the database
    public static String registerStaff(Connection connection, String firstName, String lastName, String email, String password, String role, String phoneNumber, String address) {
        try {
            String query = "INSERT INTO Staff (first_name, last_name, email, password, role, phone_number, address) VALUES (?, ?, ?, ?, ?, ?, ?);";
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
    
    // Store/Log a user's login timestamp into the database then return auto-generated logID
    public static int logUserLogin(Connection connection, String userType, int userID) {
        String tableName = (userType.equalsIgnoreCase("customer") ? "customer" : "staff") + "_Log";
        String query = "INSERT INTO " + tableName + "(" + userType + "_id, login_timestamp) VALUES (" + userID + ", CURRENT_TIMESTAMP);";
        int loginID = -1;
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.executeUpdate();
            ResultSet generatedKeys = pstmt.getGeneratedKeys(); // Store auto generated logID and return for later use
            
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
    
    // Store/Log a user's logout timestamp into the database based on logID generated from login
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
    
    // Update a user's details
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
    
    // Delete user account
    public static void deleteAccount(Connection connection, String userType, int userID) {
        String tableName = (userType.equalsIgnoreCase("customer") ? "customer" : "staff");
        String deleteAccountQuery = "DELETE FROM " + tableName + " WHERE id = " + userID;
        String deleteOrdersQuery = "UPDATE 'order' SET status = 'Cancelled' WHERE customer_id = " + userID + " AND status = 'unfulfilled'";
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
    
    // Get all user logs by storing then returning multiple logs in a UserLog List
    public static List<UserLog> getUserLogs(Connection connection, String userType, int userID) {
        String tableName = (userType.equalsIgnoreCase("customer") ? "customer" : "staff") + "_Log";
        String query = "SELECT * FROM " + tableName + " WHERE " + userType + "_id = " + userID;
        List<UserLog> userLogs = new ArrayList<>(); // Make new list of type UserLog
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                int id = rs.getInt("id");
                String loginTimestamp = rs.getString("login_timestamp");
                String logoutTimestamp = rs.getString("logout_timestamp");
                
                // For each result, create a new userLog then add to list
                UserLog userLog = new UserLog(id, userID, loginTimestamp, logoutTimestamp);
                userLogs.add(userLog);
            }
            System.out.println("Successfully provided User Logs.");
        }
        catch(Exception e) {
            System.out.println("Error trying provide User Logs: " + e);
        }
        return userLogs;
    }
    
    // Get all user logs (BASED ON PROVIDED DATE) by storing then returning multiple logs in a UserLog List
    public static List<UserLog> getUserLogsByDate(Connection connection, String userType, int userID, String date) {
        String tableName = (userType.equalsIgnoreCase("customer") ? "customer" : "staff") + "_Log";
        String query = "SELECT * FROM " + tableName + " WHERE " + userType + "_id = " + userID + " AND login_timestamp LIKE '%" + date + "%'"; // Use 'LIKE' with '%%' to check if the date is anywhere in a column/timestamp
        List<UserLog> userLogs = new ArrayList<>(); // Make new list of type UserLog
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                int id = rs.getInt("id");
                String loginTimestamp = rs.getString("login_timestamp");
                String logoutTimestamp = rs.getString("logout_timestamp");
                
                // For each result, create a new userLog then add to list
                UserLog userLog = new UserLog(id, userID, loginTimestamp, logoutTimestamp);
                userLogs.add(userLog);
            }
            System.out.println("Successfully provided User Logs.");
        }
        catch(Exception e) {
            System.out.println("Error trying provide User Logs: " + e);
        }
        return userLogs;
    }
    
    // Check if provided staff code is correct
    public static boolean isCorrectStaffCode(Connection connection, String code) {
        String query = "SELECT * FROM Staff_Code";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            String staffCode = rs.getString("staff_code");
            return (staffCode.equals(code));
        }
        catch(Exception e) {
            System.out.println("Error testing staff code: " + e);
        }
        return false;
    }
}
