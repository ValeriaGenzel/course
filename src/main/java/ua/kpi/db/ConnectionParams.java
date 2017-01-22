package ua.kpi.db;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by Valeria on 19.01.2017.
 */
public class ConnectionParams {

    public static final String DRIVER;
    public static final String URL;
    public static final String USER;
    public static final String PASSWORD;

    static {
        Properties properties = new Properties();
        try {
            ClassLoader classloader = Thread.currentThread().getContextClassLoader();
            InputStream input = classloader.getResourceAsStream("connection.properties");
            properties.load(input);
        } catch (IOException e) {
            e.printStackTrace();
        }

        DRIVER = properties.getProperty("driver");
        URL = properties.getProperty("url");
        USER = properties.getProperty("login");
        PASSWORD = properties.getProperty("password");

        System.out.println(DRIVER);
        System.out.println(URL);
        System.out.println(USER);
        System.out.println(PASSWORD);
    }

}
