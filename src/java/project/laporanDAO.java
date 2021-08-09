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
public class laporanDAO {

    private final Connection connection;
    private int result;

    public laporanDAO() {
        connection = DBConnection.getConnection();
    }
    
    public List<laporan> retrieveLap(String lokasiId) {
        List<laporan> masLap = new ArrayList<laporan>();
        laporan lap;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from (laporan INNER JOIN lokasi ON laporan.lokasiId = lokasi.lokasiId) "
                    + "where laporan.lokasiId  =" + lokasiId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                lap = new laporan();
                lap.setLaporanId(myRs.getInt(1));
                lap.setAjkid(myRs.getString(2));
                lap.setLokasiId(myRs.getInt(3));
                lap.setLapDate(myRs.getString(4));
                lap.setNamaMasjid(myRs.getString(15));
            
                
                
                masLap.add(lap);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return masLap;
    }
    
    public laporan getLaporan(String lapId) {
        laporan laporan = new laporan();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from laporan "
                    + "where laporanId =" + lapId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                laporan.setLaporanId(myRs.getInt(1));
                laporan.setAjkid(myRs.getString(2));
                laporan.setLokasiId(myRs.getInt(3));
                laporan.setLapDate(myRs.getString(4));
                laporan.setLapDesc(myRs.getString(5));
                laporan.setLapIM(myRs.getString(6));
                laporan.setLapB(myRs.getString(7));
                laporan.setLapGam1(myRs.getString(8));
                laporan.setLapGam2(myRs.getString(9));
                laporan.setLapGam3(myRs.getString(10));
                laporan.setLapGam4(myRs.getString(11));
                laporan.setLapGam5(myRs.getString(12));

            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return laporan;
    }
    public laporan getOneReport(String lapId) {
        laporan lap = new laporan();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from ((laporan INNER JOIN lokasi ON laporan.lokasiId = lokasi.lokasiId)INNER JOIN info on lokasi.lokasiId = info.lokasiId) "
                    + "where laporan. laporanId   =" + lapId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                lap.setLaporanId(myRs.getInt(1));
                lap.setAjkid(myRs.getString(2));
                lap.setLokasiId(myRs.getInt(3));
                lap.setLapDate(myRs.getString(4));
                lap.setLapDesc(myRs.getString(5));
                lap.setLapIM(myRs.getString(6));
                lap.setLapB(myRs.getString(7));
                lap.setLapGam1(myRs.getString(8));
                lap.setLapGam2(myRs.getString(9));
                lap.setLapGam3(myRs.getString(10));
                lap.setLapGam4(myRs.getString(11));
                lap.setLapGam5(myRs.getString(12));
                lap.setNamaMasjid(myRs.getString(15));
                lap.setGamMasjid(myRs.getString(21));
                lap.setTajKhut(myRs.getString(26));
                lap.setGamImam(myRs.getString(31));
                lap.setGamBilal(myRs.getString(32));

            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return lap;
    }
}
