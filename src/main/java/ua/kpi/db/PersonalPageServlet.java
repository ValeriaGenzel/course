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

@WebServlet(name = "PersonalPageServlet", urlPatterns = "/personal_page")
public class PersonalPageServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        final String info = req.getParameter("info");

        switch (info) {
            case "get":
                getPersonalInfo(req, resp);
                break;
            case "update":
                updatePersonalInfo(req, resp);
                break;
            default:
                getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
                break;
        }
    }


    private void updatePersonalInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        try{
            Class.forName(DRIVER);

            try(Connection connection = DriverManager.getConnection(URL,USER,PASSWORD)){
            CallableStatement statement=connection.prepareCall("{call user_editing_profile(?, ?, ?, ?, ?, ?, ?, ?, ?)}");

                String userLogin=req.getParameter("login");
                String userPasswordOld=req.getParameter("passwordOld");
                String userName=req.getParameter("name");
                String userSurname=req.getParameter("surname");
                String userPassword=req.getParameter("password");
                String userPasswordConfirm=req.getParameter("passwordConfirm");
                String userEmail=req.getParameter("email");
                String userTel=req.getParameter("tel");

                statement.setString(1,userLogin);
                statement.setString(2,userPasswordOld);
                statement.setString(3,userName);
                statement.setString(4,userSurname);
                statement.setString(5,userPassword);
                statement.setString(6,userPasswordConfirm);
                statement.setString(7,userEmail);
                statement.setString(8,userTel);

                statement.registerOutParameter(9,Types.VARCHAR);

                statement.executeQuery();
                final String editingStatus = (String) statement.getObject(9);

                if("Successful editing".equals(editingStatus)){
                    getPersonalInfo(req, resp);
                    statement.close();
                } else {
                    statement.close();
                    req.setAttribute("problem", editingStatus);
                    getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
                }
            } catch (SQLException e) {
                    e.printStackTrace();
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
    }

    private void getPersonalInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        final String userLogin = (String) session.getAttribute("login");
        try {
            Class.forName(DRIVER);

            try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
                PreparedStatement statement = connection.prepareStatement("select * from personal_page_view");

                statement.executeQuery();

                ResultSet resultSet = statement.getResultSet();
                if (resultSet.next()) {

                req.setAttribute("login", resultSet.getString(1));
                req.setAttribute("name", resultSet.getString(2));
                req.setAttribute("surname", resultSet.getString(3));
                req.setAttribute("password", resultSet.getString(4));

                req.setAttribute("email", resultSet.getString(5));
                req.setAttribute("tel", resultSet.getString(6));
                req.setAttribute("spec", resultSet.getString(7));

                    statement.close();
                    getServletContext().getRequestDispatcher("/personal_page.jsp").forward(req, resp);
                } else {
                    req.setAttribute("error", "failed to get personal data");
                    statement.close();
                    getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

}

