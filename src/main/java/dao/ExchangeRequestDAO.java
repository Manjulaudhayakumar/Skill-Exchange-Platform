package dao;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;


import db.DBConnection;
import model.ExchangeRequest;

public class ExchangeRequestDAO {

	Connection con = DBConnection.getConnection();

	public boolean sendRequest(ExchangeRequest request) {

		boolean status = false;

		try {

			String sql = "INSERT INTO exchange_requests(sender_id,receiver_id,skill_id,message,status) VALUES(?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, request.getSenderId());
			ps.setInt(2, request.getReceiverId());
			ps.setInt(3, request.getSkillId());
			ps.setString(4, request.getMessage());
			ps.setString(5, request.getStatus());

			int row = ps.executeUpdate();

			if (row > 0) {

				status = true;

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return status;

	}
	public ArrayList<ExchangeRequest> getMyRequests(int senderId) {

	    ArrayList<ExchangeRequest> list = new ArrayList<>();

	    try {

	        String sql = "SELECT * FROM exchange_requests WHERE sender_id=?";

	        PreparedStatement ps = con.prepareStatement(sql);

	        ps.setInt(1, senderId);

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {

	            ExchangeRequest request = new ExchangeRequest();

	            request.setRequestId(rs.getInt("request_id"));
	            request.setSenderId(rs.getInt("sender_id"));
	            request.setReceiverId(rs.getInt("receiver_id"));
	            request.setSkillId(rs.getInt("skill_id"));
	            request.setMessage(rs.getString("message"));
	            request.setStatus(rs.getString("status"));

	            list.add(request);

	        }

	    } catch (Exception e) {

	        e.printStackTrace();

	    }

	    return list;

	}
	public ArrayList<ExchangeRequest> getReceivedRequests(int receiverId) {

	    ArrayList<ExchangeRequest> list = new ArrayList<>();

	    try {

	        String sql = "SELECT * FROM exchange_requests WHERE receiver_id=?";

	        PreparedStatement ps = con.prepareStatement(sql);

	        ps.setInt(1, receiverId);

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {

	            ExchangeRequest exchange = new ExchangeRequest();

	            exchange.setRequestId(rs.getInt("request_id"));
	            exchange.setSenderId(rs.getInt("sender_id"));
	            exchange.setReceiverId(rs.getInt("receiver_id"));
	            exchange.setSkillId(rs.getInt("skill_id"));
	            exchange.setMessage(rs.getString("message"));
	            exchange.setStatus(rs.getString("status"));

	            list.add(exchange);

	        }

	    } catch (Exception e) {

	        e.printStackTrace();

	    }

	    return list;

	}
	public boolean updateRequestStatus(int requestId, String status) {

	    boolean result = false;

	    try {

	        String sql = "UPDATE exchange_requests SET status=? WHERE request_id=?";

	        PreparedStatement ps = con.prepareStatement(sql);

	        ps.setString(1, status);
	        ps.setInt(2, requestId);

	        int row = ps.executeUpdate();

	        if (row > 0) {

	            result = true;

	        }

	    } catch (Exception e) {

	        e.printStackTrace();

	    }

	    return result;
	}

}