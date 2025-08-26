package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
    private static Connection conn;

    /**
     * Gets a database connection
     * @return Connection object
     */
    public static Connection getConn() {
        try {
            if (conn == null || conn.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/eblog?createDatabaseIfNotExist=true";
                conn = DriverManager.getConnection(url, "root", "");
                System.out.println("Database connection established successfully");

                // Create tables if they don't exist
                createTablesIfNotExist(conn);
            }
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found: " + e.getMessage());
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Database connection error: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("Unexpected error: " + e.getMessage());
            e.printStackTrace();
        }
        return conn;
    }

    /**
     * Creates required tables if they don't exist
     * @param conn Database connection
     */
    private static void createTablesIfNotExist(Connection conn) {
        try {
            java.sql.Statement stmt = conn.createStatement();

            // Create users table
            String createUsersTable = "CREATE TABLE IF NOT EXISTS users (" +
                    "id INT AUTO_INCREMENT PRIMARY KEY, " +
                    "fname VARCHAR(50) NOT NULL, " +
                    "lname VARCHAR(50) NOT NULL, " +
                    "username VARCHAR(50) UNIQUE NOT NULL, " +
                    "email VARCHAR(100) UNIQUE NOT NULL, " +
                    "password VARCHAR(100) NOT NULL, " +
                    "registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP)";
            stmt.execute(createUsersTable);

            // Create posts table
            String createPostsTable = "CREATE TABLE IF NOT EXISTS posts (" +
                    "id INT AUTO_INCREMENT PRIMARY KEY, " +
                    "title VARCHAR(255) NOT NULL, " +
                    "content TEXT NOT NULL, " +
                    "author VARCHAR(50) NOT NULL, " +
                    "category VARCHAR(50) NOT NULL, " +
                    "pdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP, " +
                    "imgUrl VARCHAR(255), " +
                    "likes INT DEFAULT 0)";
            stmt.execute(createPostsTable);

            // Insert test data if no data exists
            String countUsers = "SELECT COUNT(*) FROM users";
            java.sql.ResultSet rs = stmt.executeQuery(countUsers);
            rs.next();
            int userCount = rs.getInt(1);

            if (userCount == 0) {
                // Insert test user
                String insertTestUser = "INSERT INTO users (fname, lname, username, email, password) " +
                        "VALUES ('Test', 'User', 'testuser', 'test@example.com', 'password')";
                stmt.execute(insertTestUser);

                // Insert test blog
                String insertTestBlog = "INSERT INTO posts (title, content, author, category, imgUrl) " +
                        "VALUES ('Welcome to Eblogs', 'This is a sample blog post. Start creating your own blogs!', " +
                        "'testuser', 'Technology', 'https://via.placeholder.com/800x400?text=Welcome+to+Eblogs')";
                stmt.execute(insertTestBlog);

                System.out.println("Test data inserted successfully");
            }

            stmt.close();
        } catch (SQLException e) {
            System.err.println("Error creating tables: " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * Closes the database connection
     */
    public static void closeConnection() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
                System.out.println("Database connection closed successfully");
            }
        } catch (SQLException e) {
            System.err.println("Error closing database connection: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
