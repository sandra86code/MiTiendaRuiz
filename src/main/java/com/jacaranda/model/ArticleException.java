package com.jacaranda.model;

public class ArticleException extends Exception {

	public ArticleException() {

	}

	public ArticleException(String message) {
		super(message);
		
	}

	public ArticleException(Throwable cause) {
		super(cause);
		
	}

	public ArticleException(String message, Throwable cause) {
		super(message, cause);
		
	}

	public ArticleException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		
	}

}
