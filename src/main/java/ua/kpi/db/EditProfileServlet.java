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


@WebServlet(name = "EditProfileServlet", urlPatterns = {"/edit_profile_s"})
public class EditProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        switch (req.getParameter("action")) {
            case "in":
                try {
                    Class.forName(DRIVER);
                    try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
                         CallableStatement statement = connection.prepareCall("{call user_editing_profile(?, ?, ?, ?, ?, ?, ?, ?, ?)}")) {

                        String userLogin = req.getParameter("login");
                        String userPasswordOld = req.getParameter("passwordOld");
                        String userName = req.getParameter("name");
                        String userSurname = req.getParameter("surname");
                        String userPassword = req.getParameter("password");
                        String userPasswordConfirm = req.getParameter("passwordConfirm");
                        String userEmail = req.getParameter("email");
                        String userTel = req.getParameter("tel");

                        statement.setString(1, userLogin);
                        statement.setString(2, userPasswordOld);
                        statement.setString(3,userName);
                        statement.setString(4, userSurname);
                        statement.setString(5, userPassword);
                        statement.setString(6, userPasswordConfirm);
                        statement.setString(7, userEmail);
                        statement.setString(8, userTel);

                        statement.registerOutParameter(9, Types.VARCHAR);

                        statement.executeQuery();

                        String editingStatus = (String) statement.getObject(9);

                        if ("Successful editing".equals(editingStatus)) {
                            HttpSession session = req.getSession();
                            getServletContext().getRequestDispatcher("/editProfile.jsp").forward(req, resp);
                        } else {
                            req.setAttribute("error_msg", editingStatus);
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
