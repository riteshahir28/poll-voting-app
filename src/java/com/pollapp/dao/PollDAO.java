package com.pollapp.dao;

import com.pollapp.model.poll;
import com.pollapp.model.Option;
import java.sql.*;
import java.util.*;

public class PollDAO {
    private Connection con;

    public PollDAO(Connection con) {
     this.con=con;
    }
    public PollDAO(){}

    // Create Poll
 // Create poll and insert its options in one transaction
public boolean createPollWithOptions(poll poll, List<String> options) {
    boolean success = false;
    try {
        con.setAutoCommit(false); // transaction start

        // Step 1: Insert poll
        String pollSql = "INSERT INTO polls(question, closing_time, status) VALUES (?, ?, ?)";
        PreparedStatement pollStmt = con.prepareStatement(pollSql, Statement.RETURN_GENERATED_KEYS);
        pollStmt.setString(1, poll.getQuestion());
        pollStmt.setTimestamp(2, Timestamp.valueOf(poll.getClosingTime()));
        pollStmt.setString(3, poll.getStatus());
        pollStmt.executeUpdate();

        ResultSet rs = pollStmt.getGeneratedKeys();
        int pollId = -1;
        if (rs.next()) {
            pollId = rs.getInt(1);
        } else {
            con.rollback();
            return false;
        }

        // Step 2: Insert options for poll
        String optionSql = "INSERT INTO options(poll_id, option_text) VALUES (?, ?)";
        PreparedStatement optionStmt = con.prepareStatement(optionSql);
        for (String opt : options) {
            if (opt != null && !opt.trim().isEmpty()) {
                optionStmt.setInt(1, pollId);
                optionStmt.setString(2, opt.trim());
                optionStmt.addBatch();
            }
        }
        optionStmt.executeBatch();

        con.commit(); // transaction commit
        success = true;

    } catch (Exception e) {
        try {
            con.rollback(); // rollback on failure
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        e.printStackTrace();
    } finally {
        try {
            con.setAutoCommit(true); // restore auto commit
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    return success;
}


    // Insert options for poll
    public void insertOptions(int pollId, List<String> options) {
        String sql = "INSERT INTO options(poll_id, option_text) VALUES (?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            for (String opt : options) {
                if (opt != null && !opt.trim().isEmpty()) {
                    ps.setInt(1, pollId);
                    ps.setString(2, opt);
                    ps.addBatch();
                }
            }
            ps.executeBatch();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Get all polls
    public List<poll> getAllPolls() {
        List<poll> list = new ArrayList<>();
        String sql = "SELECT * FROM polls ORDER BY id DESC";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
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

    // Close poll
    public void closePoll(int pollId) {
        String sql = "UPDATE polls SET status='closed' WHERE id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, pollId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Delete poll
    public void deletePoll(int pollId) {
        String sql = "DELETE FROM polls WHERE id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, pollId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Get poll by ID
    public poll getPollById(int pollId) {
        poll p = null;
        String sql = "SELECT * FROM polls WHERE id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, pollId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new poll();
                p.setId(rs.getInt("id"));
                p.setQuestion(rs.getString("question"));
                p.setClosingTime(rs.getTimestamp("closing_time").toLocalDateTime());
                p.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }
    
    public void updatePoll(poll p) {
    String sql = "UPDATE polls SET question = ?, closing_time = ? WHERE id = ?";
    try {
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, p.getQuestion());
        ps.setTimestamp(2, Timestamp.valueOf(p.getClosingTime()));
        ps.setInt(3, p.getId());
        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

    // Get only open polls
public List<poll> getOpenPolls() {
    List<poll> list = new ArrayList<>();
    String sql = "SELECT * FROM polls WHERE status = 'open' ORDER BY id DESC";

    try {
        PreparedStatement ps = con.prepareStatement(sql);
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


// Get all options for a poll by pollId
public List<String> getOptionsByPollId(int pollId) {
    List<String> options = new ArrayList<>();
    String sql = "SELECT option_text FROM options WHERE poll_id = ?";
    try {
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, pollId);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            options.add(rs.getString("option_text"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return options;
}

public List<Option> getOptionObjectsByPollId(int pollId) {
    List<Option> list = new ArrayList<>();
    String sql = "SELECT * FROM options WHERE poll_id=?";
    try {
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, pollId);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Option opt = new Option();
            opt.setId(rs.getInt("id"));
            opt.setOptionText(rs.getString("option_text"));
            list.add(opt);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}


}
