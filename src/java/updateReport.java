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
 
@WebServlet("/updateReport")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class updateReport extends HttpServlet {
     
    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/s52188_fpci";
    private String dbUser = "s52188";
    private String dbPass = "8Xx6uGdsSL5R";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        String repDesc = request.getParameter("repDesc");
        String dateRep = request.getParameter("dateRep");
        String lapIM = request.getParameter("imamName");
        String lapB = request.getParameter("BilalName");
        String ajkid = request.getParameter("ajkid");
        int lokasiId = Integer.parseInt(request.getParameter("lokasiId"));
        int laporanId = Integer.parseInt(request.getParameter("laporanId"));
        InputStream inputStream = null; // input stream of the upload file

        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("gam1");
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
        Part filePart1 = request.getPart("gam2");
        if (filePart1 != null) {
            // prints out some information for debugging
            System.out.println(filePart1.getName());
            System.out.println(filePart1.getSize());
            System.out.println(filePart1.getContentType());

            // obtains input stream of the upload file
            inputStream1 = filePart1.getInputStream();
        }
        InputStream inputStream2 = null; // input stream of the upload file

        // obtains the upload file part in this multipart request
        Part filePart2 = request.getPart("gam3");
        if (filePart2 != null) {
            // prints out some information for debugging
            System.out.println(filePart2.getName());
            System.out.println(filePart2.getSize());
            System.out.println(filePart2.getContentType());

            // obtains input stream of the upload file
            inputStream2 = filePart2.getInputStream();
        }
        InputStream inputStream3 = null; // input stream of the upload file

        // obtains the upload file part in this multipart request
        Part filePart3 = request.getPart("gam4");
        if (filePart3 != null) {
            // prints out some information for debugging
            System.out.println(filePart3.getName());
            System.out.println(filePart3.getSize());
            System.out.println(filePart3.getContentType());

            // obtains input stream of the upload file
            inputStream3 = filePart3.getInputStream();
        }
        InputStream inputStream4 = null; // input stream of the upload file

        // obtains the upload file part in this multipart request
        Part filePart4 = request.getPart("gam5");
        if (filePart4 != null) {
            // prints out some information for debugging
            System.out.println(filePart4.getName());
            System.out.println(filePart4.getSize());
            System.out.println(filePart4.getContentType());

            // obtains input stream of the upload file
            inputStream4 = filePart4.getInputStream();
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
            String sql = "update laporan set ajkid=?,lokasiId=?,lapDate=?,lapDesc=?,lapIM=?,lapB=?,lapGam1=?,lapGam2=?,lapGam3=?,lapGam4=?,lapGam5=? where laporanId=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, ajkid);
            statement.setInt(2, lokasiId);
            statement.setString(3, dateRep);
            statement.setString(4, repDesc);
            statement.setString(5, lapIM);
            statement.setString(6, lapB);
            
            
           
            

            
             
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(7, inputStream);
            }
            if (inputStream1 != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(8, inputStream1);
            }
            if (inputStream2 != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(9, inputStream2);
            }
            if (inputStream3 != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(10, inputStream3);
            }
            if (inputStream4 != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(11, inputStream4);
            }
            
            statement.setInt(12, laporanId);
            
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Kemaskini Laporan Solat Jumaat Berjaya";
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
            String path = "/reportDetails2.jsp?id='" + laporanId + "'";
             
            // forwards to the message page
            getServletContext().getRequestDispatcher(path).forward(request, response);
        }
    }
}
