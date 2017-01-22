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

@WebServlet(name = "ViewPatientServlet", urlPatterns = {"/view_patients"})
public class ViewPatientServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName(DRIVER);
            try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement statement = connection.prepareStatement("select * from patient_viewing")) {
                statement.executeQuery();

                ResultSet resultSet = statement.getResultSet();

                List<String[]> patient = new ArrayList<>();
                while (resultSet.next()) {
                    String[] entry = new String[]{
                            resultSet.getString("u_name"),
                            resultSet.getString("u_surname"),
                            resultSet.getString("u_email"),
                            resultSet.getString("u_login"),
                            resultSet.getString("u_role")};
                    patient.add(entry);
                }
                request.setAttribute("patientList", patient);
                getServletContext().getRequestDispatcher("/patients.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

}
