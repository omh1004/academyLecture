package com.univora.common.alert.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Notification {
    private String id;
    private String userId;
    private String type;
    private String content;
    private boolean isRead;
    private Timestamp createdAt;
    private String rnum;
}