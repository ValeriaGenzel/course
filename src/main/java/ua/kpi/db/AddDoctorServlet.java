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

@WebServlet(name = "AddDoctorServlet", urlPatterns = {"/add_doctor_s"})
public class AddDoctorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Class.forName(DRIVER);
            try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
                 CallableStatement statement = connection.prepareCall("{call add_new_doctor(?, ?, ?, ?, ?, ?, ?, ?, ?)}")) {

                String mainDoctorLogin = (String) req.getSession().getAttribute("login");
//                String mainDoctorPassword = (String) req.getSession().getAttribute("password");

                String mainDoctorPassword = req.getParameter("password");
                String doctorLogin = req.getParameter("dLogin");
                String doctorPassword = req.getParameter("dPassword");
                String doctorName = req.getParameter("dName");
                String doctorSurname = req.getParameter("dSurname");
                String doctorEmail = req.getParameter("doctorEmail");
                String doctorSpeciality = req.getParameter("dSpeciality");

                statement.setString(1, mainDoctorLogin);
                statement.setString(2, mainDoctorPassword);

                statement.setString(3, doctorLogin);
                statement.setString(4, doctorPassword);
                statement.setString(5, doctorName);
                statement.setString(6, doctorSurname);
                statement.setString(7, doctorEmail);
                statement.setString(8, doctorSpeciality);

                statement.registerOutParameter(9, Types.VARCHAR);

                statement.executeQuery();

                String addingStatus = (String) statement.getObject(9);

                if ("Successful adding".equals(addingStatus)) {

                    HttpSession session = req.getSession();
                    session.setAttribute("login", mainDoctorLogin);
                    //session.setAttribute("password", mainDoctorPassword);
                    getServletContext().getRequestDispatcher("/view_doctors").forward(req, resp);
                } else {
                    req.setAttribute("error_msg", addingStatus);
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
