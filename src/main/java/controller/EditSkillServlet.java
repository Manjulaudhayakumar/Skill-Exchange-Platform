package controller;

import java.io.IOException;

import dao.SkillDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Skill;

@WebServlet("/EditSkillServlet")
public class EditSkillServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int skillId = Integer.parseInt(request.getParameter("skillId"));
		String skillName = request.getParameter("skillName");
		String category = request.getParameter("category");
		String experienceLevel = request.getParameter("experienceLevel");
		String description = request.getParameter("description");

		Skill skill = new Skill();

		skill.setSkillId(skillId);
		skill.setSkillName(skillName);
		skill.setCategory(category);
		skill.setExperienceLevel(experienceLevel);
		skill.setDescription(description);

		SkillDAO dao = new SkillDAO();

		if (dao.updateSkill(skill)) {

			response.sendRedirect("viewSkills.jsp");

		} else {

			response.getWriter().println("Update Failed");

		}

	}

}