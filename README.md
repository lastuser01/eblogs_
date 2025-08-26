# Eblogs - Blogging Platform

Eblogs is a simple and elegant blogging platform built with Java Servlets, JSP, and MySQL.

## Features

- User registration and authentication
- Create, read, update, and delete blog posts
- Filter blogs by category
- Responsive design
- User profiles

## Technology Stack

- Java 17
- Servlets & JSP
- MySQL Database
- Bootstrap 5 for frontend
- Font Awesome for icons

## Project Structure

```
src/main/
├── java/
│   └── com/
│       ├── DAO/          # Data Access Objects
│       │   ├── DBConnect.java
│       │   └── PostDAO.java
│       └── user/         # User-related classes
│           ├── Post.java
│           ├── UserDetails.java
│           └── Servlets...
└── webapp/
    ├── WEB-INF/
    │   └── web.xml      # Web deployment descriptor
    ├── all_component/   # Reusable components
    ├── css/            # Stylesheets
    └── JSP files...    # View pages
```

## Setup Instructions

### Prerequisites

- Java Development Kit (JDK) 17
- Apache Tomcat 9 or higher
- MySQL 8.0 or higher
- Maven

### Database Setup

1. Create a MySQL database named `eblog`
2. Run the SQL script in `src/main/resources/database.sql`

### Configuration

1. Update the database connection details in `com.DAO.DBConnect.java` if needed

### Running the Application

1. Build the project with Maven: `mvn clean package`
2. Deploy the WAR file to Tomcat
3. Access the application at: `http://localhost:8080/eblog`

## Usage

1. Register a new account
2. Log in with your credentials
3. Browse existing blogs
4. Create your own blog posts
5. Edit or delete your blogs

## License

This project is open-source and available under the MIT License.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
