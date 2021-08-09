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
public class lokasiDAO {

    private final Connection connection;
    private int result;

    public lokasiDAO() {
        connection = DBConnection.getConnection();
    }
     public List<lokasi> retrieveAlllokasi(String pjaId) {
        List<lokasi> locAll = new ArrayList<lokasi>();
        lokasi loc;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from lokasi where pjaId="+pjaId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                loc = new lokasi();
                loc.setLokasiId(myRs.getInt(1));
                loc.setPjaId(myRs.getString(2));
                loc.setNamaMasjid(myRs.getString(3));
                loc.setLatitude(myRs.getString(4));
                loc.setLongitude(myRs.getString(5));
                loc.setPoskod(myRs.getString(6));
                loc.setGamMasjid(myRs.getString(7));
                
                
                locAll.add(loc);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return locAll;
    }
    public List<lokasi> retrieveLoc1() {
        List<lokasi> locAll = new ArrayList<lokasi>();
        lokasi loc;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from lokasi";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                loc = new lokasi();
                loc.setLokasiId(myRs.getInt(1));
                loc.setPjaId(myRs.getString(2));
                loc.setNamaMasjid(myRs.getString(3));
                loc.setLatitude(myRs.getString(4));
                loc.setLongitude(myRs.getString(5));
                loc.setPoskod(myRs.getString(6));
                loc.setKuotaProv(myRs.getInt(7));
                loc.setDaerah(myRs.getString(9));
                loc.setMukim(myRs.getString(10));
                loc.setGamMasjid(myRs.getString(11));
                
                
                locAll.add(loc);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return locAll;
    }
    public List<lokasi> retrieveLoc(String Daerah, String Mukim) {
        List<lokasi> locAll = new ArrayList<lokasi>();
        lokasi loc;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from lokasi where daerah='"+Daerah+"' and mukim='"+Mukim+"'";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                loc = new lokasi();
                loc.setLokasiId(myRs.getInt(1));
                loc.setPjaId(myRs.getString(2));
                loc.setNamaMasjid(myRs.getString(3));
                loc.setLatitude(myRs.getString(4));
                loc.setLongitude(myRs.getString(5));
                loc.setPoskod(myRs.getString(6));
                loc.setKuotaProv(myRs.getInt(7));
                loc.setDaerah(myRs.getString(9));
                loc.setMukim(myRs.getString(10));
                loc.setGamMasjid(myRs.getString(11));
                
                
                locAll.add(loc);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return locAll;
    }
    public List<lokasi> retrieveLoc1(String pjaId) {
        List<lokasi> locAll = new ArrayList<lokasi>();
        lokasi loc;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from lokasi where pjaId="+pjaId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                loc = new lokasi();
                loc.setLokasiId(myRs.getInt(1));
                loc.setPjaId(myRs.getString(2));
                loc.setNamaMasjid(myRs.getString(3));
                loc.setLatitude(myRs.getString(4));
                loc.setLongitude(myRs.getString(5));
                loc.setPoskod(myRs.getString(6));
                loc.setKuotaProv(myRs.getInt(7));
                loc.setDaerah(myRs.getString(9));
                loc.setMukim(myRs.getString(10));
                loc.setGamMasjid(myRs.getString(11));
                
                
                locAll.add(loc);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return locAll;
    }
     public List<lokasi> retrieveLocJemaah(String Poskod) {
        List<lokasi> locAll = new ArrayList<lokasi>();
        lokasi loc;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from lokasi "
                    + "where poskod=" + Poskod;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                loc = new lokasi();
                loc.setLokasiId(myRs.getInt(1));
                loc.setPjaId(myRs.getString(2));
                loc.setNamaMasjid(myRs.getString(3));
                loc.setLatitude(myRs.getString(4));
                loc.setLongitude(myRs.getString(5));
                loc.setPoskod(myRs.getString(6));
                loc.setKuotaProv(myRs.getInt(7));
                loc.setDaerah(myRs.getString(9));
                loc.setMukim(myRs.getString(10));
                loc.setGamMasjid(myRs.getString(11));
                
                
                locAll.add(loc);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return locAll;
    }
     
