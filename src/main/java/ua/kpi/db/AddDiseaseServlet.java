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
 * Created by Valeria on 21.01.2017.
 */

@WebServlet(name = "AddDiseaseServlet", urlPatterns = {"/add_disease_s"})
public class AddDiseaseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Class.forName(DRIVER);
            try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
                 CallableStatement statement = connection.prepareCall("{call add_new_disease(?, ?, ?, ?, ?, ?)}")) {

                String doctorLogin = (String) req.getSession().getAttribute("login");
                String doctorPassword = req.getParameter("password");
                String diseaseName = req.getParameter("dName");
                String simptomName = req.getParameter("sName");
                String description = req.getParameter("desc");

                statement.setString(1, doctorLogin);
                statement.setString(2, doctorPassword);
                statement.setString(3, diseaseName);
                statement.setString(4, simptomName);
                statement.setString(5, description);

                statement.registerOutParameter(6, Types.VARCHAR);

                statement.executeQuery();

                String addingStatus = (String) statement.getObject(6);

                if ("Successful adding".equals(addingStatus)) {

                    HttpSession session = req.getSession();
                    session.setAttribute("login", doctorLogin);

                    getServletContext().getRequestDispatcher("/view_diseases").forward(req, resp);
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

