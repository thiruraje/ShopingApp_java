package com.booking.test;

import java.util.HashSet;
import java.util.HashMap;
import java.util.List;

import java.util.ArrayList;


public class DB {
	static String adminUser="thiruss";
	static String adminPass="thiru123";
	static ArrayList<Customer> customerList=new ArrayList<Customer>();
	
	static HashSet<String> categoryList=new HashSet<String>();
	static ArrayList<Product> productList=new ArrayList<Product>();
	
    static HashMap<String, ArrayList<Product>> cartDetails = new HashMap<String, ArrayList<Product>>();
    
    static ArrayList<Order> orders=new ArrayList<Order>();


}
