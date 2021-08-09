package project;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author Fitri Zaini
 */
public class DBConnection implements java.io.Serializable {

    public static Connection connection;

    public static Connection getConnection() {
        try {
            //Step 1: Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            //Step 2: Establish a connection to mySql database
            String myUrl = "jdbc:mysql://localhost:3306/fpci";
            connection = DriverManager.getConnection(myUrl, "root", "admin");
        } catch (ClassNotFoundException | SQLException e) {
            e.getMessage();
        }
        return connection;
    }

    public void closeConnection() {

        try {
            connection.close();
        } catch (SQLException e) {
            e.getMessage();
        }
    }
}