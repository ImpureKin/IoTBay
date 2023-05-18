package iotbay.group1.iotbay;
import java.sql.*;
import iotbay.group1.iotbay.DB;

public class User {
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String role; // For staff only
    private String phoneNumber;
    private String address;
    private String userType;
    
    // Customer
    public User(int id, String firstName, String lastName, String email, String password, String phoneNumber, String address, String userType) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.userType = userType;
    }
    
    // Staff
    public User(int id, String firstName, String lastName, String email, String password, String role, String phoneNumber, String address, String userType) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.role = role;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.userType = userType;
    }

    // Getters and Setters
    public int getID() {
        return id;
    }

    public void setID(int id) {
        this.id = id;
    }
    
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(Connection connection, String firstName) {
        this.firstName = firstName;
        DB.updateUserDetail(connection, this.userType, "first_name", firstName, this.id);
    }
    
    public String getLastName() {
        return lastName;
    }

    public void setLastName(Connection connection, String lastName) {
        this.lastName = lastName;
        DB.updateUserDetail(connection, this.userType, "last_name", lastName, this.id);
    }
    
    public String getFullName() {
        return firstName + " " + lastName;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(Connection connection, String email) {
        this.email = email;
        DB.updateUserDetail(connection, this.userType, "email", email, this.id);
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(Connection connection, String password) {
        this.password = password;
        DB.updateUserDetail(connection, this.userType, "password", password, this.id);
    }
    
    public String getRole() {
        return role;
    }

    public void setRole(Connection connection, String role) {
        this.role = role;
        DB.updateUserDetail(connection, this.userType, "role", role, this.id);
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(Connection connection, String phoneNumber) {
        this.phoneNumber = phoneNumber;
        DB.updateUserDetail(connection, this.userType, "phone_number", phoneNumber, this.id);
    }
    
    public String getAddress() {
        return address;
    }

    public void setAddress(Connection connection, String address) {
        this.address = address;
        DB.updateUserDetail(connection, this.userType, "address", address, this.id);
    }
    
    public String getUserType() {
        return userType;
    }

    // Likely not needed.
    public void setuserType(Connection connection, String userType) {
        this.userType = userType;
    }
}
