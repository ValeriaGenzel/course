package ua.kpi.db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static ua.kpi.db.ConnectionParams.*;

@WebServlet(name = "UserServlet", urlPatterns = {"/u"})
public class UserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Class.forName(DRIVER);
            try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement statement = connection.prepareStatement("select * from users")) {
                statement.executeQuery();
                ResultSet resultSet = statement.getResultSet();

                List<String> names = new ArrayList<>();
                while(resultSet.next()) {
                    names.add(resultSet.getString("u_name"));
                }
                req.setAttribute("names", names);
                getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

}
