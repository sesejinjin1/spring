package com.example.test1.model;

import lombok.Data;

@Data
public class User {
	private String userId;
	private String pwd;
	private String userName;
	private String email;
	private String phone;
	private String gender;
	private String status;
	
	 public String getuserId(){
	        return userId;
	    }
	 public String getpwd(){
	        return pwd;
	    }
	 public String getuserName(){
	        return userName;
	    }
	 public String getStatus(){
	        return status;
	    }

}
