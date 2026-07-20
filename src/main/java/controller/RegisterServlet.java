package controller;

import dao.UserDAO;
import model.User;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import jakarta.servlet.annotation.WebServlet;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        User user = new User();

        user.setFullName(request.getParameter("fullName"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));
        user.setPhone(request.getParameter("phone"));
        user.setCity(request.getParameter("city"));
        user.setRole(request.getParameter("role"));

        UserDAO dao = new UserDAO();

        System.out.println("Full Name : " + user.getFullName());
        System.out.println("Email     : " + user.getEmail());
        System.out.println("Password  : " + user.getPassword());
        System.out.println("Phone     : " + user.getPhone());
        System.out.println("City      : " + user.getCity());
        System.out.println("Role      : " + user.getRole());

        boolean status = dao.registerUser(user);

        System.out.println("Status = " + status);

        if (status) {
            response.sendRedirect("login.jsp");
        } else {
        	response.setContentType("text/html");
        	response.getWriter().println("<h2>Registration Failed</h2>");
        	response.getWriter().println("<p>Please check the Eclipse Console for the exact error.</p>");
        }

    }

}