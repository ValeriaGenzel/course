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
@WebServlet(name = "LoginServlet", urlPatterns = {"/login_s"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        switch (req.getParameter("action")) {
            case "in":
                try {
                    Class.forName(DRIVER);
                    try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
                         CallableStatement statement = connection.prepareCall("{call user_authorisation(?, ?, ?, ?, ?)}")) {

                        String userLogin = req.getParameter("login");
                        String userPassword = req.getParameter("password");

                        statement.setString(1, userLogin);
                        statement.setString(2, userPassword);
                        statement.registerOutParameter(3, Types.INTEGER);
                        statement.registerOutParameter(4, Types.INTEGER);
                        statement.registerOutParameter(5, Types.VARCHAR);

                        statement.executeQuery();

                        String authorizationStatus = (String) statement.getObject(5);


                        if ("Successful authorisation".equals(authorizationStatus)) {
                            int isMainDoctor = (int) statement.getObject(3);
                            int isDoctor = (int) statement.getObject(4);

                            HttpSession session = req.getSession();
                            if (isDoctor > 0) {
                                session.setAttribute("user_role", "d");
                            } else if (isMainDoctor > 0) {
                                session.setAttribute("user_role", "m");
                            } else {
                                session.setAttribute("user_role", "u");
                            }
                            session.setAttribute("login", userLogin);
//                            session.setAttribute("password", userPassword);
                            getServletContext().getRequestDispatcher("/home.jsp").forward(req, resp);
                        } else {
                            req.setAttribute("error_msg", authorizationStatus);
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
                getServletContext().getRequestDispatcher("/login.jsp").forward(req, resp);
                break;
            default:
                getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }
}
