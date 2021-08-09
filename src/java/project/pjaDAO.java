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
public class pjaDAO {

    private final Connection connection;
    private int result;

    public pjaDAO() {
        connection = DBConnection.getConnection();
    }

    public int addPJA(pja pja) {
        try {
            String mySqlQuery = "insert into pja"
                    + "(pjaId,pjaName,pjaPass,pjaNTel,pjaIC,pjadaerah,pjamukim)"
                    + "values (?,?,?,?,?,?,?)";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, pja.getPjaId());
            myPs.setString(2, pja.getPjaName());
            myPs.setString(3, pja.getPjaPass());
            myPs.setString(4, pja.getPjantEL());
            myPs.setString(5, pja.getPjaIC());
            myPs.setString(6, pja.getPjaDaerah());
            myPs.setString(7, pja.getPjaMukim());
           

            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    public static int registerPja(pja pja){
        int status =0;
        try{
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement("insert into pja"
                    + "(pjaId,pjaName,pjaPass,pjaNTel,pjaIC,pjadaerah,pjamukim)"
                    + "values (?,?,?,?,?,?,?)");
            
            ps.setString(1, pja.getPjaId());
            ps.setString(2, pja.getPjaName());
            ps.setString(3, pja.getPjaPass());
            ps.setString(4, pja.getPjantEL());
            ps.setString(5, pja.getPjaIC());
            ps.setString(6, pja.getPjaDaerah());
            ps.setString(7, pja.getPjaMukim());
           
            
            
            status = ps.executeUpdate();
            connection.close();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static pja signinPJA(String pjantEL, String pjaPass) {
        pja pja = null;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from pja where PjaNtel =? and pjaPass=?");

            ps.setString(1, pjantEL);
            ps.setString(2, pjaPass);

            ResultSet result = ps.executeQuery();

            if (result.next()) {

                pja = new pja();
                pja.setPjaId(result.getString("pjaId"));
                pja.setPjaName(result.getString("pjaName"));
                pja.setPjaPass(result.getString("pjaPass"));
                pja.setPjantEL(result.getString("PjaNtel"));
                pja.setPjaIC(result.getString("PjaIC"));
                pja.setPjaDaerah(result.getString("pjadaerah"));
                pja.setPjaMukim(result.getString("pjamukim"));
                pja.setPjaCat(result.getString("pjaCat"));
              
            }
            con.close();

        } catch (SQLException ex) {
        }
        return pja;
    }
    
    public pja retrievePja(String pjaId) {
        pja pja = new pja();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from pja "
                    + "where pjaId=" + pjaId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                pja.setPjaId(myRs.getString(1));
                pja.setPjaName(myRs.getString(2));
                pja.setPjaPass(myRs.getString(3));
                pja.setPjantEL(myRs.getString(4));
                pja.setPjaIC(myRs.getString(5));
                pja.setPjaDaerah(myRs.getString(6));
                pja.setPjaMukim(myRs.getString(7));
                pja.setPjaCat(myRs.getString(8));
                
            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return pja;
    }
    
    public int updatePJA(pja pja) {
        try {

            String mySqlQuery = "update pja set pjaName=?,pjaPass=?,PjaNtel=?,PjaIC=?,pjadaerah=?,pjamukim=? where pjaId=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, pja.getPjaName());
            myPs.setString(2, pja.getPjaPass());
            myPs.setString(3, pja.getPjantEL());
            myPs.setString(4, pja.getPjaIC());
            myPs.setString(5, pja.getPjaDaerah());
            myPs.setString(6, pja.getPjaMukim());
            myPs.setString(7, pja.getPjaId());
            
            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
}
