package com.easy.forum.peron;

public class InvalidNameException extends Exception {
	public InvalidNameException(){
		super("该用户不存在!");
	}
	public InvalidNameException(String msg){
		super(msg);
	}

}
