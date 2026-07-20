package controller;

import java.io.IOException;

import dao.SkillDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteSkillServlet")
public class DeleteSkillServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int skillId = Integer.parseInt(request.getParameter("skillId"));

		SkillDAO dao = new SkillDAO();

		if (dao.deleteSkill(skillId)) {

			response.sendRedirect("viewSkills.jsp");

		} else {

			response.getWriter().println("Delete Failed");

		}

	}

}