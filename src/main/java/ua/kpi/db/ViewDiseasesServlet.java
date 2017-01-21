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

@WebServlet(name = "ViewDiseasesServlet", urlPatterns = {"/view_diseases"})
public class ViewDiseasesServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName(DRIVER);
            try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement statement = connection.prepareStatement("select * from diseases_viewing")) {
                statement.executeQuery();

                ResultSet resultSet = statement.getResultSet();

                List<String[]> diseases = new ArrayList<>();
                while (resultSet.next()) {
                    String[] entry = new String[]{
                            resultSet.getString("disease_name"),
                            resultSet.getString("simptom_name"),
                            resultSet.getString("disease_description")};
                            diseases.add(entry);
                }
                request.setAttribute("diseaseList", diseases);
                getServletContext().getRequestDispatcher("/diseases.jsp").forward(request, response);
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
