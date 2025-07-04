package com.pollapp.model;

import java.time.LocalDateTime;

public class poll {
    private int id;
    private String question;
    private LocalDateTime closingTime;
    private String status; // open or closed

    public poll() {
    }

    public poll(String question, LocalDateTime closingTime, String status) {
        this.question = question;
        this.closingTime = closingTime;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public LocalDateTime getClosingTime() {
        return closingTime;
    }

    public void setClosingTime(LocalDateTime closingTime) {
        this.closingTime = closingTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
