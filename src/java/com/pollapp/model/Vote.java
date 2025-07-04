package com.pollapp.model;

public class Vote {
    private int id;
    private int userId;
    private int pollId;
    private int optionId;

    public Vote() {}

    public Vote(int userId, int pollId, int optionId) {
        this.userId = userId;
        this.pollId = pollId;
        this.optionId = optionId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPollId() {
        return pollId;
    }

    public void setPollId(int pollId) {
        this.pollId = pollId;
    }

    public int getOptionId() {
        return optionId;
    }

    public void setOptionId(int optionId) {
        this.optionId = optionId;
    }
}
