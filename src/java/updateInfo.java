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
 
@WebServlet("/updateInfo")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class updateInfo extends HttpServlet {
     
    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/s52188_fpci";
    private String dbUser = "s52188";
    private String dbPass = "8Xx6uGdsSL5R";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        String dateInfo = request.getParameter("dateInfo");
        String tajKhutabah = request.getParameter("tajKhut");
        String imamName = request.getParameter("imamName");
        String imamNTel = request.getParameter("NTelImam");
        String bilalName = request.getParameter("bilalName");
        String bilalNTel = request.getParameter("NTelBilal");
        String ajkid = request.getParameter("ajkId");
        int lokasiId = Integer.parseInt(request.getParameter("lokasiId"));
        int infoId = Integer.parseInt(request.getParameter("infoId"));
       
      
        
         
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("gamImam");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        
         InputStream inputStream1 = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart1 = request.getPart("gamBilal");
        if (filePart1 != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream1 = filePart1.getInputStream();
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
            String sql = "update info set ajkid=?,infoDate=?,tajukKhut=?,imamName=?,imamNTel=?,bilalName=?,bilalNTel=?,gambarImam=?,gambarBilal=? where infoId=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, ajkid);
            statement.setString(2, dateInfo);
            statement.setString(3, tajKhutabah);
            statement.setString(4, imamName);
            statement.setString(5, imamNTel);
            statement.setString(6, bilalName);
            statement.setString(7, bilalNTel);
            
           
            

            
             
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(8, inputStream);
            }
            if (inputStream1 != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(9, inputStream1);
            }
            statement.setInt(10, infoId);
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Kemaskini Info Solat Jumaat Berjaya";
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
            String path = "/infoDetails1.jsp?id='" + lokasiId + "'";
             
            // forwards to the message page
            getServletContext().getRequestDispatcher(path).forward(request, response);
        }
    }
}
