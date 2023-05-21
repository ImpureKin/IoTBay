package iotbay.group1.iotbay;

// Create class for UserLog
public class UserLog {
    private int id;
    private int userID;
    private String loginTimestamp;
    private String logoutTimestamp;

    // UserLog Constructor
    public UserLog(int id, int userID, String loginTimestamp, String logoutTimestamp) {
        this.id = id;
        this.userID = userID;
        this.loginTimestamp = loginTimestamp;
        this.logoutTimestamp = logoutTimestamp;
    }
    
    // Getters & Setters
    public int getID() {
        return id;
    }

    public int getUserID() {
        return userID;
    }

    public String getLoginTimestamp() {
        return loginTimestamp;
    }

    // If logoutTimestamp is null, return as "Not Recorded"
    public String getLogoutTimestamp() {
        if (logoutTimestamp == null) {
            logoutTimestamp = "Not Recorded";
        }
        return logoutTimestamp;
    }

}
