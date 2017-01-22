package ua.kpi.db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

import static ua.kpi.db.ConnectionParams.*;

/**
 * Created by Valeria on 14.01.2017.
 */
@WebServlet(name = "BanUserServlet", urlPatterns = {"/ban_s"})
public class BanUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Class.forName(DRIVER);
            try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
                 CallableStatement statement = connection.prepareCall("{call ban_user(?, ?, ?, ?)}")) {

                String mainDoctorLogin = (String) req.getSession().getAttribute("login");
                String mainDoctorPassword = req.getParameter("password");
                String userLogin = req.getParameter("uLogin");

                statement.setString(1, mainDoctorLogin);
                statement.setString(2, mainDoctorPassword);
                statement.setString(3, userLogin);

                statement.registerOutParameter(4, Types.VARCHAR);

                statement.executeQuery();

                String banStatus = (String) statement.getObject(4);

                if ("Successful baned".equals(banStatus)) {

                    HttpSession session = req.getSession();
                    session.setAttribute("login", mainDoctorLogin);
                    getServletContext().getRequestDispatcher("/view_patients").forward(req, resp);
                } else {
                    req.setAttribute("error_msg", banStatus);
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

