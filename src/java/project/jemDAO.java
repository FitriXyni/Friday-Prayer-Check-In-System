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
public class jemDAO {

    private final Connection connection;
    private int result;

    public jemDAO() {
        connection = DBConnection.getConnection();
    }

    public int addJemMasjid(jemaah jemaah) {
        try {
            String mySqlQuery = "insert into jemaah"
                    + "(jemId,jemName,jemPass,jemIC,jemAge,jemDOB,jemalamat,jemdaerah,jemmukim,jemposcode,jemTel,jemCat)"
                    + "values (?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setInt(1, jemaah.getJemId());
            myPs.setString(2, jemaah.getJemName());
            myPs.setString(3, jemaah.getJemPass());
            myPs.setString(4, jemaah.getJemIC());
            myPs.setString(5, jemaah.getJemAge());
            myPs.setString(6, jemaah.getJemDOB());
            myPs.setString(7, jemaah.getJemAlamat());
            myPs.setString(8, jemaah.getJemDaerah());
            myPs.setString(9, jemaah.getJemMukim());
            myPs.setString(10, jemaah.getJemPoscode());
            myPs.setString(11, jemaah.getJemTel());
            myPs.setString(12, jemaah.getJemCat());

            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public static int registerJemaah(jemaah jemaah){
        int status =0;
        try{
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement("insert into jemaah (jemId,jemName,jemPass,jemIC,jemAge,jemDOB,jemalamat,jemdaerah,jemmukim,jemposcode,jemTel,jemCat) values (?,?,?,?,?,?,?,?,?,?,?,?)");
            
            ps.setInt(1, jemaah.getJemId());
            ps.setString(2, jemaah.getJemName());
            ps.setString(3, jemaah.getJemPass());
            ps.setString(4, jemaah.getJemIC());
            ps.setString(5, jemaah.getJemAge());
            ps.setString(6, jemaah.getJemDOB());
            ps.setString(7, jemaah.getJemAlamat());
            ps.setString(8, jemaah.getJemDaerah());
            ps.setString(9, jemaah.getJemMukim());
            ps.setString(10, jemaah.getJemPoscode());
            ps.setString(11, jemaah.getJemTel());
            ps.setString(12, jemaah.getJemCat());
            
            status = ps.executeUpdate();
            connection.close();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return status;
    }
    
    public static jemaah signinJemaah(String jemTel, String jemPass) {
        jemaah jemaah = null;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from jemaah where jemTel =? and jemPass=?");

            ps.setString(1, jemTel);
            ps.setString(2, jemPass);

            ResultSet result = ps.executeQuery();

            if (result.next()) {

                jemaah = new jemaah();
                jemaah.setJemId(result.getInt("jemId"));
                jemaah.setJemName(result.getString("jemName"));
                jemaah.setJemPass(result.getString("jemPass"));
                jemaah.setJemIC(result.getString("jemIC"));
                jemaah.setJemAge(result.getString("jemAge"));
                jemaah.setJemDOB(result.getString("jemDOB"));
                jemaah.setJemAlamat(result.getString("jemalamat"));
                jemaah.setJemDaerah(result.getString("jemdaerah"));
                jemaah.setJemMukim(result.getString("jemmukim"));
                jemaah.setJemPoscode(result.getString("jemposcode"));
                jemaah.setJemTel(result.getString("jemTel"));
                jemaah.setJemCat(result.getString("jemCat"));

            }
            con.close();

        } catch (SQLException ex) {
        }
        return jemaah;
    }
    
    public jemaah retrieveJemaah(String jemId) {
        jemaah jemaah = new jemaah();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from jemaah "
                    + "where jemId=" + jemId;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                jemaah.setJemId(myRs.getInt(1));
                jemaah.setJemName(myRs.getString(2));
                jemaah.setJemPass(myRs.getString(3));
                jemaah.setJemIC(myRs.getString(4));
                jemaah.setJemAge(myRs.getString(5));
                jemaah.setJemDOB(myRs.getString(6));
                jemaah.setJemAlamat(myRs.getString(7));
                jemaah.setJemDaerah(myRs.getString(8));
                jemaah.setJemMukim(myRs.getString(9));
                jemaah.setJemPoscode(myRs.getString(10));
                jemaah.setJemTel(myRs.getString(11));
                jemaah.setJemCat(myRs.getString(12));
                
                
                
            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return jemaah;
    }
    public int updateJemProfile(jemaah jemaah) {
        try {

            String mySqlQuery = "update jemaah set jemName=?,jemPass=?,jemIC=?,jemAge=?,jemDOB=?,jemalamat=?,jemdaerah=?,jemmukim=?,jemposcode=?,jemTel=?,jemCat=? where jemId =?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, jemaah.getJemName());
            myPs.setString(2, jemaah.getJemPass());
            myPs.setString(3, jemaah.getJemIC());
            myPs.setString(4, jemaah.getJemAge());
            myPs.setString(5, jemaah.getJemDOB());
            myPs.setString(6, jemaah.getJemAlamat());
            myPs.setString(7, jemaah.getJemDaerah());
            myPs.setString(8, jemaah.getJemMukim());
            myPs.setString(9, jemaah.getJemPoscode());
            myPs.setString(10, jemaah.getJemTel());
            myPs.setString(11, jemaah.getJemCat());
            myPs.setInt(12, jemaah.getJemId());

            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    public List<jemaah> totalJemaah() {
        List<jemaah> allJem = new ArrayList<jemaah>();
        jemaah jem;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select COUNT(jemId) from jemaah";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                jem = new jemaah();
                jem.setTotalJemReport(myRs.getInt(1));
               
                
                
                allJem.add(jem);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return allJem;
    }
}
