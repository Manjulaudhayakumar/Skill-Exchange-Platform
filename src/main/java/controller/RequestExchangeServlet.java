package controller;

import java.io.IOException;

import dao.ExchangeRequestDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.ExchangeRequest;
import model.User;

@WebServlet("/RequestExchangeServlet")
public class RequestExchangeServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("user");

		int senderId = user.getId();

		int receiverId = Integer.parseInt(request.getParameter("receiverId"));

		int skillId = Integer.parseInt(request.getParameter("skillId"));

		String message = request.getParameter("message");

		ExchangeRequest exchange = new ExchangeRequest();

		exchange.setSenderId(senderId);

		exchange.setReceiverId(receiverId);

		exchange.setSkillId(skillId);

		exchange.setMessage(message);

		exchange.setStatus("Pending");

		ExchangeRequestDAO dao = new ExchangeRequestDAO();

		if (dao.sendRequest(exchange)) {

			response.sendRedirect("browseSkills.jsp");

		} else {

			response.getWriter().println("Request Failed");

		}

	}

}