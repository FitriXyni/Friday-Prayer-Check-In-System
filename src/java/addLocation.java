/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Muhamad Nurfitri Bin Zaini
 */
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@WebServlet("/addLocation")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class addLocation extends HttpServlet {
     
    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/s52188_fpci";
    private String dbUser = "s52188";
    private String dbPass = "8Xx6uGdsSL5R";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        String pjaId = request.getParameter("pjaId");
        String namaMasjid = request.getParameter("MasName");
        String latitude = request.getParameter("latitude");
        String longitude = request.getParameter("longitude");
        String poscode = request.getParameter("poscode");
        String kuodate = request.getParameter("kuodate");
        String daerah = request.getParameter("daerah");
        String mukim = request.getParameter("mukim");
      
        
         
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photoMas");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
       try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
     /*Class.forName("com.mysql.jdbc.Driver");
            //Step 4: Establish a connection to Mysql database
            String myUrl = "jdbc:mysql://localhost:3306/insurance";
            Connection myConnection = DriverManager.getConnection(myUrl, "root", "admin");*/
 
            // constructs SQL statement
            String sql = "INSERT INTO lokasi (pjaId, namaMasjid, latitude, longitude, poskod, kuodate, daerah, mukim, gambarMasjid) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, pjaId);
            statement.setString(2, namaMasjid);
            statement.setString(3, latitude);
            statement.setString(4, longitude);
            statement.setString(5, poscode);
            statement.setString(6, kuodate);
            statement.setString(7, daerah);
            statement.setString(8, mukim);
           
            

            
             
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(9, inputStream);
            }
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Tambah Lokasi Masjid Berjaya";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);
            String path = "/masList.jsp?daerah=" + daerah + "&mukim=" + mukim + "";
            // forwards to the message page
            getServletContext().getRequestDispatcher(path).forward(request, response);
        }
    }
}
