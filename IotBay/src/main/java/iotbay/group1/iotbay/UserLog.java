/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package iotbay.group1.iotbay;

/**
 *
 * @author Big Pops
 */
public class UserLog {
    private int id;
    private int userID;
    private String loginTimestamp;
    private String logoutTimestamp;
    
    // Customer
    public UserLog(int id, int userID, String loginTimestamp, String logoutTimestamp) {
        this.id = id;
        this.userID = userID;
        this.loginTimestamp = loginTimestamp;
        this.logoutTimestamp = logoutTimestamp;
    }
    
    public int getID() {
        return id;
    }

    public int getUserID() {
        return userID;
    }

    public String getLoginTimestamp() {
        return loginTimestamp;
    }

    public String getLogoutTimestamp() {
        if (logoutTimestamp == null) {
            logoutTimestamp = "Not Recorded";
        }
        return logoutTimestamp;
    }

}
