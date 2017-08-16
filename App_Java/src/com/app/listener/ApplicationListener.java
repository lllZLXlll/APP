package com.app.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.app.util.Constants;


public class ApplicationListener  implements ServletContextListener {
	public static Log log = LogFactory.getLog(ApplicationListener.class);
	

	public void contextDestroyed(ServletContextEvent arg0) {
		log.info("ServletContextListener毁灭....");
		
	}

	public void contextInitialized(ServletContextEvent event) {
		ServletContext application=event.getServletContext();
		application.setAttribute(Constants.CLOSEWEB, 1);
		application.setAttribute(Constants.BASEPATH_FLAG, Constants.BASEPATH);
	}

}
