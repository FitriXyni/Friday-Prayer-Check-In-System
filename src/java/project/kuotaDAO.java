package project;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Fitri Xyni
 */
public class kuotaDAO {

    private final Connection connection;
    private int result;

    public kuotaDAO() {
        connection = DBConnection.getConnection();
    }

    public int addKuota(kuota kuota) {
        try {
            String mySqlQuery = "insert into kuota"
                    + "(ajkid,lokasiId ,kuotaPrd,kuotaDate,kuotaTime)"
                    + "values (?,?,?,?,?)";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, kuota.getAjkid());
            myPs.setInt(2, kuota.getLokasiId());
            myPs.setString(3, kuota.getKuotaPrd());
            myPs.setString(4, kuota.getKuotaDate());
            myPs.setString(5, kuota.getKuotaTime());
            

            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
     public kuota retrieveKuota(String ajkid) {
        kuota kuota = new kuota();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from kuota "
                    + "where ajkid=" + ajkid;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                kuota.setKuotaId(myRs.getInt(1));
                kuota.setAjkid(myRs.getString(2));
                kuota.setLokasiId(myRs.getInt(3));
                kuota.setKuotaPrd(myRs.getString(4));
                kuota.setKuotaDate(myRs.getString(5));
                kuota.setKuotaTime(myRs.getString(6));

            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return kuota;
    }
     
     public kuota retrieveOneLokasi(String kuotaId) {
        kuota kuota = new kuota();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from kuota "
                    + "where kuotaId =" + kuotaId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                kuota.setKuotaId(myRs.getInt(1));
                kuota.setAjkid(myRs.getString(2));
                kuota.setLokasiId(myRs.getInt(3));
                kuota.setKuotaPrd(myRs.getString(4));
                kuota.setKuotaDate(myRs.getString(5));
                kuota.setKuotaTime(myRs.getString(6));

            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return kuota;
    }
    
    public int updateKuota(kuota kuota) {
        try {

            String mySqlQuery = "update kuota set kuotaPrd=?,kuotaDate=?,kuotaTime=? where kuotaId=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, kuota.getKuotaPrd());
            myPs.setString(2, kuota.getKuotaDate());
            myPs.setString(3, kuota.getKuotaTime());
            myPs.setInt(4, kuota.getKuotaId());
            
            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public int deleteKuota(String kuotaId) {
        try {

            String mySqlQuery = "delete from kuota where kuotaId =?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, kuotaId);

            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Excepetion is ;" + e);
        }
        return result;
    }
    
}
