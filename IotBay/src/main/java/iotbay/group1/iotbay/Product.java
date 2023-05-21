/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package iotbay.group1.iotbay;

/**
 *
 * @author John
 */
public class Product {
    private int id;
    private String name;
    private String description;
    private String category;
    private String subcategory;
    private Double price;
    private int quantity;
    private int created_by;
    
    public Product(Integer id, String name, String description, String category, String subcategory, Double price,
    Integer quantity, Integer created_by) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.category = category;
        this.subcategory = subcategory;
        this.price = price;
        this.quantity = quantity;
        this.created_by = created_by;
    }
    
    public int getId() {
        return this.id;
    }
    
    public String getName() {
        return this.name;
    }
    
    public String getDescription() {
        return this.description;
    }
    
    public String getCategory() {
        return this.category;
    }
    
    public String getSubCategory() {
        return this.subcategory;
    }
    
    public double getPrice() {
        return this.price;
    }
    
    public int getQuantity() {
        return this.quantity;
    }
}
