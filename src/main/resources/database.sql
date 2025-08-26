-- Create the database
CREATE DATABASE IF NOT EXISTS eblog;

USE eblog;

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Posts table
CREATE TABLE IF NOT EXISTS posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    author VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    pdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    imgUrl VARCHAR(255),
    FOREIGN KEY (author) REFERENCES users(username) ON DELETE CASCADE
);

-- Sample data for testing
-- Insert sample users
INSERT INTO users (fname, lname, username, email, password) VALUES
('John', 'Doe', 'johndoe', 'john@example.com', 'password123'),
('Jane', 'Smith', 'janesmith', 'jane@example.com', 'password123'),
('Test', 'User', 'testuser', 'test@example.com', 'password');

-- Insert sample blog posts
INSERT INTO posts (title, content, author, category, imgUrl) VALUES
('Getting Started with Java', 'Java is a programming language and computing platform first released by Sun Microsystems in 1995...', 'johndoe', 'Programming', 'https://example.com/java.jpg'),
('10 Tips for Healthy Living', 'Maintaining good health is crucial for a happy life. Here are some tips to help you stay healthy...', 'janesmith', 'Health and Wellness', 'https://example.com/health.jpg'),
('The Future of AI', 'Artificial Intelligence is rapidly evolving and changing the way we live and work...', 'testuser', 'Technology', 'https://example.com/ai.jpg'),
('Financial Planning 101', 'Everyone needs to plan their finances for a secure future. Here are some basic tips...', 'johndoe', 'Finance', 'https://example.com/finance.jpg'),
('Meditation for Beginners', 'Meditation can help reduce stress and improve mental clarity. Here's how to get started...', 'janesmith', 'Self Improvement', 'https://example.com/meditation.jpg');
