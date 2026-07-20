package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DBConnection;
import model.Skill;

public class SkillDAO {

    Connection con = DBConnection.getConnection();

    public boolean addSkill(Skill skill) {

        boolean status = false;

        try {

            String sql = "INSERT INTO skills(user_id, skill_name, category, experience_level, description) VALUES(?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, skill.getUserId());
            ps.setString(2, skill.getSkillName());
            ps.setString(3, skill.getCategory());
            ps.setString(4, skill.getExperienceLevel());
            ps.setString(5, skill.getDescription());

            int row = ps.executeUpdate();

            if (row > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public ArrayList<Skill> getAllSkills() {

        ArrayList<Skill> list = new ArrayList<>();

        try {

            String sql = "SELECT * FROM skills";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Skill skill = new Skill();

                skill.setSkillId(rs.getInt("skill_id"));
                skill.setUserId(rs.getInt("user_id"));
                skill.setSkillName(rs.getString("skill_name"));
                skill.setCategory(rs.getString("category"));
                skill.setExperienceLevel(rs.getString("experience_level"));
                skill.setDescription(rs.getString("description"));

                list.add(skill);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public Skill getSkillById(int id) {

        Skill skill = null;

        try {

            String sql = "SELECT * FROM skills WHERE skill_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                skill = new Skill();

                skill.setSkillId(rs.getInt("skill_id"));
                skill.setUserId(rs.getInt("user_id"));
                skill.setSkillName(rs.getString("skill_name"));
                skill.setCategory(rs.getString("category"));
                skill.setExperienceLevel(rs.getString("experience_level"));
                skill.setDescription(rs.getString("description"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return skill;
    }
    public boolean updateSkill(Skill skill) {

        boolean status = false;

        try {

            String sql = "UPDATE skills SET skill_name=?, category=?, experience_level=?, description=? WHERE skill_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, skill.getSkillName());
            ps.setString(2, skill.getCategory());
            ps.setString(3, skill.getExperienceLevel());
            ps.setString(4, skill.getDescription());
            ps.setInt(5, skill.getSkillId());

            int row = ps.executeUpdate();

            if (row > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public boolean deleteSkill(int id) {

        boolean status = false;

        try {

            String sql = "DELETE FROM skills WHERE skill_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            int row = ps.executeUpdate();

            if (row > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public ArrayList<Skill> getAllSkillsForExchange() {

        ArrayList<Skill> list = new ArrayList<>();

        try {

            String sql = "SELECT * FROM skills";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Skill skill = new Skill();

                skill.setSkillId(rs.getInt("skill_id"));
                skill.setUserId(rs.getInt("user_id"));
                skill.setSkillName(rs.getString("skill_name"));
                skill.setCategory(rs.getString("category"));
                skill.setExperienceLevel(rs.getString("experience_level"));
                skill.setDescription(rs.getString("description"));

                list.add(skill);

            }

        } catch(Exception e) {

            e.printStackTrace();

        }

        return list;

    }
    public String getSkillNameById(int skillId) {

        String skillName = "";

        try {

            String sql = "SELECT skill_name FROM skills WHERE skill_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, skillId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                skillName = rs.getString("skill_name");

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return skillName;

    }
}
