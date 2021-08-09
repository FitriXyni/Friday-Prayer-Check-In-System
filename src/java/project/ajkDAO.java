/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Fitri Xyni
 */
public class ajkDAO {

    private final Connection connection;
    private int result;

    public ajkDAO() {
        connection = DBConnection.getConnection();
    }

    public int addAJKMasjid(ajkmasjid ajkmasjid) {
        try {
            String mySqlQuery = "insert into ajkmasjid"
                    + "(ajkid,ajkname,ajkpass,ajkic,ajkage,ajkdob,ajkalmt,ajkmukim,ajkdaerah,ajkntel,lokasiId)"
                    + "values (?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, ajkmasjid.getAjkid());
            myPs.setString(2, ajkmasjid.getAjkname());
            myPs.setString(3, ajkmasjid.getAjkpass());
            myPs.setString(4, ajkmasjid.getAjkic());
            myPs.setString(5, ajkmasjid.getAjkage());
            myPs.setString(6, ajkmasjid.getAjkdob());
            myPs.setString(7, ajkmasjid.getAjkalmt());
            myPs.setString(8, ajkmasjid.getAjkmukim());
            myPs.setString(9, ajkmasjid.getAjkdaerah());
            myPs.setString(10, ajkmasjid.getAjkntel());
            myPs.setInt(11, ajkmasjid.getLokasiId());

            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    public static int registerAJKMasjid(ajkmasjid ajkmasjid){
        int status =0;
        try{
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement("insert into ajkmasjid"
                    + "(ajkid,ajkname,ajkpass,ajkic,ajkage,ajkdob,ajkalmt,ajkmukim,ajkdaerah,ajkntel,lokasiId)"
                    + "values (?,?,?,?,?,?,?,?,?,?,?)");
            
            ps.setString(1, ajkmasjid.getAjkid());
            ps.setString(2, ajkmasjid.getAjkname());
            ps.setString(3, ajkmasjid.getAjkpass());
            ps.setString(4, ajkmasjid.getAjkic());
            ps.setString(5, ajkmasjid.getAjkage());
            ps.setString(6, ajkmasjid.getAjkdob());
            ps.setString(7, ajkmasjid.getAjkalmt());
            ps.setString(8, ajkmasjid.getAjkmukim());
            ps.setString(9, ajkmasjid.getAjkdaerah());
            ps.setString(10, ajkmasjid.getAjkntel());
            ps.setInt(11, ajkmasjid.getLokasiId());
            
            
            status = ps.executeUpdate();
            connection.close();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static ajkmasjid signinAJK(String ajkntel, String ajkpass) {
        ajkmasjid ajkmasjid = null;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from ajkmasjid where ajkntel =? and ajkpass=?");

            ps.setString(1, ajkntel);
            ps.setString(2, ajkpass);

            ResultSet result = ps.executeQuery();

            if (result.next()) {

                ajkmasjid = new ajkmasjid();
                ajkmasjid.setAjkid(result.getString("ajkid"));
                ajkmasjid.setAjkname(result.getString("ajkname"));
                ajkmasjid.setAjkpass(result.getString("ajkpass"));
                ajkmasjid.setAjkic(result.getString("ajkic"));
                ajkmasjid.setAjkage(result.getString("ajkage"));
                ajkmasjid.setAjkdob(result.getString("ajkdob"));
                ajkmasjid.setAjkalmt(result.getString("ajkalmt"));
                ajkmasjid.setAjkmukim(result.getString("ajkmukim"));
                ajkmasjid.setAjkdaerah(result.getString("ajkdaerah"));
                ajkmasjid.setAjkntel(result.getString("ajkntel"));
                ajkmasjid.setAjkcat(result.getString("ajkcat"));
                ajkmasjid.setLokasiId(result.getInt("lokasiId"));

            }
            con.close();

        } catch (SQLException ex) {
        }
        return ajkmasjid;
    }

    public int updateAJKPassword(ajkmasjid ajkmasjid) {
        try {

            String mySqlQuery = "update ajkmasjid set ajkname=?,ajkpass=?,ajkic=?,ajkage=?,ajkdob=?,ajkalmt=?,ajkmukim=?,ajkdaerah=?,ajkntel=? where ajkid=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, ajkmasjid.getAjkname());
            myPs.setString(2, ajkmasjid.getAjkpass());
            myPs.setString(3, ajkmasjid.getAjkic());
            myPs.setString(4, ajkmasjid.getAjkage());
            myPs.setString(5, ajkmasjid.getAjkdob());
            myPs.setString(6, ajkmasjid.getAjkalmt());
            myPs.setString(7, ajkmasjid.getAjkmukim());
            myPs.setString(8, ajkmasjid.getAjkdaerah());
            myPs.setString(9, ajkmasjid.getAjkntel());
            myPs.setString(10, ajkmasjid.getAjkid());

            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public int deleteAJK(String ajkid) {
        try {

            String mySqlQuery = "delete from ajkmasjid where ajkid=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, ajkid);

            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Excepetion is ;" + e);
        }
        return result;
    }
    
     public ajkmasjid retrieveAJK(String ajkId) {
        ajkmasjid ajkmasjid = new ajkmasjid();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from ajkmasjid "
                    + "where ajkid=" + ajkId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                ajkmasjid.setAjkid(myRs.getString(1));
                ajkmasjid.setAjkname(myRs.getString(2));
                ajkmasjid.setAjkpass(myRs.getString(3));
                ajkmasjid.setAjkic(myRs.getString(4));
                ajkmasjid.setAjkage(myRs.getString(5));
                ajkmasjid.setAjkdob(myRs.getString(6));
                ajkmasjid.setAjkalmt(myRs.getString(7));
                ajkmasjid.setAjkmukim(myRs.getString(8));
                ajkmasjid.setAjkdaerah(myRs.getString(9));
                ajkmasjid.setAjkntel(myRs.getString(10));
                ajkmasjid.setAjkcat(myRs.getString(11));
                ajkmasjid.setLokasiId(myRs.getInt(12));
                
                
            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return ajkmasjid;
    }
    
     public ajkmasjid ajkKuota(String ajkid) {
        ajkmasjid ajk = new ajkmasjid();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from (ajkmasjid INNER JOIN lokasi ON ajkmasjid.lokasiId = lokasi.lokasiId) "
                    + "where ajkmasjid.ajkid  =" + ajkid;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                ajk.setAjkid(myRs.getString(1));
                ajk.setAjkname(myRs.getString(2));
                ajk.setAjkpass(myRs.getString(3));
                ajk.setAjkic(myRs.getString(4));
                ajk.setAjkage(myRs.getString(5));
                ajk.setAjkdob(myRs.getString(6));
                ajk.setAjkalmt(myRs.getString(7));
                ajk.setAjkmukim(myRs.getString(8));
                ajk.setAjkdaerah(myRs.getString(9));
                ajk.setAjkntel(myRs.getString(10));
                ajk.setAjkcat(myRs.getString(11));
                ajk.setLokasiId(myRs.getInt(12));
                ajk.setNamaMasjid(myRs.getString(15));
                ajk.setPoskod(myRs.getString(18));
                ajk.setKuotaProv(myRs.getInt(19));
                ajk.setKuodate1(myRs.getString(20));

            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return ajk;
    }
    public List<ajkmasjid> retrieveOneKuota(String ajkid) {
        List<ajkmasjid> ajkAll = new ArrayList<ajkmasjid>();
        ajkmasjid ajk;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from (ajkmasjid INNER JOIN lokasi ON ajkmasjid.lokasiId = lokasi.lokasiId) "
                    + "where ajkmasjid.ajkid  =" + ajkid;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                ajk = new ajkmasjid();
                ajk.setAjkid(myRs.getString(1));
                ajk.setAjkname(myRs.getString(2));
                ajk.setAjkpass(myRs.getString(3));
                ajk.setAjkic(myRs.getString(4));
                ajk.setAjkage(myRs.getString(5));
                ajk.setAjkdob(myRs.getString(6));
                ajk.setAjkalmt(myRs.getString(7));
                ajk.setAjkntel(myRs.getString(8));
                ajk.setAjkcat(myRs.getString(9));
                ajk.setLokasiId(myRs.getInt(11));
                ajk.setNamaMasjid(myRs.getString(13));
                ajk.setPoskod(myRs.getString(16));
                ajk.setKuotaProv(myRs.getInt(17));
                ajk.setKuodate1(myRs.getString(18));
                
                
                ajkAll.add(ajk);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return ajkAll;
    }
    
    public ajkmasjid ajkInfo(String ajkid) {
        ajkmasjid ajk = new ajkmasjid();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from (ajkmasjid INNER JOIN lokasi ON ajkmasjid.lokasiId = lokasi.lokasiId) "
                    + "where ajkmasjid. ajkid  =" + ajkid;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                ajk.setAjkid(myRs.getString(1));
                ajk.setAjkname(myRs.getString(2));
                ajk.setAjkpass(myRs.getString(3));
                ajk.setAjkic(myRs.getString(4));
                ajk.setAjkage(myRs.getString(5));
                ajk.setAjkdob(myRs.getString(6));
                ajk.setAjkalmt(myRs.getString(7));
                ajk.setAjkntel(myRs.getString(8));
                ajk.setAjkcat(myRs.getString(9));
                ajk.setLokasiId(myRs.getInt(10));
                ajk.setNamaMasjid(myRs.getString(13));
                ajk.setPoskod(myRs.getString(16));
            

            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return ajk;
    }
  
    public ajkmasjid ajkLaporan(String ajkid) {
        ajkmasjid ajk = new ajkmasjid();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from ((ajkmasjid INNER JOIN lokasi ON ajkmasjid.lokasiId = lokasi.lokasiId)INNER JOIN info on lokasi.lokasiId = info.lokasiId) "
                    + "where ajkmasjid. ajkid  =" + ajkid;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                ajk.setAjkid(myRs.getString(1));
                ajk.setAjkname(myRs.getString(2));
                ajk.setAjkpass(myRs.getString(3));
                ajk.setAjkic(myRs.getString(4));
                ajk.setAjkage(myRs.getString(5));
                ajk.setAjkdob(myRs.getString(6));
                ajk.setAjkalmt(myRs.getString(7));
                ajk.setAjkntel(myRs.getString(10));
                ajk.setAjkcat(myRs.getString(11));
                ajk.setLokasiId(myRs.getInt(12));
                ajk.setNamaMasjid(myRs.getString(15));
                ajk.setPoskod(myRs.getString(18));
                ajk.setNamaImam(myRs.getString(29));
                ajk.setNamaBilal(myRs.getString(31));

            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return ajk;
    }
    public List<ajkmasjid> totalAJKM() {
        List<ajkmasjid> allAjk = new ArrayList<ajkmasjid>();
        ajkmasjid ajk;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select COUNT(ajkid) from ajkmasjid";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                ajk = new ajkmasjid();
                ajk.setTotalAJKMasjid(myRs.getInt(1));
               
                
                
                allAjk.add(ajk);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return allAjk;
    }
    public List<ajkmasjid> retrieveLocAJKMasjid(int lokasiId) {
        List<ajkmasjid> ajkAll = new ArrayList<ajkmasjid>();
        ajkmasjid ajk;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from ajkmasjid "
                    + "where lokasiId=" + lokasiId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                ajk = new ajkmasjid();
                ajk.setAjkid(myRs.getString(1));
                ajk.setAjkname(myRs.getString(2));
                ajk.setAjkic(myRs.getString(4));
                ajk.setAjkage(myRs.getString(5));
                ajk.setAjkdob(myRs.getString(6));
                ajk.setAjkalmt(myRs.getString(7));
                ajk.setAjkmukim(myRs.getString(8));
                ajk.setAjkdaerah(myRs.getString(9));
                ajk.setAjkntel(myRs.getString(10));
              
                
                ajkAll.add(ajk);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return ajkAll;
    }
     public List<ajkmasjid> totalAJKM1(int lokasiId) {
        List<ajkmasjid> allAjk = new ArrayList<ajkmasjid>();
        ajkmasjid ajk;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select COUNT(ajkid) from ajkmasjid "
                    + "where lokasiId=" + lokasiId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                ajk = new ajkmasjid();
                ajk.setTotalAJKMasjid(myRs.getInt(1));
               
                
                
                allAjk.add(ajk);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return allAjk;
    }
   
}
