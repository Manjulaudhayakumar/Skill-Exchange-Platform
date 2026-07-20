package controller;

import java.io.IOException;

import dao.SkillDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Skill;
import model.User;

@WebServlet("/AddSkillServlet")
public class AddSkillServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form values
        String skillName = request.getParameter("skillName");
        String category = request.getParameter("category");
        String experienceLevel = request.getParameter("experienceLevel");
        String description = request.getParameter("description");

        // Get logged in user
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Create Skill object
        Skill skill = new Skill();

        skill.setUserId(user.getId()); // Change to getUserId() if that's what your User class has
        skill.setSkillName(skillName);
        skill.setCategory(category);
        skill.setExperienceLevel(experienceLevel);
        skill.setDescription(description);

        // Save to database
        SkillDAO dao = new SkillDAO();

        boolean result = dao.addSkill(skill);

        System.out.println("Result = " + result);

        if (result) {

            response.sendRedirect("viewSkills.jsp");

        } else {

            response.getWriter().println("Skill Not Added");

        }
    }
}