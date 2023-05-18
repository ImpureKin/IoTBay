/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package iotbay.group1.iotbay;
import java.time.LocalDate;
import java.sql.Date;
/**
 *
 * @author Zoey
 */
public class Invoice {
    private int id;
    private String date;
    private double amount;
    private String payment_method;
    private String status;
    private int cust_id;
    private int order_id;

    public Invoice(int id, String date, double amount, String payment_method, String status, int cust_id, int order_id) {
        this.id = id;
        this.date = date;
        this.amount = amount;
        this.payment_method = payment_method;
        this.status = status;
        this.cust_id = cust_id;
        this.order_id = order_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCust_id() {
        return cust_id;
    }

    public void setCust_id(int cust_id) {
        this.cust_id = cust_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }


}
