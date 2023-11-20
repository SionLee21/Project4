package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MariaDBConnection {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mariadb://walab.handong.edu:3306/p233_22200538", "p233_22200538", "moiv0O");
        } catch (ClassNotFoundException e) {
            System.err.println("드라이버 로드 오류!");
            e.printStackTrace(); // Log this exception using a logging framework
            throw new RuntimeException(e);
        } catch (SQLException e) {
            System.err.println("DB연결 오류!!!");
            e.printStackTrace(); // Log this exception using a logging framework
            throw new RuntimeException(e);
        }

        return conn;
    }

    public static void main(String[] args) {
        try (Connection conn = MariaDBConnection.getConnection()) {
            if (conn != null)
                System.out.println("DB연결됨!");
            else
                System.out.println("DB연결 오류!");
        } catch (Exception e) {
            System.err.println("예외 발생: " + e.getMessage());
            e.printStackTrace(); // Log this exception using a logging framework
        }
    }
}
