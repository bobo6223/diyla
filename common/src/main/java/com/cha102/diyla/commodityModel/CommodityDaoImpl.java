package com.cha102.diyla.commodityModel;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CommodityDaoImpl implements CommodityDao{
    public static DataSource ds = null;
    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/diyla");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
    }

    public void insert() {

    }


}
