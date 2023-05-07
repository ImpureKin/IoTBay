// UserManager.java
package iotbay.group1.iotbay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserManager {
    
    public static boolean authenticate(String userType, String email, String password) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            // Create a connection to the database
            DB db = new DB();
            conn = db.getConnection();

            // Query the database for the matching user
            String query = "SELECT * FROM " + userType + " WHERE email = ? AND password = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            // Check if a matching user was found
            boolean isAuthenticated = rs.next();
            if (isAuthenticated) {
                System.out.println("Authentication successful for email: " + email + " and userType: " + userType);
            } else {
                System.out.println("Authentication failed for email: " + email + " and userType: " + userType);
            }
            return isAuthenticated;
        } catch (SQLException e) {
            System.out.println("Authentication error: " + e);
            return false;
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e);
            }
        }
    }
}
