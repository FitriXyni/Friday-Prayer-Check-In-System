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
public class tempahanDAO {

    private final Connection connection;
    private int result;

    public tempahanDAO() {
        connection = DBConnection.getConnection();
    }

    public int addTempahan(tempahan tempahan) {
        try {
            String mySqlQuery = "insert into tempahan"
                    + "(tempid,lokasiId,jemId,jemname,tempdate)"
                    + "values (?,?,?,?,?)";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setInt(1, tempahan.getTempId());
            myPs.setInt(2, tempahan.getLokasiId());
            myPs.setInt(3, tempahan.getJemId());
            myPs.setString(4, tempahan.getJemname());
            myPs.setString(5, tempahan.getTempDate());
            

            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    public int addTempahan1(tempahan tempahan) {
        try {
            String mySqlQuery = "insert into tempahan"
                    + "(tempid,lokasiId,jemId,jemname,tempdate)"
                    + "values (?,?,?,?,?)";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setInt(1, tempahan.getTempId());
            myPs.setInt(2, tempahan.getLokasiId());
            myPs.setInt(3, tempahan.getwId());
            myPs.setString(4, tempahan.getwName());
            myPs.setString(5, tempahan.getTempDate());
            

            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public List<tempahan> totalTempahan(int lokasiId) {
        List<tempahan> allTemp = new ArrayList<tempahan>();
        tempahan temp;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select COUNT(tempid) from tempahan where tempahan.lokasiId="+lokasiId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                temp = new tempahan();
                temp.setTotalTem(myRs.getInt(1));
               
                
                
                allTemp.add(temp);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return allTemp;
    }
    public List<tempahan> totalTempahan1(String kuodate1, int lokasiId) {
        List<tempahan> allTemp = new ArrayList<tempahan>();
        tempahan temp;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select COUNT(tempid) from tempahan where tempdate='"+kuodate1+"' and lokasiId="+lokasiId+"";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                temp = new tempahan();
                temp.setTotalTem(myRs.getInt(1));
               
                
                
                allTemp.add(temp);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return allTemp;
    }
    
    public List<tempahan> reserveSlot(String poskod, String kuodate) {
        List<tempahan> tempAll = new ArrayList<tempahan>();
        tempahan temp;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from (tempahan INNER JOIN lokasi ON tempahan.lokasiId=lokasi.lokasiId) where kuodate='"+kuodate+"' and poskod="+poskod;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                temp = new tempahan();
                temp.setLokasiId(myRs.getInt(3));
                temp.setNamaMasjid(myRs.getString(7));
                temp.setLatitude(myRs.getString(8));
                temp.setLongitude(myRs.getString(9));
                temp.setPoskod(myRs.getString(10));
                temp.setKuotaProv(myRs.getInt(11));
                temp.setKuodate(myRs.getString(12));
                temp.setGamMasjid(myRs.getString(13));
                
                
                tempAll.add(temp);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return tempAll;
    }
    public List<tempahan> retrieveJemTem(String jemId) {
        List<tempahan> tempJem = new ArrayList<tempahan>();
        tempahan temp;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from tempahan where jemId="+jemId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                temp = new tempahan();
                temp.setTempId(myRs.getInt(1));
                temp.setLokasiId(myRs.getInt(2));
                temp.setJemId(myRs.getInt(3));
                temp.setJemname(myRs.getString(4));
                temp.setTempDate(myRs.getString(5));
            
                
                
                tempJem.add(temp);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return tempJem;
    }
    
    public List<tempahan> ListJemTem(int lokasiId, String tempdate) {
        List<tempahan> tempJem = new ArrayList<tempahan>();
        tempahan temp;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from (tempahan inner join jemaah on tempahan.jemId = jemaah.jemId) "
                    + "where tempahan.tempdate='"+tempdate+"' and tempahan.lokasiId=" + lokasiId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                temp = new tempahan();
                temp.setTempId(myRs.getInt(1));
                temp.setJemname(myRs.getString(4));
                temp.setJemAlamat(myRs.getString(13));
                temp.setJemTel(myRs.getString(17));
                temp.setJemIC(myRs.getString(10));
                temp.setJemCat(myRs.getString(18));
                temp.setTempDate(myRs.getString(5));
                temp.setStatusKehadiran(myRs.getString(6));
                
                
                
                tempJem.add(temp);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return tempJem;
    }
    
    public tempahan reserveDetails(String tempId) {
        tempahan tempahan = new tempahan();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from ((tempahan inner join jemaah on tempahan.jemId = jemaah.jemId) inner join lokasi on tempahan.lokasiId = lokasi.lokasiId) "
                    + "where tempahan.tempid=" + tempId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                tempahan.setTempId(myRs.getInt(1));
                tempahan.setLokasiId(myRs.getInt(2));
                tempahan.setJemId(myRs.getInt(3));
                tempahan.setJemname(myRs.getString(4));
                tempahan.setTempDate(myRs.getString(5));
                tempahan.setJemIC(myRs.getString(9));
                tempahan.setJemTel(myRs.getString(16));
                tempahan.setNamaMasjid(myRs.getString(20));
                tempahan.setLatitude(myRs.getString(21));
                tempahan.setLongitude(myRs.getString(22));
                tempahan.setPoskod(myRs.getString(23));
                tempahan.setGamMasjid(myRs.getString(28));

            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return tempahan;
    }
    public tempahan reserveDetails3(int tempId) {
        tempahan tempahan = new tempahan();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from ((tempahan inner join jemaah on tempahan.jemId = jemaah.jemId) inner join lokasi on tempahan.lokasiId = lokasi.lokasiId) "
                    + "where tempahan.tempid=" + tempId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                tempahan.setTempId(myRs.getInt(1));
                tempahan.setLokasiId(myRs.getInt(2));
                tempahan.setJemId(myRs.getInt(3));
                tempahan.setJemname(myRs.getString(4));
                tempahan.setTempDate(myRs.getString(5));
                tempahan.setJemIC(myRs.getString(9));
                tempahan.setJemTel(myRs.getString(16));
                tempahan.setNamaMasjid(myRs.getString(20));
                tempahan.setLatitude(myRs.getString(21));
                tempahan.setLongitude(myRs.getString(22));
                tempahan.setPoskod(myRs.getString(23));
                tempahan.setGamMasjid(myRs.getString(28));

            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return tempahan;
    }
    public tempahan totalJemTempatan(String tempdate,int lokasiId) {
        tempahan tempahan = new tempahan();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select count(tempid) from (tempahan inner join jemaah on tempahan.jemId = jemaah.jemId) where jemaah.jemCat='tempatan' and tempahan.tempdate='"+tempdate+"' and tempahan.lokasiId="+lokasiId+"";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                tempahan.setTotalJemTem(myRs.getInt(1));
                

            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return tempahan;
    }
     public tempahan totalJemLuar(String tempdate,int lokasiId) {
        tempahan tempahan = new tempahan();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select count(tempid) from (tempahan inner join jemaah on tempahan.jemId = jemaah.jemId) where jemaah.jemCat='luar' and tempahan.tempdate='"+tempdate+"' and tempahan.lokasiId="+lokasiId+"";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                tempahan.setTotalJemLu(myRs.getInt(1));
                

            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return tempahan;
    }
     
    public tempahan totalJemWasing(String tempdate,int lokasiId) {
        tempahan tempahan = new tempahan();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select count(tempid) from (tempahan inner join jemaah on tempahan.jemId = jemaah.jemId) where jemaah.jemCat='WargaAsing' and tempahan.tempdate='"+tempdate+"' and tempahan.lokasiId="+lokasiId+"";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                tempahan.setTotalJemWa(myRs.getInt(1));
                

            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return tempahan;
    }
    
    public int deleteJemReservation(String tempId) {
        try {

            String mySqlQuery = "delete from tempahan where tempid =?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, tempId);

            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Excepetion is ;" + e);
        }
        return result;
    }
    public int updateJemaahStatus(tempahan tempahan) {
        try {

            String mySqlQuery = "update tempahan set statusKehadiran=? where tempid=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, tempahan.getStatusKehadiran());
            myPs.setInt(2, tempahan.getTempId());
            

            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
}
