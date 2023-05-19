/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package iotbay.group1.iotbay;

/**
 *
 * @author Zoey
 */
public class UserCC {
    private int userId;
    private String CCNumber;
    private String CCExpiry;
    private String CCV;

    public UserCC(int userId, String CCNumber, String CCExpiry, String CCV) {
        this.userId = userId;
        this.CCNumber = CCNumber;
        this.CCExpiry = CCExpiry;
        this.CCV = CCV;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getCCNumber() {
        return CCNumber;
    }

    public void setCCNumber(String CCNumber) {
        this.CCNumber = CCNumber;
    }

    public String getCCExpiry() {
        return CCExpiry;
    }

    public void setCCExpiry(String CCExpiry) {
        this.CCExpiry = CCExpiry;
    }

    public String getCCV() {
        return CCV;
    }

    public void setCCV(String CCV) {
        this.CCV = CCV;
    }
}
