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
public class wargasingDAO {

    private final Connection connection;
    private int result;

    public wargasingDAO() {
        connection = DBConnection.getConnection();
    }

    public int addWargasing(wargasing wargasing) {
        try {
            String mySqlQuery = "insert into wasing"
                    + "(wid,wname,wpass,wspassport,wage,wposcode,wTel)"
                    + "values (?,?,?,?,?,?,?)";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setInt(1, wargasing.getwId());
            myPs.setString(2, wargasing.getwName());
            myPs.setString(3, wargasing.getwPass());
            myPs.setString(4, wargasing.getwPassport());
            myPs.setString(5, wargasing.getwAge());
            myPs.setString(6, wargasing.getwPoscode());
            myPs.setString(7, wargasing.getwTel());
            
            

            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
     public static wargasing signinWargasing(String wTel, String wPass) {
        wargasing wargasing = null;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from wasing where wTel =? and wpass=?");

            ps.setString(1, wTel);
            ps.setString(2, wPass);

            ResultSet result = ps.executeQuery();

            if (result.next()) {

                wargasing = new wargasing();
                wargasing.setwId(result.getInt("wid"));
                wargasing.setwName(result.getString("wname"));
                wargasing.setwPass(result.getString("wpass"));
                wargasing.setwPassport(result.getString("wspassport"));
                wargasing.setwAge(result.getString("wage"));
                wargasing.setwPoscode(result.getString("wposcode"));
                wargasing.setwTel(result.getString("wTel"));
                wargasing.setwCat(result.getString("wCat"));
                

            }
            con.close();

        } catch (SQLException ex) {
        }
        return wargasing;
    }
    
}
