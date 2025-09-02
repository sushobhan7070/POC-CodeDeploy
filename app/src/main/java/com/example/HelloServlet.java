package com.example;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Properties;

public class HelloServlet extends HttpServlet {
    private String logLevel = "INFO";

    @Override
    public void init() throws ServletException {
        try {
            Properties prop = new Properties();
            FileInputStream fis = new FileInputStream("/usr/share/tomcat/webapps/config.properties");
            prop.load(fis);
            logLevel = prop.getProperty("log_level", "INFO");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<h1>Hello World from POC App</h1>");
        out.println("<p>Current log level: " + logLevel + "</p>");
    }
}
