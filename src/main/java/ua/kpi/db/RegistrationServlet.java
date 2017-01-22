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
 * Created by Valeria on 20.01.2017.
 */
@WebServlet(name = "RegistrationServlet", urlPatterns = {"/registration_s"})
public class RegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Class.forName(DRIVER);
            try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
                 CallableStatement statement = connection.prepareCall("{call user_registration(?, ?, ?, ?, ?, ?)}")) {

                String userName = req.getParameter("name");
                String userSurname = req.getParameter("surname");
                String userLogin = req.getParameter("login");
                String userPassword = req.getParameter("password");
                String userPasswordConfirm = req.getParameter("passwordConfirm");

                statement.setString(1, userName);
                statement.setString(2, userSurname);
                statement.setString(3, userLogin);
                statement.setString(4, userPassword);
                statement.setString(5, userPasswordConfirm);

                statement.registerOutParameter(6, Types.VARCHAR);

                statement.executeQuery();

                String registrationStatus = (String) statement.getObject(6);

                if ("Successful registration".equals(registrationStatus)) {
                    HttpSession session = req.getSession();
                    session.setAttribute("login", userLogin);
                    getServletContext().getRequestDispatcher("/home.jsp").forward(req, resp);
                } else {
                    req.setAttribute("error_msg", registrationStatus);
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
