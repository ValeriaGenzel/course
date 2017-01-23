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

@WebServlet(name = "AddRecordServlet", urlPatterns = {"/add_record_s"})
public class AddRecordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Class.forName(DRIVER);
            try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
                 CallableStatement statement = connection.prepareCall("{call create_new_record(?, ?, ?, ?, ?, ?, ?)}")) {

                String doctorLogin = (String) req.getSession().getAttribute("login");
//                String mainDoctorPassword = (String) req.getSession().getAttribute("password");

                String doctorPassword = req.getParameter("password");
                String userLogin = req.getParameter("uLogin");

                System.out.println(userLogin);

                String diseaseName = req.getParameter("dName");
                String hospitalBegin = req.getParameter("hBegin");
                String hospitalEnd = req.getParameter("hEnd");

                statement.setString(1, doctorLogin);
                statement.setString(2, doctorPassword);

                statement.setString(3, userLogin);
                statement.setString(4, diseaseName);
                statement.setString(5, hospitalBegin);
                statement.setString(6, hospitalEnd);

                statement.registerOutParameter(7, Types.VARCHAR);

                statement.executeQuery();

                String addingStatus = (String) statement.getObject(7);

                if ("Successful added".equals(addingStatus)) {

                    HttpSession session = req.getSession();
                    session.setAttribute("login", doctorLogin);
                    //session.setAttribute("password", mainDoctorPassword);
                    getServletContext().getRequestDispatcher("/view_history").forward(req, resp);
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
