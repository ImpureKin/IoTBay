import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import java.util.logging.*;
import iotbay.group1.iotbay.*;
import java.sql.*;

public class UserManagementTests {
    
    private static Connection conn;
    
    public UserManagementTests() {
    }

    @BeforeAll
    public static void setUpClass() throws Exception {
        try {
            conn = DB.getConnection();
        } 
        catch (SQLException e) {
            Logger.getLogger(UserManagementTests.class.getName()).log(Level.SEVERE, "Failed creating connection to DB: ", e);
        }
    }

    @AfterAll
    public static void tearDownClass() throws Exception {
        try {
            conn.close();
        } 
        catch (SQLException e) {
            Logger.getLogger(UserManagementTests.class.getName()).log(Level.SEVERE, "Failed closing connection to DB: ", e);
        }
    }

    @BeforeEach
    public void setUp() throws Exception {
        try {
            setUpClass();
        } 
        catch (SQLException e) {
            Logger.getLogger(UserManagementTests.class.getName()).log(Level.SEVERE, "Failed starting up class after test: ", e);
        }
    }

    @AfterEach
    public void tearDown() throws Exception {
        try {
            tearDownClass();
        } 
        catch (SQLException e) {
            Logger.getLogger(UserManagementTests.class.getName()).log(Level.SEVERE, "Failed tearing down class after test: ", e);
        }
    }
    
    @Test
    public void testRegisterCustomer() throws Exception {
        try {
            DB.registerCustomer(conn, "Test", "User", "TestUser@hotmail.com", "password", "0410203040", "10 Test St");
            User user = DB.getUser(conn, "Customer", "TestUser@hotmail.com");
            assertNotNull(user);
        } 
        catch (Exception e) {
            Logger.getLogger(UserManagementTests.class.getName()).log(Level.SEVERE, "Failed Registering Customer: ", e);
        }
    }
    
    @Test
    public void testRegisterStaff() throws Exception {
        try {
            DB.registerStaff(conn, "Test", "User2", "TestUser2@hotmail.com", "password", "Tester","0410203770", "100 Tester St");
            User user = DB.getUser(conn, "Staff", "TestUser2@hotmail.com");
            assertNotNull(user);
        } 
        catch (Exception e) {
            Logger.getLogger(UserManagementTests.class.getName()).log(Level.SEVERE, "Failed Registering Staff: ", e);
        }
    }
    
    @Test
    public void testAuthenticateCustomer() throws Exception {
        try {
            assertTrue(DB.authenticateUser(conn, "Customer", "TestUser@hotmail.com", "password"));
        } 
        catch (Exception e) {
            Logger.getLogger(UserManagementTests.class.getName()).log(Level.SEVERE, "Failed authenticating Customer: ", e);
        }
    }
    
    @Test
    public void testAuthenticateStaff() throws Exception {
        try {
            assertTrue(DB.authenticateUser(conn, "Staff", "TestUser2@hotmail.com", "password"));
        } 
        catch (Exception e) {
            Logger.getLogger(UserManagementTests.class.getName()).log(Level.SEVERE, "Failed authenticating Staff: ", e);
        }
    }
    
    @Test
    public void testUpdateUserDetail() throws Exception {
        try {
            User initialUser = DB.getUser(conn, "Customer", "emma@hotmail.com");
            DB.updateUserDetail(conn, "Customer", "first_name", "TestName", 1);
            User postUser = DB.getUser(conn, "Customer", "emma@hotmail.com");
            assertNotSame(postUser, initialUser);
        } 
        catch (Exception e) {
            Logger.getLogger(UserManagementTests.class.getName()).log(Level.SEVERE, "Failed to update User Details: ", e);
        }
    }
}
