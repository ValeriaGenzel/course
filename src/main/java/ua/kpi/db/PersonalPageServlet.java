package ua.kpi.db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


import static ua.kpi.db.ConnectionParams.*;

@WebServlet(name = "PersonalPageServlet", urlPatterns = {"/personal_page"})
public class PersonalPageServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Class.forName(DRIVER);
            try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement statement = connection.prepareStatement("select * from personal_page_view " +
                         "WHERE u_login = '" + req.getSession().getAttribute("login") +"'")) {
                statement.executeQuery();

                ResultSet resultSet = statement.getResultSet();

                if (resultSet.next()) {
                    req.setAttribute("login", resultSet.getString(1));
                    req.setAttribute("name", resultSet.getString(2));
                    req.setAttribute("surname", resultSet.getString(3));

                    req.setAttribute("password", resultSet.getString(4));
                    req.setAttribute("email", resultSet.getString(5));

                    req.setAttribute("tel", resultSet.getString(6));
                    req.setAttribute("spec", resultSet.getString(7));

                    statement.close();
                    getServletContext().getRequestDispatcher("/editProfile.jsp").forward(req, resp);
                } else {
                    req.setAttribute("problem", "failed to get personal data");
                    statement.close();
                    getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }

}
