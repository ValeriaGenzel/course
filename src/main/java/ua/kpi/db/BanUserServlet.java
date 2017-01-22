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
        switch (req.getParameter("action")) {
            case "in":
                try {
                    Class.forName(DRIVER);
                    try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
                         CallableStatement statement = connection.prepareCall("{call ban_user(?, ?, ?, ?)}")) {

                        String mainDoctorLogin = req.getParameter("MDlogin");
                        String mainDoctorPassword = req.getParameter("MDpassword");
                        String userLogin = req.getParameter("login");

                        statement.setString(1, mainDoctorLogin);
                        statement.setString(2,  mainDoctorPassword);
                        statement.setString(3, userLogin);

                        statement.registerOutParameter(4, Types.VARCHAR);

                        statement.executeQuery();

                        String banStatus = (String) statement.getObject(4);

                        if ("Successful baned".equals(banStatus)) {

                            HttpSession session = req.getSession();

                            getServletContext().getRequestDispatcher("/home.jsp").forward(req, resp);
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
                break;
            case "out":
                req.getSession().invalidate();
                getServletContext().getRequestDispatcher("/home.jsp").forward(req, resp);
                break;
            default:
                getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }
}
