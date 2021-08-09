/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project;
import java.sql.*;
/**
 *
 * @author Admin
 */
public class loginWasing {
public static boolean validate(LoginBean bean) {
        boolean status = false;
        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement ps = connection.prepareStatement(
                    "select * from wasing where wTel=? and wpass=?");

            ps.setString(1, bean.getNotel());
            ps.setString(2, bean.getPassword());

            ResultSet rs = ps.executeQuery();
            status = rs.next();

        } catch (Exception e) {
        }

        return status;

    }

}