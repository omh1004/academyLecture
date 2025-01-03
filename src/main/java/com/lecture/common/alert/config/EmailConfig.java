package com.lecture.common.alert.config;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class EmailConfig {
	  //private static final String CONFIG_FILE = "emailConfig.properties";
	  private static Properties properties = new Properties();

	    static {
	    	
	    	String path=EmailConfig.class.getResource("./emailConfig.properties").getPath();
	    	
	        try (FileInputStream fis = new FileInputStream(path)) {
	            properties.load(fis);
	        } catch (IOException e) {
	            e.printStackTrace();
	            throw new RuntimeException("Failed to load configuration file.");
	        }
	    }

	    public static String get(String key) {
	        return properties.getProperty(key);
	    }
}
