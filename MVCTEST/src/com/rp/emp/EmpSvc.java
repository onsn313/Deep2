package com.rp.emp;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import com.rp.DBUtil;
import com.rp.db.DataSource;
public class EmpSvc {
//	final static Logger logger = Logger.getLogger(EmpSvc.class);
	
    public ArrayList<EmpDto> getEmpList(HttpServletRequest request) {
        Connection conn = null;
        ArrayList<EmpDto> al = null;
         
        try {
             
            conn = DataSource.getInstance().getConnection();
            //conn.setAutoCommit(false);
             
            //EmpDao dao = new EmpDao();
            EmpDao dao = EmpDao.getInstance();
            al = dao.selectEmpList(request, conn);
            System.out.println("==========="+al.get(2).toString());
             
            //conn.commit();
            //conn.setAutoCommit(true);
             
        } catch (Exception e) {
            try {
                conn.rollback();
            } catch (SQLException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
            System.out.println("error : " + e);
            e.printStackTrace(System.out);
             
        } finally {
            //관련자원 닫기
            DBUtil.closeConnection(conn);
        }
        return al;
    }
}