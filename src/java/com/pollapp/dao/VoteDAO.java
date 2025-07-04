package com.pollapp.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.pollapp.model.poll;
import java.util.*;

public class VoteDAO {
    private Connection con;

    public VoteDAO(Connection con) {
        this.con = con;
    }

    // Check if user has already voted in this poll
    public boolean hasUserVoted(int userId, int pollId) {
        String sql = "SELECT * FROM votes WHERE user_id = ? AND poll_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, pollId);
            ResultSet rs = ps.executeQuery();
            return rs.next();  // true if record found
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Save user vote
    public boolean saveVote(int userId, int pollId, int optionId) {
        String sql = "INSERT INTO votes(user_id, poll_id, option_id) VALUES (?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, pollId);
            ps.setInt(3, optionId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get list of closed polls that user has voted in
    public List<poll> getClosedPollsVotedByUser(int userId) {
        List<poll> list = new ArrayList<>();
        String sql = "SELECT p.* FROM polls p INNER JOIN votes v ON p.id = v.poll_id " +
                     "WHERE v.user_id = ? AND p.status = 'closed'";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                poll p = new poll();
                p.setId(rs.getInt("id"));
                p.setQuestion(rs.getString("question"));
                p.setClosingTime(rs.getTimestamp("closing_time").toLocalDateTime());
                p.setStatus(rs.getString("status"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    // Get vote count for each option in poll
public Map<Integer, Integer> getVoteCountByPollId(int pollId) {
    Map<Integer, Integer> map = new HashMap<>();
    String sql = "SELECT option_id, COUNT(*) as count FROM votes WHERE poll_id = ? GROUP BY option_id";
    try (PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, pollId);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            map.put(rs.getInt("option_id"), rs.getInt("count"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return map;
}

// Get total votes on a poll
public int getTotalVotesByPollId(int pollId) {
    int total = 0;
    String sql = "SELECT COUNT(*) FROM votes WHERE poll_id = ?";
    try (PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, pollId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            total = rs.getInt(1);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return total;
}

}
