package cn.easy.js.fan.kernal;

import cn.easy.js.fan.web.Global;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.Timer;

public class AppServletContextListener implements ServletContextListener {

	private Timer timer;

	public void contextDestroyed(ServletContextEvent event) {
		System.out.println("EasyWebPlate end : " + Global.AppName
				+ " Context has destroyed.");
	}

	public void contextInitialized(ServletContextEvent event) {
		System.out.println("EasyWebPlate start : " + Global.AppName
				+ " Context has started.");
		System.out.println(Global.AppName + " real path is "
				+ event.getServletContext().getRealPath("/"));
	}

}
