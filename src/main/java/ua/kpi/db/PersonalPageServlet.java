//package ua.kpi.db;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//import java.sql.*;
//import java.util.ArrayList;
//import java.util.List;
//
//import static ua.kpi.db.ConnectionParams.*;
//
//@WebServlet(name = "PersonalPageServlet", urlPatterns = "/personal_page")
//public class PersonalPageServlet extends HttpServlet {
//
//    protected void  doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
//        HttpSession session = req.getSession();
//        final String userLogin = (String) session.getAttribute("user_login");
//        switch (req.getParameter("personalInfo")){
//            case "get":
//                try {
//                    Class.forName(DRIVER);
//                    try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
//                         PreparedStatement statement = connection.prepareStatement("select * from personal_page_view")) {
//                        statement.executeQuery();
//
//                        ResultSet resultSet = statement.getResultSet();
//
//                        List<String[]> personalList = new ArrayList<>();
//                        while (resultSet.next()) {
//                            String[] entry = new String[]{
//                                    resultSet.getString("u_login"),
//                                    resultSet.getString("u_name"),
//                                    resultSet.getString("u_surname"),
//                                    resultSet.getString("u_email"),
//                                    resultSet.getString("u_tel"),
//                                    resultSet.getString("doctors_speciality")};
//
//                            personalList.add(entry);
//                        }
//                        req.setAttribute("personalList", personalList);
//                        getServletContext().getRequestDispatcher("/editProfile.jsp").forward(req, resp);
//                    } catch (SQLException e) {
//                        e.printStackTrace();
//                        getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
//                    }
//                } catch (ClassNotFoundException e) {
//                    e.printStackTrace();
//                    getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
//                }
//                break;
//            case "update":
//                try {
//                    Class.forName(DRIVER);
//                    try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
//                         CallableStatement statement = connection.prepareCall(
//                                 "{call user_editing_profile(?, ?, ?, ?, ?, ?, ?, ?, ?)}")) {
//
//                        String userLogin = req.getParameter("login");
//                        String userPasswordOld = req.getParameter("passwordOld");
//                        String userName = req.getParameter("name");
//                        String userSurname = req.getParameter("surname");
//                        String userPassword = req.getParameter("password");
//                        String userPasswordConfirm = req.getParameter("passwordConfirm");
//                        String userEmail = req.getParameter("email");
//                        String userTel = req.getParameter("tel");
//
//                        statement.setString(1, userLogin);
//                        statement.setString(2, userPasswordOld);
//                        statement.setString(3,userName);
//                        statement.setString(4, userSurname);
//                        statement.setString(5, userPassword);
//                        statement.setString(6, userPasswordConfirm);
//                        statement.setString(7, userEmail);
//                        statement.setString(8, userTel);
//
//                        statement.registerOutParameter(9, Types.VARCHAR);
//
//                        statement.executeQuery();
//
//                        String editingStatus = (String) statement.getObject(9);
//
//                        if ("Successful editing".equals(editingStatus)) {
//                            HttpSession session = req.getSession();
//                            getServletContext().getRequestDispatcher("/editProfile.jsp").forward(req, resp);
//                        } else {
//                            req.setAttribute("error_msg", editingStatus);
//                            getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
//                        }
//                    } catch (SQLException e) {
//                        e.printStackTrace();
//                        getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
//                    }
//                } catch (ClassNotFoundException e) {
//                    e.printStackTrace();
//                    getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
//                }
//        }
//    }
//}