    public lokasi retrieveLokasi(String lokasiId) {
        lokasi lokasi = new lokasi();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from lokasi "
                    + "where lokasiId=" + lokasiId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                lokasi.setLokasiId(myRs.getInt(1));
                lokasi.setPjaId(myRs.getString(2));
                lokasi.setNamaMasjid(myRs.getString(3));
                lokasi.setLatitude(myRs.getString(4));
                lokasi.setLongitude(myRs.getString(5));
                lokasi.setPoskod(myRs.getString(6));
                lokasi.setDaerah(myRs.getString(9));
                lokasi.setMukim(myRs.getString(10));
                lokasi.setGamMasjid(myRs.getString(11));

            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return lokasi;
    }
    public lokasi retrieveOneLokasi(int lokasiId) {
        lokasi lokasi = new lokasi();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from lokasi "
                    + "where lokasiId=" + lokasiId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                lokasi.setLokasiId(myRs.getInt(1));
                lokasi.setPjaId(myRs.getString(2));
                lokasi.setNamaMasjid(myRs.getString(3));
                lokasi.setLatitude(myRs.getString(4));
                lokasi.setLongitude(myRs.getString(5));
                lokasi.setPoskod(myRs.getString(6));
                lokasi.setGamMasjid(myRs.getString(7));

            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return lokasi;
    }
    public lokasi retrieveOneLokasi1(int lokasiId) {
        lokasi lokasi = new lokasi();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from lokasi "
                    + "where lokasiId=" + lokasiId +"";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                lokasi.setLokasiId(myRs.getInt(1));
                lokasi.setPjaId(myRs.getString(2));
                lokasi.setNamaMasjid(myRs.getString(3));
                lokasi.setLatitude(myRs.getString(4));
                lokasi.setLongitude(myRs.getString(5));
                lokasi.setPoskod(myRs.getString(6));
                lokasi.setKuotaProv(myRs.getInt(7));
                lokasi.setKuodate(myRs.getString(8));
                lokasi.setDaerah(myRs.getString(9));
                lokasi.setMukim(myRs.getString(10));
                lokasi.setGamMasjid(myRs.getString(11));

            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return lokasi;
    }
    public int updateLokasi(lokasi lokasi) {
        try {

            String mySqlQuery = "update lokasi set namaMasjid=?,latitude=?,longitude=?,poskod=?,daerah=?,mukim=? where lokasiId=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, lokasi.getNamaMasjid());
            myPs.setString(2, lokasi.getLatitude());
            myPs.setString(3, lokasi.getLongitude());
            myPs.setString(4, lokasi.getPoskod());
            myPs.setString(5, lokasi.getDaerah());
            myPs.setString(6, lokasi.getMukim());
            myPs.setInt(7, lokasi.getLokasiId());
            
            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public int deleteLoc(String lokasiId) {
        try {

            String mySqlQuery = "delete from lokasi where lokasiId =?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, lokasiId);

            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Excepetion is ;" + e);
        }
        return result;
    }
     public List<lokasi> retrieveLokasiAjk(String poskod) {
        List<lokasi> locAll = new ArrayList<lokasi>();
        lokasi loc;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from lokasi where poskod="+poskod;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                loc = new lokasi();
                loc.setLokasiId(myRs.getInt(1));
                loc.setPjaId(myRs.getString(2));
                loc.setNamaMasjid(myRs.getString(3));
                loc.setLatitude(myRs.getString(4));
                loc.setLongitude(myRs.getString(5));
                loc.setPoskod(myRs.getString(6));
                loc.setGamMasjid(myRs.getString(7));
                
                
                locAll.add(loc);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return locAll;
    }
    public List<lokasi> retrieveLokasiAjk1(String poskod) {
        List<lokasi> locAll = new ArrayList<lokasi>();
        lokasi loc;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from lokasi where poskod='"+poskod+"' or daerah like '%"+poskod+"%' or mukim like '%"+poskod+"%'";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                loc = new lokasi();
                loc.setLokasiId(myRs.getInt(1));
                loc.setPjaId(myRs.getString(2));
                loc.setNamaMasjid(myRs.getString(3));
                loc.setLatitude(myRs.getString(4));
                loc.setLongitude(myRs.getString(5));
                loc.setPoskod(myRs.getString(6));
                loc.setKuotaProv(myRs.getInt(7));
                loc.setDaerah(myRs.getString(9));
                loc.setMukim(myRs.getString(10));
                loc.setGamMasjid(myRs.getString(11));
                
                
                locAll.add(loc);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return locAll;
    }
    public List<lokasi> retrieveLokasiJemaah(String poskod, String kuodate) {
        List<lokasi> locAll = new ArrayList<lokasi>();
        lokasi loc;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from lokasi where kuodate='"+kuodate+"' and poskod="+poskod;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                loc = new lokasi();
                loc.setLokasiId(myRs.getInt(1));
                loc.setPjaId(myRs.getString(2));
                loc.setNamaMasjid(myRs.getString(3));
                loc.setLatitude(myRs.getString(4));
                loc.setLongitude(myRs.getString(5));
                loc.setPoskod(myRs.getString(6));
                loc.setKuotaProv(myRs.getInt(7));
                loc.setKuodate(myRs.getString(8));
                loc.setDaerah(myRs.getString(9));
                loc.setMukim(myRs.getString(10));
                loc.setGamMasjid(myRs.getString(11));
                
                
                locAll.add(loc);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return locAll;
    }
    public List<lokasi> retrieveLokasiJemaah1(String poskod, String kuodate) {
        List<lokasi> locAll = new ArrayList<lokasi>();
        lokasi loc;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from lokasi where kuodate='"+kuodate+"' and poskod='"+poskod+"' or daerah like '%"+poskod+"%' or mukim like '%"+poskod+"%'";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                loc = new lokasi();
                loc.setLokasiId(myRs.getInt(1));
                loc.setPjaId(myRs.getString(2));
                loc.setNamaMasjid(myRs.getString(3));
                loc.setLatitude(myRs.getString(4));
                loc.setLongitude(myRs.getString(5));
                loc.setPoskod(myRs.getString(6));
                loc.setKuotaProv(myRs.getInt(7));
                loc.setKuodate(myRs.getString(8));
                loc.setDaerah(myRs.getString(9));
                loc.setMukim(myRs.getString(10));
                loc.setGamMasjid(myRs.getString(11));
                
                
                locAll.add(loc);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return locAll;
    }
     
    public int updateKuotasLokasi(lokasi lokasi) {
        try {

            String mySqlQuery = "update lokasi set kuotaProv=?,kuodate=? where lokasiId=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setInt(1, lokasi.getKuotaProv());
            myPs.setString(2, lokasi.getKuodate());
            myPs.setInt(3, lokasi.getLokasiId());
            
            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    public List<lokasi> totalMasjid() {
        List<lokasi> allMas = new ArrayList<lokasi>();
        lokasi mas;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select COUNT(lokasiId) from lokasi";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                mas = new lokasi();
                mas.setTotalmasjid(myRs.getInt(1));
               
                
                
                allMas.add(mas);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return allMas;
    }
    
}
