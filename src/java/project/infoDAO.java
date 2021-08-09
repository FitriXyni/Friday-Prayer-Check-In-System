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
public class infoDAO {

    private final Connection connection;
    private int result;

    public infoDAO() {
        connection = DBConnection.getConnection();
    }
    
    public info retrieveInfo(String ajkid) {
        info info = new info();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from info "
                    + "where ajkid=" + ajkid;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                info.setInfoId(myRs.getInt(1));
                info.setAjkid(myRs.getString(2));
                info.setLokasiId(myRs.getInt(3));
                info.setInfoDate(myRs.getString(4));
                info.setTajKhut(myRs.getString(5));
                info.setImamName(myRs.getString(6));
                info.setImamNTel(myRs.getString(7));
                info.setBilalName(myRs.getString(8));
                info.setBilalNTel(myRs.getString(9));
                info.setGamImam(myRs.getString(10));
                info.setGamBilal(myRs.getString(11));

            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return info;
    }
    public info retrieveJemInfo(String lokasiId) {
        info info = new info();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from ((info inner join lokasi on info.lokasiId = lokasi.lokasiId) inner join tempahan on lokasi.lokasiId = tempahan.lokasiId) "
                    + "where info.lokasiId=" + lokasiId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                info.setInfoId(myRs.getInt(1));
                info.setAjkid(myRs.getString(2));
                info.setLokasiId(myRs.getInt(3));
                info.setInfoDate(myRs.getString(4));
                info.setTajKhut(myRs.getString(5));
                info.setImamName(myRs.getString(6));
                info.setImamNTel(myRs.getString(7));
                info.setBilalName(myRs.getString(8));
                info.setBilalNTel(myRs.getString(9));
                info.setGamImam(myRs.getString(10));
                info.setGamBilal(myRs.getString(11));
                info.setNamaMasjid(myRs.getString(14));
                info.setTempId(myRs.getInt(21));

            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return info;
    }
    public info retrieveInfo3(String lokasiId) {
        info info = new info();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from (info inner join lokasi on info.lokasiId = lokasi.lokasiId) "
                    + "where info.lokasiId=" + lokasiId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                info.setInfoId(myRs.getInt(1));
                info.setAjkid(myRs.getString(2));
                info.setLokasiId(myRs.getInt(3));
                info.setInfoDate(myRs.getString(4));
                info.setTajKhut(myRs.getString(5));
                info.setImamName(myRs.getString(6));
                info.setImamNTel(myRs.getString(7));
                info.setBilalName(myRs.getString(8));
                info.setBilalNTel(myRs.getString(9));
                info.setGamImam(myRs.getString(10));
                info.setGamBilal(myRs.getString(11));
                info.setNamaMasjid(myRs.getString(14));

            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return info;
    }
     public info retrieveInfoUpdate(String lokasiId) {
        info info = new info();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from (info inner join lokasi on info.lokasiId = lokasi.lokasiId) "
                    + "where info.lokasiId=" + lokasiId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                info.setInfoId(myRs.getInt(1));
                info.setAjkid(myRs.getString(2));
                info.setLokasiId(myRs.getInt(3));
                info.setInfoDate(myRs.getString(4));
                info.setTajKhut(myRs.getString(5));
                info.setImamName(myRs.getString(6));
                info.setImamNTel(myRs.getString(7));
                info.setBilalName(myRs.getString(8));
                info.setBilalNTel(myRs.getString(9));
                info.setGamImam(myRs.getString(10));
                info.setGamBilal(myRs.getString(11));
                info.setNamaMasjid(myRs.getString(14));

            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return info;
    }
     public info retrieveInfo1(String infoId) {
        info info = new info();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from info "
                    + "where infoId=" + infoId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                info.setInfoId(myRs.getInt(1));
                info.setAjkid(myRs.getString(2));
                info.setLokasiId(myRs.getInt(3));
                info.setInfoDate(myRs.getString(4));
                info.setTajKhut(myRs.getString(5));
                info.setImamName(myRs.getString(6));
                info.setImamNTel(myRs.getString(7));
                info.setBilalName(myRs.getString(8));
                info.setBilalNTel(myRs.getString(9));
                info.setGamImam(myRs.getString(10));
                info.setGamBilal(myRs.getString(11));

            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return info;
    }
     
    public List<info> retrieveOneInfo(String lokasiId) {
        List<info> infoAll = new ArrayList<info>();
        info in;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from (info inner join lokasi on info.lokasiId = lokasi.lokasiId) "
                    + "where info.lokasiId=" + lokasiId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                in = new info();
                in.setInfoId(myRs.getInt(1));
                in.setAjkid(myRs.getString(2));
                in.setLokasiId(myRs.getInt(3));
                in.setInfoDate(myRs.getString(4));
                in.setTajKhut(myRs.getString(5));
                in.setImamName(myRs.getString(6));
                in.setImamNTel(myRs.getString(7));
                in.setBilalName(myRs.getString(8));
                in.setBilalNTel(myRs.getString(9));
                in.setGamImam(myRs.getString(10));
                in.setGamBilal(myRs.getString(11));
                in.setNamaMasjid(myRs.getString(14));
                
                
                infoAll.add(in);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return infoAll;
    }
    
    public int updateInfo(info info) {
        try {

            String mySqlQuery = "update info set tajukKhut=?,imamName=?,imamNTel=?,bilalName=?,bilalNTel=? where infoId=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, info.getTajKhut());
            myPs.setString(2, info.getImamName());
            myPs.setString(3, info.getImamNTel());
            myPs.setString(4, info.getBilalName());
            myPs.setString(5, info.getBilalNTel());
            myPs.setInt(6, info.getInfoId());
            
            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public int deleteInfo(String infoId) {
        try {

            String mySqlQuery = "delete from info where infoId =?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, infoId);

            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Excepetion is ;" + e);
        }
        return result;
    }
}
