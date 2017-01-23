package ua.kpi.db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static ua.kpi.db.ConnectionParams.*;

@WebServlet(name = "ViewDiseaseHistServlet", urlPatterns = {"/view_history"})
public class ViewDiseaseHistServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName(DRIVER);
            HttpSession session = request.getSession();
            String uLogin = (String) session.getAttribute("login");
            String query = "select * from disease_history_viewing";
            String whereUser = " where u_login = '" + uLogin + "'";
            if (session.getAttribute("user_role").equals("u")) {
                query = query + whereUser;
            }
            try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement statement = connection.prepareStatement(query)) {
                statement.executeQuery();

                ResultSet resultSet = statement.getResultSet();
                List<String[]> history = new ArrayList<>();
                while (resultSet.next()) {
                    String[] entry = new String[]{
                            resultSet.getString("RECORD_DATE"),
                            resultSet.getString("DISEASE_NAME"),
                            resultSet.getString("DOCTORS_SPECIALITY"),
                            resultSet.getString("HOSPITAL_BEGIN"),
                            resultSet.getString("HOSPITAL_END"),
                            resultSet.getString("u_login"),
                    };
                    history.add(entry);
                }
                System.out.println(history);
                request.setAttribute("historyList", history);
                getServletContext().getRequestDispatcher("/diseaseHistory.jsp").forward(request, response);
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
