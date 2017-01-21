package ua.kpi.db;

import java.sql.*;

/**
 * Created by Valeria on 19.01.2017.
 */
public class ConnectionParams {

    public static final String  DRIVER = "oracle.jdbc.OracleDriver";
    public static final String  URL = "jdbc:oracle:thin:@//localhost:1521/orcl";
    public static final String  USER = "Valeria" ;
    public static final String  PASSWORD = "781227";

    public static void main(String[] args) {
        try {
            Class.forName(DRIVER);
            try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement statement = connection.prepareStatement("select * from users")) {
                statement.executeQuery();
                ResultSet resultSet = statement.getResultSet();

                while(resultSet.next()) {
                    System.out.println(resultSet.getString("u_name"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

}
